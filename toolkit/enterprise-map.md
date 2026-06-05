# Enterprise Capability Map

This is the public-safe map of the work I like building: reliable endpoint operations, visible infrastructure, clean employee self-service, and documentation that makes changes repeatable.

| Area | What I Build | Enterprise Signal |
| --- | --- | --- |
| Entra ID | Device lifecycle reports, staged enrollment, app registration hygiene, tenant guardrails | Knows identity is the control plane |
| Intune | Win32 packages, detection, remediation, device configuration, compliance visibility | Can ship software and policy at scale |
| Autopilot | Enrollment guardrails, required apps, ESP tuning, first desktop reliability | Understands zero-touch onboarding risk |
| Defender | Endpoint posture, real-time protection checks, firewall state, alert readiness | Security is measured, not assumed |
| BitLocker | Encryption posture, recovery-key expectations, TPM/Secure Boot checks | Protects data and proves it |
| LAPS | Local admin lifecycle, emergency admin posture, drift visibility | Limits local privilege blast radius |
| Microsoft 365 Apps | Silent install, EULA/first-run suppression, work-account steering | Reduces help desk friction |
| Collaboration | Outlook calendar workflows, Teams-aware support, readable schedule views, consultation availability | Connects communication tools to daily operations |
| L3 Network Operations | Stable names, monitoring, alerting, log review, service health, escalation notes | Troubleshoots with evidence instead of guesswork |
| Data Center / Facilities | Asset handling, break/fix mindset, cabling discipline, device custody, physical readiness checks | Understands that infrastructure is both systems and hardware |
| Network Shares | Stable DNS aliases, mapped drives, Explorer shortcuts, role-aware access | Keeps file workflows usable |
| SharePoint / OneDrive | Document workspace design, sync health, conflict policy, retention planning | Bridges SMB and cloud collaboration |
| Health Dashboards | Deployment evidence, endpoint posture, version drift, command queue age | Turns operations into visible systems |
| PowerShell | Parser checks, dry-run switches, structured output, safe rollback | Automation that can survive production |

## My Operating Bias

- Use stable names and config, not hardcoded infrastructure.
- Deploy through managed channels, not hand-built snowflakes.
- Detect state before repairing it.
- Keep private data out of public artifacts.
- Make the next admin's job easier with evidence, rollback, and clear ownership.
