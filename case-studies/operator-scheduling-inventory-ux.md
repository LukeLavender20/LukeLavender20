# Case Study: Operator Scheduling And Inventory UX

## Summary

Built and refined operator-first scheduling and inventory workflows for a production business. The goal was to make daily staff work faster than jumping between generic calendar, spreadsheet, and admin tools.

This public version is sanitized. It describes the workflow pattern without exposing customer records, employee names, calendar subjects, tenant details, live URLs, or private source code.

## Problem

Scheduling and inventory work can fail even when the data exists. A raw event list does not clearly show who is available, an edit popup that only links to another page slows staff down, and receive/assign actions are not usable if the modal path is fragile.

The business needed a scheduling dashboard that could compete with normal calendar tools while adding business context, and an inventory dashboard that could handle real receiving and handoff work without forcing staff into disconnected screens.

## What I Built

- Popup-first calendar event editing for normal calendar changes: owner/person, title, start, duration, show-as state, all-day state, location, notes, save, delete, and explicit full-calendar fallback.
- Selected-day event filtering so clicking one date shows that date instead of a broader week by accident.
- Quarter-hour appointment selection across scheduling paths, so staff choose times like 1:00, 1:15, 1:30, and 1:45 instead of arbitrary minute values.
- Sales availability views that separate open bookable windows from busy calendar blockers.
- Reception scheduling support that keeps sales availability inside the intake form.
- Out-of-office normalization so copied or duplicated away events collapse into clearer person/day availability signals.
- Inventory receive and give-to-installer actions that open inside the in-page modal workspace and focus the correct scan/assignment control.
- Regression tests and deployment evidence for modal visibility, focus behavior, calendar filtering, availability wording, and scroll performance.

## Design Pattern

- Keep employees in the task surface they are already using.
- Put the next useful action near the calendar or inventory list, not in a secondary page.
- Treat availability as a decision aid, not just a list of busy blocks.
- Use explicit labels: "available to schedule" versus "busy or blocked".
- Use consistent time increments that match real appointment scheduling.
- Make popup actions large enough and readable enough for daily use.
- Lock in fixes with tests when a workflow is easy to regress.

## Inventory Pattern

- Receiving starts from the incoming inventory view.
- Assignment starts from selected rows with eligibility checks.
- The modal path must be visible, focused, and above the rest of the page.
- The page should not depend on hidden full-page detours for routine receive or handoff work.
- Scroll and backdrop effects should not make daily dashboards feel slow.

## Public-Safe Engineering Signals

- Strong fit for L3 support habits: isolate the workflow failure, prove the UI path, test the regression case, and deploy with evidence.
- Strong fit for collaboration support: calendar data is useful only when staff can edit, filter, and schedule from it safely.
- Strong fit for endpoint/device management: inventory custody, assignment, and status should be visible and auditable.
- Strong fit for operations tooling: staff should see the action they need without needing to understand the underlying system.

## Validation Pattern

Before calling this type of work complete, validate:

- The event list respects the selected day/range.
- Calendar edit popups can save normal edits without leaving the dashboard.
- Time pickers offer quarter-hour choices.
- Availability labels explain open time versus busy time.
- Receive and assign modals open above the page and focus the correct control.
- Scroll performance does not regress from heavy visual effects.
- Tests cover the workflow, not just page rendering.

## Public Artifacts To Show

- Fake-data screenshot of a selected-day calendar board.
- Fake-data availability card showing open windows and blockers.
- Fake inventory receive/assign modal with placeholder item data.
- Test summary showing workflow-specific regression coverage.
