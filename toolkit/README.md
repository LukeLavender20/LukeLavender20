# Enterprise IT Automation Toolkit

This folder contains sanitized examples of the patterns I use for production IT operations. The examples are intentionally generic: fake tenant names, fake domains, fake app metadata, and no customer data.

## What This Shows

- Enterprise capability map: [`enterprise-map.md`](enterprise-map.md)
- Machine-readable toolkit index: [`manifest.json`](manifest.json)
- Microsoft Intune Win32 app packaging with install, detection, repair, validation, and evidence.
- Employee resource deployment: browser favorites, desktop shortcuts, Start Menu shortcuts, trusted sites, and share entry points.
- Network share mapping that uses stable DNS names instead of raw IP addresses.
- Endpoint posture collection for Windows, Defender, Firewall, BitLocker, TPM, Secure Boot, browser, Office, Teams, and Intune Management Extension health.
- Deployment evidence templates that make broad changes auditable and reversible.
- Network/endpoint handoff templates for work that crosses ownership boundaries.

## Start Here

| Need | Open |
| --- | --- |
| Show enterprise capability breadth | [`enterprise-map.md`](enterprise-map.md) |
| Build an Intune Win32 package | [`intune/win32-package-pattern`](intune/win32-package-pattern) |
| Make enrollment less fragile | [`autopilot/enrollment-readiness.md`](autopilot/enrollment-readiness.md) |
| Deploy bookmarks, shortcuts, and trusted sites | [`intune/employee-resources`](intune/employee-resources) |
| Map shares with stable DNS names | [`intune/share-mapping`](intune/share-mapping) |
| Collect endpoint posture | [`endpoint-telemetry`](endpoint-telemetry) |
| Audit Entra vs Intune device lifecycle | [`entra/entra-device-lifecycle.md`](entra/entra-device-lifecycle.md) |
| Stage Conditional Access and MFA | [`entra/conditional-access-mfa-rollout.md`](entra/conditional-access-mfa-rollout.md) |
| Think through Windows security posture | [`security/windows-security-baseline.md`](security/windows-security-baseline.md) |
| Control Office first-run friction | [`m365/office-first-run-policy.md`](m365/office-first-run-policy.md) |
| Use Graph safely | [`microsoft-graph`](microsoft-graph) |
| Plan customer/job file workspaces | [`sharepoint/customer-job-workspace.md`](sharepoint/customer-job-workspace.md) |
| Deploy printers cleanly | [`printers/printer-deployment.md`](printers/printer-deployment.md) |
| Track managed software | [`software-catalog`](software-catalog) |
| Document production deployments | [`health/deployment-evidence-template.md`](health/deployment-evidence-template.md) |

## Design Standard

Every production package should answer five questions:

1. What state does this package own?
2. How does detection prove that state exists?
3. How can it repair drift without damaging user data?
4. How can an admin validate it before assignment?
5. What evidence proves what changed, when, and how to roll it back?

These examples are resume-safe versions of that operating model.
