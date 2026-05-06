param(
    [string]$PackageId = "company-baseline-example",
    [string]$Version = "2026.05.06.1"
)

$ErrorActionPreference = "Stop"

$install = Join-Path $PSScriptRoot "install.ps1"
& $install -PackageId $PackageId -Version $Version

Write-Host "Repair completed for $PackageId $Version"

