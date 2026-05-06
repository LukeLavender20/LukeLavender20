param(
    [string]$OutputPath = ".\device-lifecycle-report.json",
    [int]$StaleDays = 30
)

$ErrorActionPreference = "Stop"

if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Authentication)) {
    throw "Install Microsoft.Graph before running this example."
}

Import-Module Microsoft.Graph.Authentication

$context = Get-MgContext
if (-not $context) {
    Connect-MgGraph -Scopes "Device.Read.All", "DeviceManagementManagedDevices.Read.All"
    $context = Get-MgContext
}

Write-Host "Connected tenant: $($context.TenantId)"
Write-Host "Scopes: $($context.Scopes -join ', ')"

function Invoke-GraphPagedGet {
    param([Parameter(Mandatory)][string]$Uri)

    $items = New-Object System.Collections.Generic.List[object]
    $next = $Uri
    while ($next) {
        $response = Invoke-MgGraphRequest -Method GET -Uri $next
        foreach ($item in @($response.value)) {
            $items.Add($item)
        }

        $next = $response.'@odata.nextLink'
    }

    return @($items)
}

$entraDevices = Invoke-GraphPagedGet -Uri "https://graph.microsoft.com/v1.0/devices?`$select=id,deviceId,displayName,operatingSystem,approximateLastSignInDateTime,accountEnabled"
$managedDevices = Invoke-GraphPagedGet -Uri "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices?`$select=id,deviceName,azureADDeviceId,operatingSystem,lastSyncDateTime,userPrincipalName,complianceState,managementAgent"

$managedByAzureId = @{}
foreach ($device in $managedDevices) {
    if (-not [string]::IsNullOrWhiteSpace($device.azureADDeviceId)) {
        $managedByAzureId[$device.azureADDeviceId] = $device
    }
}

$cutoff = (Get-Date).ToUniversalTime().AddDays(-1 * $StaleDays)
$rows = foreach ($device in $entraDevices) {
    if ($device.operatingSystem -notmatch "Windows") { continue }

    $managed = $managedByAzureId[$device.deviceId]
    $lastSignIn = if ($device.approximateLastSignInDateTime) { [DateTimeOffset]$device.approximateLastSignInDateTime } else { $null }
    $lastSync = if ($managed.lastSyncDateTime) { [DateTimeOffset]$managed.lastSyncDateTime } else { $null }

    [ordered]@{
        EntraDisplayName = $device.displayName
        EntraDeviceId = $device.deviceId
        AccountEnabled = $device.accountEnabled
        LastEntraSignInUtc = $lastSignIn
        IntuneManaged = [bool]$managed
        IntuneDeviceName = $managed.deviceName
        IntuneLastSyncUtc = $lastSync
        ComplianceState = $managed.complianceState
        ManagementAgent = $managed.managementAgent
        LifecycleState = if (-not $managed) {
            "EntraOnly"
        } elseif ($lastSync -and $lastSync.UtcDateTime -lt $cutoff) {
            "StaleManaged"
        } else {
            "Managed"
        }
    }
}

$report = [ordered]@{
    SchemaVersion = "2026.05.06.1"
    ExportedUtc = (Get-Date).ToUniversalTime().ToString("o")
    StaleDays = $StaleDays
    TenantId = $context.TenantId
    Counts = [ordered]@{
        WindowsEntraDevices = @($rows).Count
        Managed = @($rows | Where-Object LifecycleState -eq "Managed").Count
        EntraOnly = @($rows | Where-Object LifecycleState -eq "EntraOnly").Count
        StaleManaged = @($rows | Where-Object LifecycleState -eq "StaleManaged").Count
    }
    Devices = @($rows)
}

$report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Host "Wrote $OutputPath"
