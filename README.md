# Hi, I'm Luke

I build and support small-business IT systems across Microsoft 365, Intune endpoint management, Windows automation, internal workflow apps, and network operations.

My main project is a small-business operations platform that supports job tracking, inventory, scheduling, field updates, documents, endpoint deployment, and support workflows.

## Current Direction

My strongest fit is hands-on IT operations work: endpoint management, Microsoft 365/collaboration support, L3-style troubleshooting, and network operations roles, with facilities-adjacent hardware and device-custody readiness. My path moved from Cisco networking fundamentals into servers, break/fix support, endpoint operations, Microsoft 365, internal application support, and production workflow systems.

## Toolkit Highlights

I keep sanitized examples of the enterprise patterns I use in [`toolkit/`](toolkit/README.md). Good starting points:

- [`Enterprise capability map`](toolkit/enterprise-map.md): the work areas this portfolio is organized around.
- [`Intune Win32 package pattern`](toolkit/intune/win32-package-pattern): install, detection, repair, validation, package metadata, and rollback notes.
- [`Endpoint posture telemetry`](toolkit/endpoint-telemetry): read-only Windows, Defender, Firewall, BitLocker, TPM, Secure Boot, Office, Teams, browser, and Intune agent reporting.
- [`Microsoft 365 / Intune endpoint management`](case-studies/microsoft-365-intune-endpoint-management.md): deployment patterns, employee self-service, and endpoint visibility.
- [`Network operations observability`](case-studies/network-operations-observability.md): stable names, monitoring, ownership handoffs, and evidence-driven troubleshooting.
- [`Small business operations platform`](case-studies/operations-platform.md): internal workflow software, inventory, scheduling, documents, and reporting.
- [`Operator scheduling and inventory UX`](case-studies/operator-scheduling-inventory-ux.md): calendar availability, in-place event editing, quarter-hour scheduling, custody workflows, and regression proof.
- [`AI-assisted operations assistant`](case-studies/ai-assisted-operations-assistant.md): request classification, approved tool use, audit-friendly responses, and validation before claiming changes.
- [`Public redaction checklist`](redaction/public-redaction-checklist.md): how private operational data stays out of public work.

## What I Work On

- Microsoft 365 and Intune deployment: Autopilot planning, Company Portal apps, Win32 app packaging, Office configuration, browser bookmarks, employee shortcuts, trusted sites, endpoint telemetry, and Entra/Intune device visibility reporting.
- Windows endpoint operations: Defender, BitLocker, Firewall, Windows Update, TPM/Secure Boot, LAPS, browser health, Office/Teams versions, inventory, drift detection, repair-capable packages, validation, rollback notes, and controlled remediation.
- Network and infrastructure operations: stable DNS names, SMB shares, monitoring, alerting, uptime checks, switch/router observability, and employee-friendly entry points.
- Business workflow software: desktop, web, and mobile tools for customer/job tracking, inventory receiving, custody/assignment, photos/proof, scheduling, calendar editing, role-based availability, and reporting.
- DocumentAI and automation: document intake, classification, extraction, cleanup review, operational summaries, and human-in-the-loop controls.
- Operational documentation: runbooks, deployment evidence, rollback plans, health dashboards, and admin handoff notes.

## Selected Projects

### Small Business Operations Platform

Built a multi-app operations system for a field-service production workflow:
- Desktop admin app for office operations.
- ASP.NET Core web app for admin workflows and field APIs.
- Mobile field app for assigned work, status updates, photos, and offline sync.
- Mongo-backed data model for customers, jobs, items, orders, inventory, updates, files, and telemetry.
- Health and activity dashboards to make issues visible before they become support calls.
- Scheduling dashboard with in-place calendar event editing, day-scoped event lists, quarter-hour time selection, absence normalization, and role-based availability windows.
- Inventory workflows for receiving, custody/assignment, and validating the in-page modal path with regression tests and deployment proof.

### Microsoft 365 / Intune Endpoint Baseline

Built managed deployment packages for employee devices:
- Microsoft 365 Apps install and first-run guardrails.
- Office sign-in policy to steer users to work accounts instead of personal accounts.
- Managed browser favorites and employee self-service shortcuts.
- Stable share shortcuts and mapped resources using DNS names instead of hardcoded server details.
- Endpoint telemetry package reporting Windows, Defender, Firewall, BitLocker, TPM/Secure Boot, browsers, Office, Teams, and Intune Management Extension health.
- Read-only Entra/Intune reconciliation reports for stale, missing, and unmanaged devices.

### Network Operations and Monitoring

Helped build an operations model around stable internal names, monitoring, and evidence:
- Employee-friendly start/status/wifi/share entry points.
- Stable SMB/share names for office files, scanned documents, department workflows, and specialized production resources.
- Monitoring and dashboard patterns for reachability, service health, command queues, endpoint versions, and wrong-network detection.
- Change-control notes separating network ownership from Microsoft 365/endpoint ownership.
- Authorized activity summaries for support and audit review, with proof links behind operational events instead of raw log noise.

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
- Classifies requests and answers directly when no live action is needed.
- Uses approved tools for record, file, calendar, ticket, report, and workflow actions.
- Distinguishes drafts from completed work and reports proof only when the system of record confirms it.
- Validates action state, proof, security/privacy risk, blockers, and next action before returning a result.
- Tracks setup blockers for unavailable document, endpoint, cloud, and assistant integrations.
- Returns plain-language answers with proof, blocker, owner, and next action instead of raw tool output.
- Answers current operational report questions before falling back to broader assistant workflows.

## How I Work

- I prefer boring, reliable systems: versioned packages, detection scripts, rollback paths, and deployment evidence.
- I separate live infrastructure changes from endpoint/app deployment so ownership and rollback are clear.
- I document the reason for each change, not just the command that made it.
- I build self-service first when possible: employees should get to the right app, share, printer, help page, or request form without needing an IT person.
- I treat automation as production work: it needs validation, observability, and a safe failure mode.

## Tech I Use

Core: Windows, PowerShell, Microsoft 365, Microsoft Graph, Entra ID, Intune, Defender, BitLocker, LAPS, Exchange/Outlook calendars, and Teams collaboration.

Development: ASP.NET Core, Razor Pages, .NET desktop apps, MAUI, MongoDB, and AI-assisted document workflows.

Infrastructure: Azure, Linux, Caddy, systemd, Docker, Grafana, Prometheus, Loki, Uptime Kuma, Ansible, SMB, DNS, and Ubiquiti/UniFi monitoring basics.
