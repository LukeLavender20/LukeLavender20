# PowerShell Automation Quality Standard

Production scripts should be safe to run twice, easy to validate, and loud only when something matters.

## Required Habits

- `Set-StrictMode -Version Latest` when practical.
- `$ErrorActionPreference = "Stop"` for deployment scripts.
- `-WhatIf`, `-Confirm`, or explicit dry-run mode for writes.
- Parser validation before packaging.
- Structured JSON output for evidence.
- No secrets in source.
- No tenant, domain, IP, device, or employee identifiers in public examples.
- Clear exit codes for Intune detection scripts.
- Rollback notes next to install logic.

## Script Shape

```powershell
param(
    [switch]$WhatIf,
    [string]$OutputPath = ".\evidence.json"
)

$ErrorActionPreference = "Stop"

$evidence = [ordered]@{
    StartedUtc = (Get-Date).ToUniversalTime().ToString("o")
    WhatIf = [bool]$WhatIf
    Actions = @()
}

# Discover first, change second, record always.

$evidence.CompletedUtc = (Get-Date).ToUniversalTime().ToString("o")
$evidence | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
```

