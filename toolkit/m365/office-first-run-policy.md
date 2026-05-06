# Microsoft 365 Apps First-Run And Account Guard

This pattern reduces Office setup friction on shared or freshly enrolled Windows devices.

## Goals

- Silent Microsoft 365 Apps deployment.
- EULA accepted through deployment configuration.
- First-run prompts suppressed where policy allows.
- Work or school account sign-in encouraged.
- Personal Microsoft account confusion reduced.
- Teams, OneDrive, Outlook, Word, Excel, and PowerPoint all land consistently.

## Policy Checklist

- Office Deployment Tool config is versioned.
- Update channel is intentional.
- Shared computer activation is explicit when needed.
- Office telemetry and privacy prompts are handled by policy.
- First-run experiences are suppressed where supported.
- Browser and Office sign-in experience points at the business tenant.
- Users receive self-service help links for password reset, MFA, and Company Portal.

## Validation

- New user opens Word without repeated EULA prompts.
- User signs in with the work account.
- OneDrive setup points to the business tenant.
- Teams launches as the work identity.
- Office update channel and version are reported in endpoint telemetry.

