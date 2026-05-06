param(
    [string]$ConfigPath = (Join-Path $PSScriptRoot "resources.example.json")
)

$ErrorActionPreference = "Stop"

$config = Get-Content -Raw -LiteralPath $ConfigPath | ConvertFrom-Json
$root = Join-Path $env:ProgramData "Company\EmployeeResources"
New-Item -ItemType Directory -Force -Path $root | Out-Null

$shell = New-Object -ComObject WScript.Shell

foreach ($item in $config.Shortcuts) {
    $base = switch ($item.Location) {
        "PublicDesktop" { [Environment]::GetFolderPath("CommonDesktopDirectory") }
        "StartMenu" { Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs" }
        default { throw "Unsupported shortcut location: $($item.Location)" }
    }

    $shortcutPath = Join-Path $base "$($item.Name).lnk"
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $item.Target
    $shortcut.Description = $item.Name
    $shortcut.Save()
}

$favoritesPath = Join-Path $root "browser-favorites.json"
$config.BrowserFavorites | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $favoritesPath -Encoding UTF8

$zoneRoot = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains"
foreach ($site in $config.TrustedSites) {
    $path = Join-Path $zoneRoot $site
    New-Item -ItemType Directory -Force -Path $path | Out-Null
    New-ItemProperty -LiteralPath $path -Name "https" -PropertyType DWord -Value 1 -Force | Out-Null
    New-ItemProperty -LiteralPath $path -Name "http" -PropertyType DWord -Value 1 -Force | Out-Null
}

[ordered]@{
    Version = $config.Version
    InstalledUtc = (Get-Date).ToUniversalTime().ToString("o")
    ShortcutCount = @($config.Shortcuts).Count
    FavoriteCount = @($config.BrowserFavorites).Count
    TrustedSiteCount = @($config.TrustedSites).Count
} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $root "install-state.json") -Encoding UTF8

Write-Host "Installed employee resources version $($config.Version)"

