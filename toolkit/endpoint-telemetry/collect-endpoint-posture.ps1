$ErrorActionPreference = "SilentlyContinue"

function Test-ServiceRunning {
    param([string]$Name)
    $service = Get-Service -Name $Name -ErrorAction SilentlyContinue
    if (-not $service) { return $false }
    return $service.Status -eq "Running"
}

$bitLocker = Get-BitLockerVolume -MountPoint $env:SystemDrive
$defender = Get-MpComputerStatus
$computer = Get-ComputerInfo
$office = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
$imePath = Join-Path $env:ProgramFiles "Microsoft Intune Management Extension\Microsoft.Management.Services.IntuneWindowsAgent.exe"

$posture = [ordered]@{
    SchemaVersion = "2026.05.06.1"
    CollectedUtc = (Get-Date).ToUniversalTime().ToString("o")
    ComputerName = $env:COMPUTERNAME
    Windows = [ordered]@{
        ProductName = $computer.WindowsProductName
        Version = $computer.WindowsVersion
        Build = $computer.OsBuildNumber
        InstallDate = $computer.WindowsInstallDateFromRegistry
    }
    Security = [ordered]@{
        DefenderRealTimeProtection = [bool]$defender.RealTimeProtectionEnabled
        DefenderAntivirusEnabled = [bool]$defender.AntivirusEnabled
        FirewallServiceRunning = Test-ServiceRunning -Name "mpssvc"
        BitLockerProtectionStatus = $bitLocker.ProtectionStatus.ToString()
        BitLockerVolumeStatus = $bitLocker.VolumeStatus.ToString()
        TpmPresent = (Get-Tpm).TpmPresent
        SecureBootEnabled = Confirm-SecureBootUEFI
    }
    Management = [ordered]@{
        IntuneManagementExtensionInstalled = Test-Path -LiteralPath $imePath
        IntuneManagementExtensionRunning = Test-ServiceRunning -Name "IntuneManagementExtension"
        WindowsUpdateServiceRunning = Test-ServiceRunning -Name "wuauserv"
        PendingReboot = Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending"
    }
    Apps = [ordered]@{
        OfficeVersion = $office.VersionToReport
        OfficeChannel = $office.UpdateChannel
        EdgeVersion = (Get-Item "$env:ProgramFiles (x86)\Microsoft\Edge\Application\msedge.exe").VersionInfo.ProductVersion
        TeamsInstalled = [bool](Get-AppxPackage -Name "MSTeams" -AllUsers)
    }
}

$posture | ConvertTo-Json -Depth 8

