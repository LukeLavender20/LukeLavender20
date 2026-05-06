# Case Study: Network Operations And Observability

## Summary

Built an operations model that makes a small-business network easier to operate: stable names for employees, monitoring for services, clear ownership between network and endpoint changes, and evidence-driven troubleshooting.

This public version intentionally omits production DNS zones, IP addresses, device names, VLAN IDs, firewall rules, and credentials.

## Problem

The environment needed reliable access to shared files, internal start/status pages, printers, Wi-Fi guidance, line-of-business tools, and endpoint support without making employees memorize server names or ask IT for basic navigation.

## What I Helped Build

- Employee start page and status page model.
- Stable internal aliases for common resources like files, scans, CNC/design shares, printers, Wi-Fi help, cameras, and monitoring.
- Monitoring patterns for service availability, endpoint command queue health, app version drift, and wrong-network detection.
- Cross-session ownership model:
  - Network lane owns routing, DNS, SMB server behavior, switches, Wi-Fi, monitoring, and firewalling.
  - 365/endpoint lane owns Intune, Windows policy, shortcuts, mapped resources, Office, browser policy, and endpoint telemetry.
- Handoff format for joint work like certificate deployment, printer publishing, SMB credential migration, and WPA Enterprise.

## Operating Principles

- Give employees stable friendly names instead of raw infrastructure details.
- Keep live network changes separate from endpoint deployment.
- Use rollback and verification notes before changing production paths.
- Prefer monitoring and visibility before intrusive repair behavior.
- Treat wrong-network state as a blocked condition, not a reason to run risky repair commands.

## Public Artifacts To Show

- Sanitized network operations diagram with generic names.
- Example handoff document showing owner, scope, rollback, and verification.
- Fake monitoring dashboard screenshot.
- Example employee resource map using placeholder paths.
- Runbook for "device is reachable but not polling" with all sensitive details removed.

