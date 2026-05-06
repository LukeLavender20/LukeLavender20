param(
    [string]$PackageId = "company-baseline-example",
    [string]$ExpectedVersion = "2026.05.06.1"
)

$ErrorActionPreference = "Stop"

$root = Join-Path $env:ProgramData "Company\IntunePackages\$PackageId"
$stateFile = Join-Path $root "install-state.json"
$registryPath = "HKLM:\SOFTWARE\Company\IntunePackages\$PackageId"

if (-not (Test-Path -LiteralPath $stateFile)) {
    Write-Host "Missing state file: $stateFile"
    exit 1
}

if (-not (Test-Path -LiteralPath $registryPath)) {
    Write-Host "Missing registry state: $registryPath"
    exit 1
}

$version = (Get-ItemProperty -LiteralPath $registryPath -Name Version -ErrorAction Stop).Version
if ($version -ne $ExpectedVersion) {
    Write-Host "Version mismatch. Expected $ExpectedVersion, found $version"
    exit 1
}

Write-Host "Detected $PackageId $ExpectedVersion"
exit 0

