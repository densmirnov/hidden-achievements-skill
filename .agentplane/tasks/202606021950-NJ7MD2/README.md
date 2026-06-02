---
id: "202606021950-NJ7MD2"
title: "Harmonize fallback and manual correction schemas"
result_summary: "Harmonized fallback and manual correction schemas."
status: "DONE"
priority: "med"
owner: "DOCS"
revision: 7
origin:
  system: "manual"
depends_on: []
tags:
  - "docs"
verify: []
plan_approval:
  state: "approved"
  updated_at: "2026-06-02T19:50:27.539Z"
  updated_by: "ORCHESTRATOR"
  note: null
verification:
  state: "ok"
  updated_at: "2026-06-02T19:51:24.851Z"
  updated_by: "DOCS"
  note: "Verified: fallback source naming uses reason instead of fallback_reason, scheduled snapshot guidance is explicit, and manual correction ledger audit fields were added without adding an eval runner; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  attempts: 0
quality_review:
  state: "pass"
  updated_at: "2026-06-02T19:51:52.361Z"
  updated_by: "EVALUATOR"
  note: "Fallback and manual correction schema cleanup satisfies approved docs scope."
  evaluated_sha: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  blueprint_digest: "5b5bec8b1b6a131bd3bdd59c867277e9cd6ca77877faaadc1e3866586a41b86f"
  evidence_refs:
    - ".agentplane/tasks/202606021950-NJ7MD2/README.md"
    - ".agentplane/tasks/202606021950-NJ7MD2/quality/20260602-195152361-recovery-context/quality-report.json"
    - ".agentplane/tasks/202606021950-NJ7MD2/quality/20260602-195152361-recovery-context/evaluator-prompt.md"
    - ".agentplane/tasks/202606021950-NJ7MD2/quality/20260602-195152361-recovery-context/evaluator-opinion.md"
    - ".agentplane/tasks/202606021950-NJ7MD2/blueprint/resolved-snapshot.json"
    - "scripts/validate-skill.sh"
  findings:
    - "Prompt/source guidance uses reason instead of fallback_reason, and manual correction ledger entries include admin audit fields without adding the excluded eval runner."
commit:
  hash: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  message: "docs: fix hidden achievements protocol"
comments:
  -
    author: "DOCS"
    body: "Start: Harmonize fallback source naming and manual correction audit fields without adding an eval runner, then validate the package."
  -
    author: "DOCS"
    body: "Verified: fallback source naming and manual correction audit fields are harmonized without adding the excluded executable eval runner, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
events:
  -
    type: "status"
    at: "2026-06-02T19:50:38.950Z"
    author: "DOCS"
    from: "TODO"
    to: "DOING"
    note: "Start: Harmonize fallback source naming and manual correction audit fields without adding an eval runner, then validate the package."
  -
    type: "verify"
    at: "2026-06-02T19:51:24.851Z"
    author: "DOCS"
    state: "ok"
    note: "Verified: fallback source naming uses reason instead of fallback_reason, scheduled snapshot guidance is explicit, and manual correction ledger audit fields were added without adding an eval runner; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  -
    type: "status"
    at: "2026-06-02T19:52:58.028Z"
    author: "DOCS"
    from: "DOING"
    to: "DONE"
    note: "Verified: fallback source naming and manual correction audit fields are harmonized without adding the excluded executable eval runner, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
