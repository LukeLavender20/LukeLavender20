# Customer / Job Document Workspace

This is a generic file-workspace model for companies that still need SMB shares but also want cloud collaboration.

## Target Shape

```text
Company Root
  Customers
    Customer Name
      Job Number - Job Name
        00 Intake
        10 Orders
        20 Drawings
        30 Field Photos
        40 Proof And Signoff
        50 Invoices
        90 Archive
```

## Design Goals

- A normal employee can find a job without asking IT.
- The business app links directly to the customer/job folder.
- Scanners and document intake land in predictable folders.
- Installers can upload photos/proof into the right job.
- Sync conflicts are visible and handled by policy.
- Archive rules keep old jobs from cluttering active work.

## Rollout Pattern

1. Inventory current folders without moving data.
2. Define naming rules and reserved folders.
3. Pilot one customer/job path.
4. Link the path from the business app.
5. Add SharePoint/Teams sync only after conflict behavior is tested.
6. Migrate in batches with rollback copy and evidence.

## Guardrails

- Never reorganize production files without a dry run.
- Keep a rollback copy before live moves.
- Use generated reports to find duplicates, empty folders, forbidden characters, and stale files.
- Separate active jobs from archive jobs.
- Make the path accessible from both the app and employee self-service entry point.

