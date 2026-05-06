param(
    [string]$ConfigPath = (Join-Path $PSScriptRoot "share-map.example.json")
)

$ErrorActionPreference = "Stop"

$config = Get-Content -Raw -LiteralPath $ConfigPath | ConvertFrom-Json
$shortcutRoot = Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Company Shares"

foreach ($mapping in $config.Mappings) {
    $shortcutPath = Join-Path $shortcutRoot "$($mapping.Name).lnk"
    if (-not (Test-Path -LiteralPath $shortcutPath)) {
        Write-Host "Missing shortcut: $shortcutPath"
        exit 1
    }

    if (-not [string]::IsNullOrWhiteSpace($mapping.DriveLetter)) {
        $letter = "$($mapping.DriveLetter):"
        $existing = Get-SmbMapping -LocalPath $letter -ErrorAction SilentlyContinue
        if (-not $existing -or $existing.RemotePath -ne $mapping.Path) {
            Write-Host "Drive mapping mismatch for $letter"
            exit 1
        }
    }
}

Write-Host "Detected share map version $($config.Version)"
exit 0

