# Case Study: Small Business Operations Platform

## Summary

This is an operations platform for a field-service production workflow. It brings customer/job tracking, inventory, field assignments, mobile updates, documents, photos, scheduling, reporting, and system health into one environment.

This case study is sanitized. It describes the architecture and operating model without exposing private production details.

## Problem

The business needed more than a generic CRM. Office staff needed a way to track customers, jobs, items, inventory, orders, schedules, and field progress. Field staff needed a simple update workflow. Management needed visibility into what was received, assigned, completed, missing proof, delayed, or stuck.

## What I Built

- Desktop admin app for office workflows, job/item management, scheduling, inventory, ordering, and reporting.
- ASP.NET Core web app for admin workflows, health views, activity streams, and mobile APIs.
- Mobile field app for assigned work, status updates, completion photos, job notes, and offline sync.
- Shared data model for customers, jobs, items, orders, receiving logs, job updates, job files, employee records, vendors, and field telemetry.
- Health/evidence pages that surface deployment status and operational risks.
- Calendar and scheduling workflows that combine task data, Microsoft 365 events, selected-day filtering, and availability windows.
- Reception scheduling support that keeps availability checks inside the intake workflow instead of forcing staff to switch tools.

## Architecture Pattern

- Desktop and web apps use the main database as the source of truth.
- Mobile clients talk to web APIs instead of connecting directly to the database.
- Larger files and photos are stored through controlled storage paths with metadata back in the application.
- Audit logs and activity streams make user actions, errors, and performance visible.
- Maintenance scripts and deployment evidence keep the system reviewable after changes.

## Notable Workflows

- Receive inventory into stock.
- Assign received items through a custody workflow.
- Track assigned-but-not-installed work.
- Require proof/photos for completed field states.
- Edit calendar events in the scheduling popup instead of sending employees to a separate page for normal edits.
- Offer quarter-hour scheduling choices so appointments stay consistent and easy to communicate.
- Show role-based appointment availability as open bookable windows, separate from busy calendar blockers.
- Normalize copied out-of-office style events so the list explains who is unavailable without duplicate clutter.
- Show stale work queues for missing customer, job, field owner, proof, or status data.
- Keep employee self-service links and operational dashboards available from obvious browser/start-menu entry points.

## Engineering Practices

- Keep live data migrations separate from UI and package changes.
- Prefer reversible changes with rollback notes.
- Write validation scripts for deployment packages.
- Keep dated deployment evidence so future troubleshooting has context.
- Treat employee usability as part of reliability: the right link, shortcut, or dashboard should be easy to find.
- Treat confusing next steps, hidden popups, clipped controls, and slow scrolling as production defects.

## Public Artifacts To Show

- Sanitized screenshots of dashboard layout with fake data.
- Simplified entity relationship diagram.
- Example health-card markdown evidence.
- A fake inventory stale-work queue demo.
- A fake field assignment page with generated customer/job names.
