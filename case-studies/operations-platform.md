# Case Study: Small Business Operations Platform

## Summary

This is an operations platform for a cabinetry workflow. It brings customer/job tracking, inventory, installer assignments, mobile field updates, documents, photos, scheduling, reporting, and system health into one environment.

This case study is sanitized. It describes the architecture and operating model without exposing private production details.

## Problem

The business needed more than a generic CRM. Office staff needed a way to track customers, jobs, items, inventory, orders, schedules, and installer progress. Installers needed a simple field workflow. Management needed visibility into what was received, assigned, installed, missing proof, delayed, or stuck.

## What I Built

- Desktop admin app for office workflows, job/item management, scheduling, inventory, ordering, and reporting.
- ASP.NET Core web app for admin workflows, health views, activity streams, and mobile APIs.
- Mobile installer app for assigned work, status updates, install photos, job notes, and offline sync.
- Shared data model for customers, jobs, items, orders, receiving logs, job updates, job files, employee records, vendors, and installer telemetry.
- Health/evidence pages that surface deployment status and operational risks.

## Architecture Pattern

- Desktop and web apps use the main database as the source of truth.
- Mobile clients talk to web APIs instead of connecting directly to the database.
- Larger files and photos are stored through controlled storage paths with metadata back in the application.
- Audit logs and activity streams make user actions, errors, and performance visible.
- Maintenance scripts and deployment evidence keep the system reviewable after changes.

## Notable Workflows

- Receive inventory into stock.
- Assign received items to installers.
- Track assigned-but-not-installed work.
- Require installer proof/photos for completed install states.
- Show stale work queues for missing customer, job, installer, proof, or status data.
- Keep employee self-service links and operational dashboards available from obvious browser/start-menu entry points.

## Engineering Practices

- Keep live data migrations separate from UI and package changes.
- Prefer reversible changes with rollback notes.
- Write validation scripts for deployment packages.
- Keep dated deployment evidence so future troubleshooting has context.
- Treat employee usability as part of reliability: the right link, shortcut, or dashboard should be easy to find.

## Public Artifacts To Show

- Sanitized screenshots of dashboard layout with fake data.
- Simplified entity relationship diagram.
- Example health-card markdown evidence.
- A fake inventory stale-work queue demo.
- A fake installer assignment page with generated customer/job names.
