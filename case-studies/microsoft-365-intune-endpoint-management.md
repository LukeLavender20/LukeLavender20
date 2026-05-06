# Case Study: Microsoft 365, Intune, And Endpoint Management

## Summary

Built a Microsoft 365 and Intune management lane for a small-business environment where endpoint reliability matters more than flashy tooling. The goal is zero-touch or low-touch deployment, consistent Office behavior, usable employee self-service, and enough telemetry to know what every managed Windows device is doing.

## Problem

Employees were running into inconsistent setup behavior: Office first-run prompts, personal Microsoft account confusion, missing shortcuts, stale devices, uneven app state, and limited visibility into endpoint health.

## What I Built

- Win32 Intune package pattern with `install`, `detect`, `repair`, `validate`, version files, and deployment evidence.
- Microsoft 365 Apps package with silent install, EULA acceptance, first-run suppression, and work-account sign-in guardrails.
- Managed Edge/Chrome favorites for employee resources.
- Desktop and Start Menu shortcuts for self-service, shared resources, status pages, and common workflows.
- Endpoint posture telemetry that reports Windows, Defender, Firewall, BitLocker, TPM/Secure Boot, pending reboot, Windows Update services, Intune Management Extension, browsers, Office, Teams, and package version.
- Read-only Entra/Intune visibility audit for managed, missing, stale, and orphaned Windows devices.
- Guardrails around staged enrollment so known-sensitive devices are not forced into Entra/Intune before the process is proven.

## Design Principles

- Package-owned state only: detection should know exactly what the package owns.
- Quiet, required deployment for baseline resources.
- No hard enrollment blocks until the desktop experience is proven.
- Read-only audits before deletes, forced enrollments, or cleanup.
- Evidence-first operations: every broad deployment should leave a short report with version, assignment, validation, and rollback notes.

## Results To Present Publicly

- A repeatable Intune Win32 app packaging standard.
- A clean Office onboarding pattern that keeps users in work accounts.
- A device visibility model that separates directory presence from actual Intune management.
- A telemetry model for endpoint posture without turning the collector into an enforcement tool.
- A self-service-first employee experience through browser bookmarks and shortcuts.

## Public Artifacts To Show

- Fake-domain package template.
- Sanitized endpoint posture sample JSON.
- Example deployment evidence markdown with fake app IDs and fake tenant names.
- Diagram of `Package -> Detection -> Telemetry -> Health Dashboard -> Remediation Queue`.

