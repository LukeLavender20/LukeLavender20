# Printer Deployment Pattern

Printer deployment should be treated like any other endpoint package: versioned, detected, repairable, and documented.

## Package-Owned State

- Printer driver or universal print queue.
- Printer queue name.
- Default printer policy when appropriate.
- Location metadata.
- Detection marker and version.
- Uninstall or rollback notes.

## Deployment Options

| Option | Use When |
| --- | --- |
| Universal Print | Cloud-managed environment, supported printers, low driver complexity |
| Intune Win32 package | Driver install or legacy print workflow is required |
| PowerShell queue deployment | You need custom detection and repair |
| Group targeting | Role or location-specific printers |

## Detection Checks

- Queue exists.
- Port or cloud queue target is correct.
- Driver is installed when required.
- Test page path is known.
- Package version marker is current.

## Safety Rules

- Do not remove unknown user-created printers.
- Do not force a default printer unless the role requires it.
- Keep printer deployment separate from network-side print server changes.
- Record evidence after pilot and broad assignment.