doc_version: 3
doc_updated_at: "2026-06-02T19:52:58.029Z"
doc_updated_by: "DOCS"
description: "Use one fallback source field shape and strengthen manual correction ledger audit fields without adding an executable eval runner."
sections:
  Summary: |-
    Harmonize fallback and manual correction schemas

    Use one fallback source field shape and strengthen manual correction ledger audit fields without adding an executable eval runner.
  Scope: |-
    - In scope: Use one fallback source field shape and strengthen manual correction ledger audit fields without adding an executable eval runner.
    - Out of scope: unrelated refactors not required for "Harmonize fallback and manual correction schemas".
  Plan: "Update references/prompts.md and references/schemas.md so fallback sources consistently use reason instead of fallback_reason, split daily_brief and scheduled_snapshot source guidance, and add admin audit fields to manual correction ledger entries. Do not add an executable eval runner. Verify by targeted searches and repository validation."
  Verify Steps: |-
    PLANNER fallback scaffold for "Harmonize fallback and manual correction schemas". Replace with task-specific acceptance checks when PLANNER context is available.

    1. Review the requested outcome for "Harmonize fallback and manual correction schemas". Expected: the visible result matches ## Summary and stays inside approved scope.
    2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
    3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.
  Verification: |-
    <!-- BEGIN VERIFICATION RESULTS -->
    ### 2026-06-02T19:51:24.851Z — VERIFY — ok

    By: DOCS

    Note: Verified: fallback source naming uses reason instead of fallback_reason, scheduled snapshot guidance is explicit, and manual correction ledger audit fields were added without adding an eval runner; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
    Attempts: 0

    VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.950Z, excerpt_hash=sha256:a6c35e6645289dd7a478f708a1f61f35206926d7f783bf4bf2be7d69e8062e2f

    Details:

    BlueprintSnapshotRef:
    - state: current
    - path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021950-NJ7MD2/blueprint/resolved-snapshot.json
    - old_digest: 5b5bec8b1b6a131bd3bdd59c867277e9cd6ca77877faaadc1e3866586a41b86f
    - current_digest: 5b5bec8b1b6a131bd3bdd59c867277e9cd6ca77877faaadc1e3866586a41b86f
    - route_changed: no
    - safe_command: agentplane blueprint snapshot 202606021950-NJ7MD2

    <!-- END VERIFICATION RESULTS -->
  Rollback Plan: |-
    - Revert task-related commit(s).
    - Re-run required checks to confirm rollback safety.
  Findings: ""
id_source: "generated"
---
## Summary

Harmonize fallback and manual correction schemas

Use one fallback source field shape and strengthen manual correction ledger audit fields without adding an executable eval runner.

## Scope

- In scope: Use one fallback source field shape and strengthen manual correction ledger audit fields without adding an executable eval runner.
- Out of scope: unrelated refactors not required for "Harmonize fallback and manual correction schemas".

## Plan

Update references/prompts.md and references/schemas.md so fallback sources consistently use reason instead of fallback_reason, split daily_brief and scheduled_snapshot source guidance, and add admin audit fields to manual correction ledger entries. Do not add an executable eval runner. Verify by targeted searches and repository validation.

## Verify Steps

PLANNER fallback scaffold for "Harmonize fallback and manual correction schemas". Replace with task-specific acceptance checks when PLANNER context is available.

1. Review the requested outcome for "Harmonize fallback and manual correction schemas". Expected: the visible result matches ## Summary and stays inside approved scope.
2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.

## Verification

<!-- BEGIN VERIFICATION RESULTS -->
### 2026-06-02T19:51:24.851Z — VERIFY — ok

By: DOCS

Note: Verified: fallback source naming uses reason instead of fallback_reason, scheduled snapshot guidance is explicit, and manual correction ledger audit fields were added without adding an eval runner; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
Attempts: 0

VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.950Z, excerpt_hash=sha256:a6c35e6645289dd7a478f708a1f61f35206926d7f783bf4bf2be7d69e8062e2f

Details:

BlueprintSnapshotRef:
- state: current
- path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021950-NJ7MD2/blueprint/resolved-snapshot.json
- old_digest: 5b5bec8b1b6a131bd3bdd59c867277e9cd6ca77877faaadc1e3866586a41b86f
- current_digest: 5b5bec8b1b6a131bd3bdd59c867277e9cd6ca77877faaadc1e3866586a41b86f
- route_changed: no
- safe_command: agentplane blueprint snapshot 202606021950-NJ7MD2

<!-- END VERIFICATION RESULTS -->

## Rollback Plan

- Revert task-related commit(s).
- Re-run required checks to confirm rollback safety.

## Findings
