# Hi, I'm Luke

I build practical IT systems that make businesses easier to run: Microsoft 365, Entra ID, Intune, Autopilot, Defender, BitLocker, LAPS, endpoint telemetry, network shares, internal web apps, inventory/workflow tools, and AI-assisted document processing.

My main work is a full operations platform for a production business. It connects office staff, installers, inventory, customer/job records, documents, Microsoft 365, endpoint deployment, network health, and self-service support into one managed environment.

## Toolkit Highlights

I keep sanitized examples of the enterprise patterns I use in [`toolkit/`](toolkit/README.md):

- [`Enterprise capability map`](toolkit/enterprise-map.md): Entra, Intune, Autopilot, Defender, BitLocker, LAPS, M365 Apps, network shares, SharePoint, health dashboards, and PowerShell quality.
- [`Repo map`](REPO-MAP.md): where everything lives and why.
- [`Intune Win32 package pattern`](toolkit/intune/win32-package-pattern): install, detection, repair, validation, package metadata, and rollback notes.
- [`Autopilot enrollment readiness`](toolkit/autopilot/enrollment-readiness.md): first-desktop reliability checks and enrollment guardrails.
- [`Employee resources package`](toolkit/intune/employee-resources): managed favorites, desktop shortcuts, Start Menu shortcuts, trusted sites, and self-service entry points.
- [`Network share mapping`](toolkit/intune/share-mapping): stable DNS names, SMB mappings, Explorer shortcuts, and detection logic.
- [`Endpoint posture telemetry`](toolkit/endpoint-telemetry): read-only Windows, Defender, Firewall, BitLocker, TPM, Secure Boot, Office, Teams, browser, and Intune Management Extension reporting.
- [`Entra device lifecycle`](toolkit/entra/entra-device-lifecycle.md): managed, Entra-only, stale, orphaned, Autopilot, and excluded-pilot states.
- [`Conditional Access and MFA rollout`](toolkit/entra/conditional-access-mfa-rollout.md): staged identity security with report-only proof.
- [`Windows security baseline`](toolkit/security/windows-security-baseline.md): Defender, Firewall, BitLocker, TPM, Secure Boot, LAPS, updates, and compliance visibility.
- [`Microsoft Graph reporting`](toolkit/microsoft-graph): read-only device lifecycle reporting pattern.
- [`Customer/job document workspace`](toolkit/sharepoint/customer-job-workspace.md): SMB-to-SharePoint file organization model.
- [`Printer deployment`](toolkit/printers/printer-deployment.md): versioned printer package and detection model.
- [`Managed software catalog`](toolkit/software-catalog): package ownership, assignment, detection, updates, and rollback.
- [`Deployment evidence template`](toolkit/health/deployment-evidence-template.md): the audit trail I expect before broad rollout.
- [`Network/endpoint handoff template`](toolkit/network/joint-change-handoff-template.md): owner, rollback, verification, and evidence for cross-domain changes.
- [`Public website UX case study`](case-studies/public-website-ux-proof.md): mobile-first service discovery, tap-friendly detail panels, crawlable service pages, and proof-driven deployment checks.

## What I Work On

- Microsoft 365 and Intune deployment: Autopilot planning, Company Portal apps, Win32 app packaging, Office configuration, browser bookmarks, employee shortcuts, trusted sites, endpoint telemetry, and Entra/Intune device visibility reporting.
- Windows endpoint operations: Defender, BitLocker, Firewall, Windows Update, TPM/Secure Boot, LAPS, browser health, Office/Teams versions, inventory, drift detection, and quiet self-healing packages.
- Network and infrastructure operations: stable DNS names, SMB shares, monitoring, alerting, uptime checks, switch/router observability, and employee-friendly entry points.
- Business workflow software: desktop, web, and mobile tools for customer/job tracking, inventory receiving, installer assignment, photos/proof, scheduling, and reporting.
- DocumentAI and automation: document intake, classification, extraction, cleanup review, operational summaries, and human-in-the-loop controls.
- Operational documentation: runbooks, deployment evidence, rollback plans, health dashboards, and admin handoff notes.

