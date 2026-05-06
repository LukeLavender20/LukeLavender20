$ErrorActionPreference = "Stop"

$required = @(
    "install.ps1",
    "detect.ps1",
    "repair.ps1",
    "PackageMetadata.json"
)

foreach ($file in $required) {
    $path = Join-Path $PSScriptRoot $file
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Missing required package file: $file"
    }
}

$metadata = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot "PackageMetadata.json") | ConvertFrom-Json
if ([string]::IsNullOrWhiteSpace($metadata.Version)) {
    throw "PackageMetadata.json must include Version."
}

foreach ($script in @("install.ps1", "detect.ps1", "repair.ps1")) {
    $tokens = $null
    $errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $script), [ref]$tokens, [ref]$errors) | Out-Null
    if ($errors.Count -gt 0) {
        throw "$script has PowerShell parser errors: $($errors[0].Message)"
    }
}

Write-Host "PASS: package validates."

