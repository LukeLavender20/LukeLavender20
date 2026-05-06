# Case Study: DocumentAI And Operational Cleanup

## Summary

DocumentAI work focuses on turning messy business documents into structured, reviewable operations data. The system is designed around human approval, dry-run proposals, auditability, and cleanup queues rather than blind automation.

## Problem

Operational documents accumulate in many forms: quotes, job orders, customer files, proofs, photos, vendor documents, notes, and old exports. Without structure, employees waste time searching and risk attaching the wrong file to the wrong customer or job.

## What I Built

- Document intake and classification patterns.
- Review screens that separate proposed cleanup from committed changes.
- Dry-run proposal artifacts for grouping, disposition, risk, and action counts.
- Human-in-the-loop review before moving, deleting, or reclassifying documents.
- Support for customer/job-oriented organization so files can eventually land in a consistent `Customer > Job > document type` structure.
- Health and evidence documents that make cleanup progress auditable.

## Design Principles

- Never let AI silently delete or move important records.
- Use generated proposals and review states before live changes.
- Keep source hygiene visible: missing metadata, duplicate-looking files, old records, null collections, and risky groups should become work queues.
- Preserve rollback evidence and avoid data loss.
- Make file organization match how employees actually find work: customer, job, order, proof, and install context.

## Public Artifacts To Show

- Generated sample document set with fake customers/jobs.
- A cleanup proposal JSON example with fake paths.
- A review UI screenshot using sample data only.
- A before/after diagram showing messy intake turning into organized customer/job folders.
- A short runbook for safe document cleanup.

