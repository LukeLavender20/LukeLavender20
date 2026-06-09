# Case Study: AI-Assisted Operations Assistant

## Summary

Built an internal assistant pattern for small-business operations where the assistant is a front door for work, not a chatbot bolted onto the side. The assistant can answer normal questions, classify messy requests, route work to approved internal tools, coordinate specialist review paths, and return one human-readable answer with proof, blockers, and next action.

This case study is sanitized. It describes the operating model without exposing private prompts, production routes, customer data, employee data, tenant details, device inventories, or live workflow records.

## Problem

Employees need fast answers, but business operations also need accuracy. A weak assistant fails in two ways: it either gives vague chatbot text when the user needed action, or it claims action happened without proof from the system of record.

The goal was to make the assistant feel like a direct conversation while still respecting production rules:

- Direct answers for safe general questions.
- Real tool use for record, file, calendar, ticket, report, and workflow actions.
- Specialist review paths for deeper implementation, risk review, document review, and communication review.
- Clear proof language instead of exposed model routing.
- No claims of sends, record changes, file access, or device actions without proof from the right system.

## What I Built

- A single employee-facing assistant interface that routes requests to approved tools and review paths without exposing implementation details.
- Request classification for workflow, support, reporting, document, communication, endpoint, and app-improvement requests.
- Approved review paths for implementation, critique, document review, and local/private processing.
- A validation gate that checks action taken versus draft-only, proof attached, unproven-action risk, security/privacy risk, blockers, and next action.
- A setup-blocker register so unavailable or degraded integrations are tracked instead of rediscovered repeatedly.
- Operations surfaces for integration status, endpoint performance clues, log presets, backup proof, and continuity posture.
- Source tests that lock in proof language, action-state wording, and workflow routing expectations.
- Scoped coordination locks and handoff notes so multiple workers can improve adjacent systems without overlapping active changes.
- Fallback routing behavior so configured backup workers can help when a primary lane is unavailable, rate-limited, or lower quality for the request.

## Operating Pattern

The assistant follows a simple sequence:

1. Understand the request and decide whether it is chat, workflow, support, reporting, communication, document, endpoint, or app-improvement work.
2. Use live business data or approved tools when the question depends on current state.
3. Use suitable configured tool and review paths for complex work, but return one assistant answer.
4. Treat review output as evidence until a real system tool proves a change.
5. Return the result in normal language: answer, proof, blocker if any, and next action.
6. Track unresolved setup gaps in an operations register so they become visible work.
7. Use scoped locks, worker heartbeats, and proof reports when parallel workers are touching related app or data surfaces.

## Proof And Safety Rules

- Review text alone is not proof of action.
- A send is only done when the mail, Teams, SMS, or channel tool returns delivery proof.
- A record is only changed when the system of record returns an update result.
- A file is only summarized from pasted text, uploaded content, or a connected file tool that proves access.
- A device is only changed through approved endpoint tooling with scope, owner, and validation.
- Authentication, authorization, and unavailable-integration issues become tracked blockers, not hidden failures.
- Duplicate cleanup is dry-run first, backed up before apply, tombstoned instead of deleted, and blocked when linked records require review.
- Ambiguous duplicate-looking files or folders become review candidates unless exact evidence and rollback proof make them safe to clean up.

## Public-Safe Engineering Signals

- Approved tool and review orchestration without exposing implementation details to employees.
- Proof-backed assistant replies that distinguish action, draft, review, and blocker states.
- Operations issue register for degraded AI, document, endpoint, and cloud integrations.
- Endpoint performance triage that surfaces memory pressure, security scan clues, and stale telemetry without remoting into user devices.
- Backup and continuity runbooks that require restore proof, staging gates, and no-secret handoff notes.
- Rate limiting and guardrails around mobile/field authentication paths.
- No-overlap coordination for implementation, QA, deployment, data maintenance, and proof-writing lanes.
- Fallback routing that treats paid APIs as escalation tools, not as the default answer for every request.

## Validation Pattern

Before calling an assistant change complete, validate:

- Source tests for routing and proof language.
- Tests for draft-only versus live-action wording.
- Tests for fallback and partial-integration failure behavior.
- Tests that missing external authentication is reported as a setup blocker.
- Tests that sensitive workflow pages do not expose private records through public routes.
- Build checks with warnings treated as errors.

## Public Artifacts To Show

- Sanitized assistant flow diagram.
- Fake setup-blocker register with generic providers and generic proof states.
- Example proof-backed response using fake data.
- Demo endpoint-performance card using generated sample telemetry.
- Backup and continuity checklist with placeholder systems.
