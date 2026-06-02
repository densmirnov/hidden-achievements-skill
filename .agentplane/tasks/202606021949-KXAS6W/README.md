---
id: "202606021949-KXAS6W"
title: "Align deck generation prompt with runtime-owned fields"
result_summary: "Aligned prompt schema with runtime-owned deck fields."
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
  updated_at: "2026-06-02T19:50:27.203Z"
  updated_by: "ORCHESTRATOR"
  note: null
verification:
  state: "ok"
  updated_at: "2026-06-02T19:51:24.476Z"
  updated_by: "DOCS"
  note: "Verified: references/prompts.md now marks effective_from as runtime-inserted and includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  attempts: 0
quality_review:
  state: "pass"
  updated_at: "2026-06-02T19:51:51.930Z"
  updated_by: "EVALUATOR"
  note: "Prompt schema alignment satisfies approved docs scope."
  evaluated_sha: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  blueprint_digest: "46634f196a5ea2068193ecc4fa3e6b563940d60062c9169e39984796c299f6d2"
  evidence_refs:
    - ".agentplane/tasks/202606021949-KXAS6W/README.md"
    - ".agentplane/tasks/202606021949-KXAS6W/quality/20260602-195151930-recovery-context/quality-report.json"
    - ".agentplane/tasks/202606021949-KXAS6W/quality/20260602-195151930-recovery-context/evaluator-prompt.md"
    - ".agentplane/tasks/202606021949-KXAS6W/quality/20260602-195151930-recovery-context/evaluator-opinion.md"
    - ".agentplane/tasks/202606021949-KXAS6W/blueprint/resolved-snapshot.json"
    - "scripts/validate-skill.sh"
  findings:
    - "references/prompts.md marks effective_from as runtime-inserted and includes trust_mode, nonce_bytes_min, canonicalization, and allow_system_events; package validation passed."
commit:
  hash: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  message: "docs: fix hidden achievements protocol"
comments:
  -
    author: "DOCS"
    body: "Start: Align prompt schema with runtime-owned effective_from and seal fields, then validate prompt/schema consistency."
  -
    author: "DOCS"
    body: "Verified: deck generation prompt now reflects runtime-owned effective_from and schema-aligned seal and verifier fields, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
events:
  -
    type: "status"
    at: "2026-06-02T19:50:38.604Z"
    author: "DOCS"
    from: "TODO"
    to: "DOING"
    note: "Start: Align prompt schema with runtime-owned effective_from and seal fields, then validate prompt/schema consistency."
  -
    type: "verify"
    at: "2026-06-02T19:51:24.476Z"
    author: "DOCS"
    state: "ok"
    note: "Verified: references/prompts.md now marks effective_from as runtime-inserted and includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  -
    type: "status"
    at: "2026-06-02T19:52:56.234Z"
    author: "DOCS"
    from: "DOING"
    to: "DONE"
    note: "Verified: deck generation prompt now reflects runtime-owned effective_from and schema-aligned seal and verifier fields, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
doc_version: 3
doc_updated_at: "2026-06-02T19:52:56.235Z"
doc_updated_by: "DOCS"
description: "Update the generation prompt so runtime-owned timing and seal fields are not LLM-owned, and align the prompt output shape with the reference schema."
sections:
  Summary: |-
    Align deck generation prompt with runtime-owned fields

    Update the generation prompt so runtime-owned timing and seal fields are not LLM-owned, and align the prompt output shape with the reference schema.
  Scope: |-
    - In scope: Update the generation prompt so runtime-owned timing and seal fields are not LLM-owned, and align the prompt output shape with the reference schema.
    - Out of scope: unrelated refactors not required for "Align deck generation prompt with runtime-owned fields".
  Plan: "Update references/prompts.md so LLM output omits runtime-owned effective_from, includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields, and states runtime insertion rules for effective_from. Verify prompt/schema consistency by targeted searches and repository validation."
  Verify Steps: |-
    PLANNER fallback scaffold for "Align deck generation prompt with runtime-owned fields". Replace with task-specific acceptance checks when PLANNER context is available.

    1. Review the requested outcome for "Align deck generation prompt with runtime-owned fields". Expected: the visible result matches ## Summary and stays inside approved scope.
    2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
    3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.
  Verification: |-
    <!-- BEGIN VERIFICATION RESULTS -->
    ### 2026-06-02T19:51:24.476Z — VERIFY — ok

    By: DOCS

    Note: Verified: references/prompts.md now marks effective_from as runtime-inserted and includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
    Attempts: 0

    VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.604Z, excerpt_hash=sha256:f5fb44cd40d100b28ae703f61b1781e90503cee658e572f13a033630500f50fc

    Details:

    BlueprintSnapshotRef:
    - state: current
    - path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-KXAS6W/blueprint/resolved-snapshot.json
    - old_digest: 46634f196a5ea2068193ecc4fa3e6b563940d60062c9169e39984796c299f6d2
    - current_digest: 46634f196a5ea2068193ecc4fa3e6b563940d60062c9169e39984796c299f6d2
    - route_changed: no
    - safe_command: agentplane blueprint snapshot 202606021949-KXAS6W

    <!-- END VERIFICATION RESULTS -->
  Rollback Plan: |-
    - Revert task-related commit(s).
    - Re-run required checks to confirm rollback safety.
  Findings: ""
id_source: "generated"
---
## Summary

Align deck generation prompt with runtime-owned fields

Update the generation prompt so runtime-owned timing and seal fields are not LLM-owned, and align the prompt output shape with the reference schema.

## Scope

- In scope: Update the generation prompt so runtime-owned timing and seal fields are not LLM-owned, and align the prompt output shape with the reference schema.
- Out of scope: unrelated refactors not required for "Align deck generation prompt with runtime-owned fields".

## Plan

Update references/prompts.md so LLM output omits runtime-owned effective_from, includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields, and states runtime insertion rules for effective_from. Verify prompt/schema consistency by targeted searches and repository validation.

## Verify Steps

PLANNER fallback scaffold for "Align deck generation prompt with runtime-owned fields". Replace with task-specific acceptance checks when PLANNER context is available.

1. Review the requested outcome for "Align deck generation prompt with runtime-owned fields". Expected: the visible result matches ## Summary and stays inside approved scope.
2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.

## Verification

<!-- BEGIN VERIFICATION RESULTS -->
### 2026-06-02T19:51:24.476Z — VERIFY — ok

By: DOCS

Note: Verified: references/prompts.md now marks effective_from as runtime-inserted and includes schema-aligned trust_mode, nonce_bytes_min, canonicalization, and allow_system_events fields; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
Attempts: 0

VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.604Z, excerpt_hash=sha256:f5fb44cd40d100b28ae703f61b1781e90503cee658e572f13a033630500f50fc

Details:

BlueprintSnapshotRef:
- state: current
- path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021949-KXAS6W/blueprint/resolved-snapshot.json
- old_digest: 46634f196a5ea2068193ecc4fa3e6b563940d60062c9169e39984796c299f6d2
- current_digest: 46634f196a5ea2068193ecc4fa3e6b563940d60062c9169e39984796c299f6d2
- route_changed: no
- safe_command: agentplane blueprint snapshot 202606021949-KXAS6W

<!-- END VERIFICATION RESULTS -->

## Rollback Plan

- Revert task-related commit(s).
- Re-run required checks to confirm rollback safety.

## Findings
