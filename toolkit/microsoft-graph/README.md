# Microsoft Graph Operations

Graph scripts should be read-only by default, explicit when changing state, and easy to audit.

## Script Standards

- Use least-privilege scopes.
- Print the tenant and user context before writes.
- Support `-WhatIf` or a dry-run mode for state changes.
- Export JSON and CSV evidence.
- Never embed tenant IDs, app IDs, secrets, user names, or customer names in public code.

## Common Reports

- Entra devices without Intune managed-device records.
- Intune managed devices not seen recently.
- Device compliance by category.
- App install status by package.
- BitLocker recovery key escrow gaps.
- Users missing MFA/passwordless registration.
- Licenses assigned vs available.

