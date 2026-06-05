# Case Study: AI-Assisted Operations Assistant

## Summary

Built an internal assistant pattern for small-business operations where the assistant is a front door for work, not a chatbot bolted onto the side. The assistant can answer normal questions, classify messy requests, route work to safer internal tools, coordinate specialist review lanes, and return one human-readable answer with proof, blockers, and next action.

This case study is sanitized. It describes the operating model without exposing private prompts, production routes, customer data, employee data, tenant details, device inventories, or live workflow records.

## Problem

Employees need fast answers, but business operations also need accuracy. A weak assistant fails in two ways: it either gives vague chatbot text when the user needed action, or it claims action happened without proof from the system of record.

The goal was to make the assistant feel like a direct conversation while still respecting production rules:

- Direct answers for safe general questions.
- Real tool use for record, file, calendar, ticket, report, and workflow actions.
- Worker coordination for deeper implementation, risk review, document review, and human-tone review.
- Clear proof language instead of exposed model routing.
- No fake sends, fake record changes, fake file access, or fake device actions.

## What I Built

- A single assistant identity that hides provider and worker lanes from employees.
- Request classification for workflow, support, reporting, document, communication, endpoint, and app-improvement requests.
- Behind-the-scenes worker routing for implementation, critique, document review, and local/private processing.
- A second-pass validation gate that checks action taken versus draft-only, proof attached, fake-action risk, security/privacy risk, blockers, and next action.
- A no-secret worker issue register so unavailable or degraded lanes are tracked instead of rediscovered repeatedly.
- Operations surfaces for worker status, endpoint performance clues, log presets, backup proof, and continuity posture.
- Source tests that lock in proof language, no-fake-action behavior, and workflow routing expectations.

## Operating Pattern

The assistant follows a simple sequence:

1. Understand the request and decide whether it is chat, workflow, support, reporting, communication, document, endpoint, or app-improvement work.
2. Use live business data or approved tools when the question depends on current state.
3. Use all suitable configured worker lanes for complex work, but return one assistant answer.
4. Treat worker output as review evidence until a real system tool proves a change.
5. Return the result in normal language: answer, proof, blocker if any, and next action.
6. Track unresolved setup gaps in an operations register so they become visible work.

## Proof And Safety Rules

- Worker text alone is not proof of action.
- A send is only done when the mail, Teams, SMS, or channel tool returns delivery proof.
- A record is only changed when the system of record returns an update result.
- A file is only summarized from pasted text, uploaded content, or a connected file tool that proves access.
- A device is only changed through approved endpoint tooling with scope, owner, and validation.
- Authentication, authorization, and unavailable-worker issues become tracked blockers, not hidden failures.

## Public-Safe Engineering Signals

- Multi-worker orchestration without exposing model names to employees.
- Proof-backed assistant replies that distinguish action, draft, review, and blocker states.
- Operations issue register for degraded AI, document, endpoint, and cloud lanes.
- Endpoint performance triage that surfaces memory pressure, security scan clues, and stale telemetry without remoting into user devices.
- Backup and continuity runbooks that require restore proof, staging gates, and no-secret handoff notes.
- Rate limiting and guardrails around mobile/field authentication paths.

## Validation Pattern

Before calling an assistant change complete, validate:

- Source tests for routing and proof language.
- Tests for draft-only versus live-action wording.
- Tests for worker fallback and partial-worker failure behavior.
- Tests that missing external authentication is reported as a setup blocker.
- Tests that sensitive workflow pages do not expose private records through public routes.
- Build checks with warnings treated as errors.

## Public Artifacts To Show

- Sanitized assistant flow diagram.
- Fake worker issue register with generic providers and generic proof states.
- Example proof-backed response using fake data.
- Demo endpoint-performance card using generated sample telemetry.
- Backup and continuity checklist with placeholder systems.
