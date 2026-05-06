# Intune Patterns

Enterprise endpoint work is only reliable when packages are versioned, detectable, reversible, and boring to operate.

## Package Shape

Each package should include:

- `install.ps1`: applies package-owned state.
- `detect.ps1`: returns success only when package-owned state is correct.
- `repair.ps1`: reapplies safe state and reports drift.
- `validate.ps1`: checks package files before upload.
- `PackageMetadata.json`: version, owner, assignment intent, rollback, and evidence notes.

## Common Baselines

- Microsoft 365 Apps install and first-run suppression.
- Edge/Chrome managed favorites.
- Desktop and Start Menu shortcuts for self-service resources.
- Trusted intranet zone entries for internal web and SMB resources.
- Share mapping and Explorer shortcut deployment.
- Endpoint posture telemetry.
- Defender, Firewall, BitLocker, LAPS, Windows Update, and compliance visibility.

