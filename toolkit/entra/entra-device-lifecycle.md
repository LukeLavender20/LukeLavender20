# Entra / Intune Device Lifecycle

This is a public-safe device lifecycle model for Microsoft 365 environments.

## Device States

| State | Meaning | Action |
| --- | --- | --- |
| Entra-only | Device exists in Entra ID but is not Intune managed | Investigate enrollment path before enforcing policy |
| Intune-managed | Device has an Intune managed device record | Apply compliance, app, and posture baselines |
| Stale managed | Intune record exists but has not checked in recently | Confirm owner, retire only after evidence review |
| Orphaned directory device | Entra device has no current owner or endpoint record | Review before delete |
| Autopilot registered | Hardware hash exists and is ready for zero-touch | Keep profile assignment and ESP tested |
| Excluded pilot | Known sensitive device intentionally held back | Track with an expiration date |

## Audit Questions

- How many Windows devices exist in Entra ID?
- How many are actually Intune managed?
- Which devices are Entra-only?
- Which managed devices are stale?
- Which users own multiple devices?
- Which devices are missing BitLocker, Defender, or compliance signals?
- Which devices should be excluded from enrollment until the process is proven?

## Change Rule

Do read-only inventory first. Do not delete, retire, force enroll, or change ownership until the device state has a named owner and rollback note.

