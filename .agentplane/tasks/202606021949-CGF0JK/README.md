---
id: "202606021949-CGF0JK"
title: "Remove hidden-count leakage from README"
result_summary: "Removed hidden-count leakage from README."
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
  updated_at: "2026-06-02T19:50:27.050Z"
  updated_by: "ORCHESTRATOR"
  note: null
verification:
  state: "ok"
  updated_at: "2026-06-02T19:51:24.283Z"
  updated_by: "DOCS"
  note: "Verified: README no longer discloses opened totals or remaining locked counts, and examples are marked illustrative rather than reusable; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  attempts: 0
quality_review:
  state: "pass"
  updated_at: "2026-06-02T19:51:51.692Z"
  updated_by: "EVALUATOR"
  note: "README privacy/count cleanup satisfies approved docs scope."
  evaluated_sha: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  blueprint_digest: "53d3edfbf7e57db455358f412b35f0b3609ec1a5a9cd928cbd837eac32816b92"
  evidence_refs:
    - ".agentplane/tasks/202606021949-CGF0JK/README.md"
    - ".agentplane/tasks/202606021949-CGF0JK/quality/20260602-195151692-recovery-context/quality-report.json"
    - ".agentplane/tasks/202606021949-CGF0JK/quality/20260602-195151692-recovery-context/evaluator-prompt.md"
    - ".agentplane/tasks/202606021949-CGF0JK/quality/20260602-195151692-recovery-context/evaluator-opinion.md"
    - ".agentplane/tasks/202606021949-CGF0JK/blueprint/resolved-snapshot.json"
    - "scripts/validate-skill.sh"
  findings:
    - "README no longer reveals opened totals or remaining locked counts and no longer describes examples as reusable daily decks; package validation passed."
commit:
  hash: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  message: "docs: fix hidden achievements protocol"
comments:
  -
    author: "DOCS"
    body: "Start: Remove README hidden-count leakage and clarify example fragments as illustrative schema examples, then validate the package."
  -
    author: "DOCS"
    body: "Verified: README examples no longer reveal opened totals or locked achievement counts, and example fragments are marked illustrative, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
events:
  -
    type: "status"
    at: "2026-06-02T19:50:38.378Z"
    author: "DOCS"
    from: "TODO"
    to: "DOING"
    note: "Start: Remove README hidden-count leakage and clarify example fragments as illustrative schema examples, then validate the package."
  -
    type: "verify"
    at: "2026-06-02T19:51:24.283Z"
    author: "DOCS"
    state: "ok"
    note: "Verified: README no longer discloses opened totals or remaining locked counts, and examples are marked illustrative rather than reusable; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  -
    type: "status"
    at: "2026-06-02T19:52:55.306Z"
    author: "DOCS"
    from: "DOING"
    to: "DONE"
    note: "Verified: README examples no longer reveal opened totals or locked achievement counts, and example fragments are marked illustrative, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
doc_version: 3
doc_updated_at: "2026-06-02T19:52:55.306Z"
doc_updated_by: "DOCS"
description: "Update README examples and wording so locked achievement counts are not disclosed and example fragments are explicitly illustrative rather than reusable daily decks."
sections:
  Summary: |-
    Remove hidden-count leakage from README

    Update README examples and wording so locked achievement counts are not disclosed and example fragments are explicitly illustrative rather than reusable daily decks.
  Scope: |-
    - In scope: Update README examples and wording so locked achievement counts are not disclosed and example fragments are explicitly illustrative rather than reusable daily decks.
    - Out of scope: unrelated refactors not required for "Remove hidden-count leakage from README".
  Plan: "Update README.md examples and package wording so evening summaries do not disclose opened totals or remaining locked counts, and examples are described as illustrative schema fragments rather than reusable daily decks. Verify by targeted search and repository validation."
  Verify Steps: |-
    PLANNER fallback scaffold for "Remove hidden-count leakage from README". Replace with task-specific acceptance checks when PLANNER context is available.

    1. Review the requested outcome for "Remove hidden-count leakage from README". Expected: the visible result matches ## Summary and stays inside approved scope.
    2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
    3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.
  Verification: |-
    <!-- BEGIN VERIFICATION RESULTS -->
    ### 2026-06-02T19:51:24.283Z — VERIFY — ok

    By: DOCS

    Note: Verified: README no longer discloses opened totals or remaining locked counts, and examples are marked illustrative rather than reusable; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
    Attempts: 0

    VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.378Z, excerpt_hash=sha256:74c4581a8205ba58747cd452f5c0b409b9a318e1becd1e1a0896cfdf6e78e495

    Details:

    BlueprintSnapshotRef:
    - state: current
    - path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-CGF0JK/blueprint/resolved-snapshot.json
    - old_digest: 53d3edfbf7e57db455358f412b35f0b3609ec1a5a9cd928cbd837eac32816b92
    - current_digest: 53d3edfbf7e57db455358f412b35f0b3609ec1a5a9cd928cbd837eac32816b92
    - route_changed: no
    - safe_command: agentplane blueprint snapshot 202606021949-CGF0JK

    <!-- END VERIFICATION RESULTS -->
  Rollback Plan: |-
    - Revert task-related commit(s).
    - Re-run required checks to confirm rollback safety.
  Findings: ""
id_source: "generated"
---
## Summary

Remove hidden-count leakage from README

Update README examples and wording so locked achievement counts are not disclosed and example fragments are explicitly illustrative rather than reusable daily decks.

## Scope

- In scope: Update README examples and wording so locked achievement counts are not disclosed and example fragments are explicitly illustrative rather than reusable daily decks.
- Out of scope: unrelated refactors not required for "Remove hidden-count leakage from README".

## Plan

Update README.md examples and package wording so evening summaries do not disclose opened totals or remaining locked counts, and examples are described as illustrative schema fragments rather than reusable daily decks. Verify by targeted search and repository validation.

## Verify Steps

PLANNER fallback scaffold for "Remove hidden-count leakage from README". Replace with task-specific acceptance checks when PLANNER context is available.

1. Review the requested outcome for "Remove hidden-count leakage from README". Expected: the visible result matches ## Summary and stays inside approved scope.
2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.

## Verification

<!-- BEGIN VERIFICATION RESULTS -->
### 2026-06-02T19:51:24.283Z — VERIFY — ok

By: DOCS

Note: Verified: README no longer discloses opened totals or remaining locked counts, and examples are marked illustrative rather than reusable; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
Attempts: 0

VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.378Z, excerpt_hash=sha256:74c4581a8205ba58747cd452f5c0b409b9a318e1becd1e1a0896cfdf6e78e495

Details:

BlueprintSnapshotRef:
- state: current
- path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-CGF0JK/blueprint/resolved-snapshot.json
- old_digest: 53d3edfbf7e57db455358f412b35f0b3609ec1a5a9cd928cbd837eac32816b92
- current_digest: 53d3edfbf7e57db455358f412b35f0b3609ec1a5a9cd928cbd837eac32816b92
- route_changed: no
- safe_command: agentplane blueprint snapshot 202606021949-CGF0JK

<!-- END VERIFICATION RESULTS -->

## Rollback Plan

- Revert task-related commit(s).
- Re-run required checks to confirm rollback safety.

## Findings
