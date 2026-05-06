param(
    [string]$ConfigPath = (Join-Path $PSScriptRoot "share-map.example.json")
)

$ErrorActionPreference = "Stop"

$config = Get-Content -Raw -LiteralPath $ConfigPath | ConvertFrom-Json
$root = Join-Path $env:ProgramData "Company\ShareMapping"
$shortcutRoot = Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Company Shares"
New-Item -ItemType Directory -Force -Path $root, $shortcutRoot | Out-Null

$shell = New-Object -ComObject WScript.Shell
$results = New-Object System.Collections.Generic.List[object]

foreach ($mapping in $config.Mappings) {
    $shortcutPath = Join-Path $shortcutRoot "$($mapping.Name).lnk"
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $mapping.Path
    $shortcut.Description = $mapping.Description
    $shortcut.Save()

    if (-not [string]::IsNullOrWhiteSpace($mapping.DriveLetter)) {
        $letter = "$($mapping.DriveLetter):"
        $existing = Get-SmbMapping -LocalPath $letter -ErrorAction SilentlyContinue
        if ($existing -and $existing.RemotePath -ne $mapping.Path) {
            Remove-SmbMapping -LocalPath $letter -Force -UpdateProfile
        }

        if (-not (Get-SmbMapping -LocalPath $letter -ErrorAction SilentlyContinue)) {
            New-SmbMapping -LocalPath $letter -RemotePath $mapping.Path -Persistent $true | Out-Null
        }
    }

    $results.Add([ordered]@{
        Name = $mapping.Name
        DriveLetter = $mapping.DriveLetter
        Path = $mapping.Path
        Shortcut = $shortcutPath
    })
}

[ordered]@{
    Version = $config.Version
    InstalledUtc = (Get-Date).ToUniversalTime().ToString("o")
    Mappings = $results
} | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $root "install-state.json") -Encoding UTF8

Write-Host "Installed share mappings version $($config.Version)"

