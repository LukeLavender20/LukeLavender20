# Health Dashboard Model

The best admin dashboard is not a pile of charts. It is a short list of things that need attention, backed by evidence.

## Cards I Like

| Card | Signal |
| --- | --- |
| Endpoint version drift | Device app version vs latest package version |
| Command queue health | Queued command count and oldest command age by device |
| Wrong-network block | Device is online but reporting from an untrusted network |
| Entra vs Intune inventory | Directory devices missing management records |
| Security posture | Defender, Firewall, BitLocker, TPM, Secure Boot, update state |
| Deployment evidence | Latest package publish, assignment, validation, and rollback |
| Share availability | Stable share name is reachable and mapped on endpoints |
| Document backlog | Intake files waiting for classification, owner, or job link |

## Rules

- Prefer stale work queues over vanity metrics.
- Show current package version and device version side by side.
- Show why repair is blocked instead of retrying forever.
- Link every card to evidence or a runbook.
- Keep destructive actions behind review and named ownership.

