# Deployment Evidence: Example Package

## Summary

- Package: Example Package
- Version: 2026.05.06.1
- Owner: Endpoint Engineering
- Platform: Microsoft Intune Win32 app
- Assignment: Required to pilot group, then all managed Windows devices
- Change window: Business-hours safe, quiet install

## Validation

- Package file validation: PASS
- PowerShell parser validation: PASS
- Detection logic validation: PASS
- Test device install: PASS
- Test device detection: PASS
- Rollback tested: PASS

## Rollback

1. Unassign the Intune app from production groups.
2. Assign rollback or uninstall package if package-owned state must be removed.
3. Confirm detection no longer reports the package on pilot devices.
4. Leave user data and non-package-owned settings untouched.

## Evidence To Attach

- Intune app ID or package ID.
- Package version.
- Assignment group.
- Install command.
- Detection command.
- Validation output.
- Pilot device result.
- Known limitations.

