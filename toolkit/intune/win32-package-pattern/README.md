# Intune Win32 Package Pattern

This is the package layout I prefer for Intune Win32 apps.

## Files

- `install.ps1`: creates package-owned state.
- `detect.ps1`: exits `0` only when package-owned state is present and current.
- `repair.ps1`: reapplies safe package state.
- `validate.ps1`: parser and metadata validation before upload.
- `PackageMetadata.json`: owner, version, scope, rollback, and evidence.

## Why This Matters

Intune packages fail quietly when detection is weak. This pattern makes state ownership explicit so a package can be deployed, audited, repaired, and rolled back without guessing what it touched.

## Upload Command Shape

```powershell
IntuneWinAppUtil.exe -c .\win32-package-pattern -s install.ps1 -o .\out
```

## Detection Command Shape

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\detect.ps1 -ExpectedVersion 2026.05.06.1
```

## Install Command Shape

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\install.ps1 -Version 2026.05.06.1
```

