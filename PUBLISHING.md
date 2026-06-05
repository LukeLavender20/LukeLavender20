# Public GitHub Publish Plan

This is the safe path for turning the private work into a public GitHub/resume presence.

## 1. Create A Separate Public Repo

Do not publish the private workspace. Create a clean public repo such as:

- `small-business-it-automation-portfolio`
- `operations-automation-portfolio`
- `m365-intune-sysadmin-portfolio`

Use the files in `docs/public-portfolio/` as source material.

## 2. Start With These Public Files

Recommended first commit:

```text
README.md
case-studies/
  operations-platform.md
  microsoft-365-intune-endpoint-management.md
  network-operations-observability.md
  documentai-operations.md
examples/
  intune-win32-package-pattern/
  endpoint-telemetry-schema/
  health-evidence-card/
redaction/
  public-redaction-checklist.md
```

## 3. Build Demo Artifacts From Scratch

Good public examples:
- Fake-domain Intune package pattern.
- Sanitized endpoint posture JSON schema.
- Health dashboard evidence card with sample data.
- DocumentAI cleanup proposal with generated fake customers and jobs.
- Operations runbook template with owner, rollback, verification, and evidence fields.

Do not copy live scripts until they are rewritten with fake defaults and reviewed.

## 4. Screenshots

Use screenshots only after rebuilding the page with demo data. Blur is not enough for high-risk screens because browser history, URLs, row data, and metadata can still leak.

Safer screenshot targets:
- A fake NOC dashboard.
- A fake inventory stale-work queue.
- A fake field assignment page.
- A fake DocumentAI review queue.
- A fake endpoint posture summary.

## 5. GitHub Profile README

For the special GitHub profile README, create a public repository named exactly the same as the GitHub username. Put the contents of `github-profile-readme.md` into that repo's `README.md`.

## 6. Final Private-Data Gate

Before each public push, scan the public repo for:

- Real domains, internal hostnames, and URLs.
- IP addresses and subnet ranges from production.
- GUIDs, tenant IDs, app IDs, device IDs, group IDs, and subscription IDs.
- Employee/customer/job names.
- Emails, phone numbers, usernames, local paths, and screenshots.
- Network diagrams or runbooks that reveal access paths or security controls.
