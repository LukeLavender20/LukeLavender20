# Windows Security Baseline

This baseline is intentionally generic. It shows the posture categories I want visible on every managed Windows device.

## Required Visibility

- Entra join state.
- Intune management state.
- Defender antivirus enabled.
- Defender real-time protection enabled.
- Windows Firewall service running.
- BitLocker protection status.
- Recovery key escrow expectation.
- TPM present.
- Secure Boot enabled.
- Windows Update service running.
- Pending reboot state.
- Local admin posture.
- LAPS policy state.
- Browser versions.
- Microsoft 365 Apps channel and version.
- Teams install state.

## Policy Areas

- Defender Antivirus and cloud-delivered protection.
- Attack surface reduction rules.
- Firewall profiles.
- BitLocker encryption and recovery key handling.
- Windows LAPS for local administrator lifecycle.
- Automatic updates and restart policy.
- Standard user default with explicit emergency-admin design.
- Device compliance policy that reports before it blocks.

## Operational Rule

Security posture should be visible before enforcement becomes aggressive. Report-only or pilot first, then enforce once false positives are understood.

