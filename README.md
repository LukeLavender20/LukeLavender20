# Hi, I'm Luke

I build practical IT systems that make small businesses easier to run: Microsoft 365 and Intune automation, endpoint management, network observability, internal web apps, inventory/workflow tools, and AI-assisted document processing.

My main work is a full operations platform for a cabinetry business. It connects office staff, installers, inventory, customer/job records, documents, Microsoft 365, endpoint deployment, and network health into one managed environment.

## What I Work On

- Microsoft 365 and Intune deployment: Autopilot planning, Company Portal apps, Win32 app packaging, Office configuration, browser bookmarks, employee shortcuts, trusted sites, endpoint telemetry, and device visibility reporting.
- Windows endpoint operations: Defender, BitLocker, firewall, update posture, browser health, Office/Teams versions, inventory, drift detection, and quiet self-healing packages.
- Network and infrastructure operations: internal DNS names, SMB shares, monitoring, alerting, uptime checks, switch/router observability, and stable employee entry points.
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
- Endpoint telemetry package reporting Windows, Defender, Firewall, BitLocker, TPM/Secure Boot, browsers, Office, Teams, and Intune Management Extension health.
- Read-only Entra/Intune reconciliation reports for stale, missing, and unmanaged devices.

### Network Operations And Monitoring

Helped build an operations model around stable internal names, monitoring, and evidence:
- Employee-friendly start/status/wifi/share entry points.
- Stable SMB/share names for office, scans, CNC, and design workflows.
- Monitoring and dashboard patterns for reachability, service health, command queues, endpoint versions, and wrong-network detection.
- Change-control notes separating network ownership from Microsoft 365/endpoint ownership.

### DocumentAI

Built workflow support for document-heavy operations:
- Document intake and classification.
- Extraction and cleanup review flows.
- Proposal/dry-run review patterns before committing changes.
- Human review checkpoints for risk, grouping, and disposition decisions.
- Operational summaries that turn messy file/document states into actionable work queues.

## How I Work

- I prefer boring, reliable systems: versioned packages, detection scripts, rollback paths, and deployment evidence.
- I separate live infrastructure changes from endpoint/app deployment so ownership and rollback are clear.
- I document the reason for each change, not just the command that made it.
- I build self-service first when possible: employees should get to the right app, share, printer, help page, or request form without needing an IT person.
- I treat automation as production work: it needs validation, observability, and a safe failure mode.

## Tech I Use

Windows, PowerShell, Microsoft Graph, Entra ID, Intune, Microsoft 365 Apps, Defender, BitLocker, LAPS, ASP.NET Core, Razor Pages, .NET desktop apps, MAUI, MongoDB, Azure, Linux, Docker, Grafana, Prometheus, Loki, Uptime Kuma, Ansible, SMB, DNS, and AI-assisted document workflows.