## Selected Projects

### Small Business Operations Platform

Built a multi-app operations system for a cabinetry workflow:
- Desktop admin app for office operations.
- ASP.NET Core web app for admin workflows and installer APIs.
- Mobile installer app for assigned work, status updates, photos, and offline sync.
- Mongo-backed data model for customers, jobs, items, orders, inventory, updates, files, and telemetry.
- Health and activity dashboards to make issues visible before they become support calls.

### Microsoft 365 / Intune Endpoint Baseline

Built managed deployment packages for employee devices:
- Microsoft 365 Apps install and first-run guardrails.
- Office sign-in policy to steer users to work accounts instead of personal accounts.
- Managed browser favorites and employee self-service shortcuts.
- Stable share shortcuts and mapped resources using DNS names instead of hardcoded server details.
- Endpoint telemetry package reporting Windows, Defender, Firewall, BitLocker, TPM/Secure Boot, browsers, Office, Teams, and Intune Management Extension health.
- Read-only Entra/Intune reconciliation reports for stale, missing, and unmanaged devices.

### Network Operations And Monitoring

Helped build an operations model around stable internal names, monitoring, and evidence:
- Employee-friendly start/status/wifi/share entry points.
- Stable SMB/share names for office, scans, CNC, and design workflows.
- Monitoring and dashboard patterns for reachability, service health, command queues, endpoint versions, and wrong-network detection.
- Change-control notes separating network ownership from Microsoft 365/endpoint ownership.

### Enterprise-Style Deployment Evidence

I document broad changes like production work, not one-off fixes:
- Package version and owned state.
- Detection command and validation output.
- Assignment scope and pilot result.
- Rollback path.
- Health/dashboard evidence.
- Known risks and next verification point.

### DocumentAI

Built workflow support for document-heavy operations:
- Document intake and classification.
- Extraction and cleanup review flows.
- Proposal/dry-run review patterns before committing changes.
- Human review checkpoints for risk, grouping, and disposition decisions.
- Operational summaries that turn messy file/document states into actionable work queues.

### Public Website UX And Proof

Built a public service website experience focused on fast mobile discovery:
- Mobile-first homepage flow for visitors arriving from social or direct links.
- Tap-friendly service cards and modal detail panels to avoid long scrolling pages.
- Crawlable service pages with clear service positioning and structured content.
- Interactive educational demos that explain technical concepts without exposing private systems.
- Deployment proof checks for headers, asset versions, mobile overflow, browser behavior, and screenshots.

### AI-Assisted Operations Assistant

Built an internal assistant pattern for business operations:
- Direct answers first, with workflow routing only when a real task needs records or proof.
- Behind-the-scenes worker routing for implementation, critique, document work, and human-tone review.
- No-fake-action rules: the assistant reports what changed only when a system of record proves it.
- Human-readable summaries with blockers, owner, proof, and next action instead of raw tool output.

## How I Work

- I prefer boring, reliable systems: versioned packages, detection scripts, rollback paths, and deployment evidence.
- I separate live infrastructure changes from endpoint/app deployment so ownership and rollback are clear.
- I document the reason for each change, not just the command that made it.
- I build self-service first when possible: employees should get to the right app, share, printer, help page, or request form without needing an IT person.
- I treat automation as production work: it needs validation, observability, and a safe failure mode.

## Tech I Use

Windows, PowerShell, Microsoft Graph, Entra ID, Intune, Microsoft 365 Apps, Defender, BitLocker, LAPS, ASP.NET Core, Razor Pages, .NET desktop apps, MAUI, MongoDB, Azure, Linux, Docker, Grafana, Prometheus, Loki, Uptime Kuma, Ansible, SMB, DNS, and AI-assisted document workflows.
