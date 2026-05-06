param(
    [string]$PackageName = "Company Baseline Example",
    [string]$PackageId = "company-baseline-example",
    [string]$Version = "2026.05.06.1"
)

$ErrorActionPreference = "Stop"

$root = Join-Path $env:ProgramData "Company\IntunePackages\$PackageId"
$shortcutPath = Join-Path ([Environment]::GetFolderPath("CommonDesktopDirectory")) "Company Portal.lnk"
$registryPath = "HKLM:\SOFTWARE\Company\IntunePackages\$PackageId"

New-Item -ItemType Directory -Force -Path $root | Out-Null
New-Item -ItemType Directory -Force -Path $registryPath | Out-Null

$metadata = [ordered]@{
    PackageName = $PackageName
    PackageId = $PackageId
    Version = $Version
    InstalledUtc = (Get-Date).ToUniversalTime().ToString("o")
    ComputerName = $env:COMPUTERNAME
}

$metadata | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $root "install-state.json") -Encoding UTF8
Set-ItemProperty -LiteralPath $registryPath -Name Version -Value $Version -Type String
Set-ItemProperty -LiteralPath $registryPath -Name InstalledUtc -Value $metadata.InstalledUtc -Type String

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "ms-windows-store://pdp/?ProductId=9WZDNCRFJ3PZ"
$shortcut.Description = "Open Company Portal"
$shortcut.Save()

Write-Host "Installed $PackageName version $Version"

