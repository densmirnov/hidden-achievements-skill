---
id: "202606021949-281TAX"
title: "Fix instant announcement predicate"
result_summary: "Fixed missing OR in instant announcement predicate."
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
  updated_at: "2026-06-02T19:50:26.906Z"
  updated_by: "ORCHESTRATOR"
  note: null
verification:
  state: "ok"
  updated_at: "2026-06-02T19:51:24.096Z"
  updated_by: "DOCS"
  note: "Verified: announcement predicate now has explicit OR branches in SKILL.md, INSTALL.md, and references/policies.md; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  attempts: 0
quality_review:
  state: "pass"
  updated_at: "2026-06-02T19:51:51.398Z"
  updated_by: "EVALUATOR"
  note: "Announcement predicate fix satisfies approved docs scope."
  evaluated_sha: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  blueprint_digest: "a2aa647b0b3b35f206a748bcfb4e655429d16284268a3c689ebec5cd9e60239a"
  evidence_refs:
    - ".agentplane/tasks/202606021949-281TAX/README.md"
    - ".agentplane/tasks/202606021949-281TAX/quality/20260602-195151398-recovery-context/quality-report.json"
    - ".agentplane/tasks/202606021949-281TAX/quality/20260602-195151398-recovery-context/evaluator-prompt.md"
    - ".agentplane/tasks/202606021949-281TAX/quality/20260602-195151398-recovery-context/evaluator-opinion.md"
    - ".agentplane/tasks/202606021949-281TAX/blueprint/resolved-snapshot.json"
    - "scripts/validate-skill.sh"
  findings:
    - "The predicate now uses explicit OR before rarity in SKILL.md, INSTALL.md, and references/policies.md; package validation and routing checks passed."
commit:
  hash: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  message: "docs: fix hidden achievements protocol"
comments:
  -
    author: "DOCS"
    body: "Start: Correct announcement predicate OR branches in SKILL.md, INSTALL.md, and references/policies.md, then validate the package."
  -
    author: "DOCS"
    body: "Verified: announcement predicate uses explicit OR branches across the skill, install guide, and policy reference, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
events:
  -
    type: "status"
    at: "2026-06-02T19:50:38.203Z"
    author: "DOCS"
    from: "TODO"
    to: "DOING"
    note: "Start: Correct announcement predicate OR branches in SKILL.md, INSTALL.md, and references/policies.md, then validate the package."
  -
    type: "verify"
    at: "2026-06-02T19:51:24.096Z"
    author: "DOCS"
    state: "ok"
    note: "Verified: announcement predicate now has explicit OR branches in SKILL.md, INSTALL.md, and references/policies.md; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  -
    type: "status"
    at: "2026-06-02T19:52:08.506Z"
    author: "DOCS"
    from: "DOING"
    to: "DONE"
    note: "Verified: announcement predicate uses explicit OR branches across the skill, install guide, and policy reference, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
doc_version: 3
doc_updated_at: "2026-06-02T19:52:08.506Z"
doc_updated_by: "DOCS"
description: "Correct the instant announcement policy predicate by adding the missing OR across the skill instructions, install guide, and policy reference."
sections:
  Summary: |-
    Fix instant announcement predicate

    Correct the instant announcement policy predicate by adding the missing OR across the skill instructions, install guide, and policy reference.
  Scope: |-
    - In scope: Correct the instant announcement policy predicate by adding the missing OR across the skill instructions, install guide, and policy reference.
    - Out of scope: unrelated refactors not required for "Fix instant announcement predicate".
  Plan: "Update SKILL.md, INSTALL.md, and references/policies.md so the instant announcement predicate uses explicit OR branches for instant mode, rarity, team scope, and operational importance. Verify by targeted search and repository validation."
  Verify Steps: |-
    PLANNER fallback scaffold for "Fix instant announcement predicate". Replace with task-specific acceptance checks when PLANNER context is available.

    1. Review the requested outcome for "Fix instant announcement predicate". Expected: the visible result matches ## Summary and stays inside approved scope.
    2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
    3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.
  Verification: |-
    <!-- BEGIN VERIFICATION RESULTS -->
    ### 2026-06-02T19:51:24.096Z — VERIFY — ok

    By: DOCS

    Note: Verified: announcement predicate now has explicit OR branches in SKILL.md, INSTALL.md, and references/policies.md; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
    Attempts: 0

    VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.203Z, excerpt_hash=sha256:5d03e112ad8a396d106c0c10c9e1855769e50d9aa060a64812ec03291f73670c

    Details:

    BlueprintSnapshotRef:
    - state: current
    - path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-281TAX/blueprint/resolved-snapshot.json
    - old_digest: a2aa647b0b3b35f206a748bcfb4e655429d16284268a3c689ebec5cd9e60239a
    - current_digest: a2aa647b0b3b35f206a748bcfb4e655429d16284268a3c689ebec5cd9e60239a
    - route_changed: no
    - safe_command: agentplane blueprint snapshot 202606021949-281TAX

    <!-- END VERIFICATION RESULTS -->
  Rollback Plan: |-
    - Revert task-related commit(s).
    - Re-run required checks to confirm rollback safety.
  Findings: ""
id_source: "generated"
---
## Summary

Fix instant announcement predicate

Correct the instant announcement policy predicate by adding the missing OR across the skill instructions, install guide, and policy reference.

## Scope

- In scope: Correct the instant announcement policy predicate by adding the missing OR across the skill instructions, install guide, and policy reference.
- Out of scope: unrelated refactors not required for "Fix instant announcement predicate".

## Plan

Update SKILL.md, INSTALL.md, and references/policies.md so the instant announcement predicate uses explicit OR branches for instant mode, rarity, team scope, and operational importance. Verify by targeted search and repository validation.

## Verify Steps

PLANNER fallback scaffold for "Fix instant announcement predicate". Replace with task-specific acceptance checks when PLANNER context is available.

1. Review the requested outcome for "Fix instant announcement predicate". Expected: the visible result matches ## Summary and stays inside approved scope.
2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.

## Verification

<!-- BEGIN VERIFICATION RESULTS -->
### 2026-06-02T19:51:24.096Z — VERIFY — ok

By: DOCS

Note: Verified: announcement predicate now has explicit OR branches in SKILL.md, INSTALL.md, and references/policies.md; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
Attempts: 0

VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.203Z, excerpt_hash=sha256:5d03e112ad8a396d106c0c10c9e1855769e50d9aa060a64812ec03291f73670c

Details:

BlueprintSnapshotRef:
- state: current
- path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-281TAX/blueprint/resolved-snapshot.json
- old_digest: a2aa647b0b3b35f206a748bcfb4e655429d16284268a3c689ebec5cd9e60239a
- current_digest: a2aa647b0b3b35f206a748bcfb4e655429d16284268a3c689ebec5cd9e60239a
- route_changed: no
- safe_command: agentplane blueprint snapshot 202606021949-281TAX

<!-- END VERIFICATION RESULTS -->

## Rollback Plan

- Revert task-related commit(s).
- Re-run required checks to confirm rollback safety.

## Findings
