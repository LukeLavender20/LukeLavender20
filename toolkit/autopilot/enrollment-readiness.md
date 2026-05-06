# Autopilot Enrollment Readiness

Autopilot should get a user to a working desktop. The enrollment process is not successful just because a device object exists.

## Readiness Checklist

- Autopilot profile assignment is confirmed.
- Enrollment Status Page is tuned for the real required apps.
- Required apps are small enough and reliable enough for first login.
- Network requirements are documented for remote users.
- Company Portal is available after desktop.
- Office install does not trap users in repeated EULA or personal-account prompts.
- OneDrive, Teams, browser favorites, and self-service links appear without manual setup.
- Security baselines report before they aggressively block.
- Break-glass or emergency support path exists for failed enrollment.
- Known-sensitive pilot devices are excluded until the process is proven.

## First-Desktop Validation

| Check | Expected Result |
| --- | --- |
| User reaches desktop | No enrollment dead end |
| Company Portal opens | User can install approved apps |
| Office opens | Work account is used, no repeated EULA loop |
| Browser favorites exist | Start, status, help, and files are visible |
| Share shortcuts exist | Stable DNS names are used |
| Endpoint telemetry runs | Device reports posture after enrollment |
| BitLocker starts | Recovery-key flow is understood |
| Defender is active | Real-time protection is on |

## Rollout Rule

Pilot the full first-desktop experience before forcing broad enrollment. A broken enrollment experience at scale is more expensive than waiting for proof.

