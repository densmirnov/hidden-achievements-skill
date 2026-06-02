---
id: "202606021950-VANWMT"
title: "Clarify public seal storage and canonical JSON"
result_summary: "Clarified public seal and canonical JSON contract."
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
  updated_at: "2026-06-02T19:50:27.376Z"
  updated_by: "ORCHESTRATOR"
  note: null
verification:
  state: "ok"
  updated_at: "2026-06-02T19:51:24.668Z"
  updated_by: "DOCS"
  note: "Verified: public seal storage is no longer listed as an optional quality source, seal files use public-seal JSON naming, and canonical-json-v1 rules are documented; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  attempts: 0
quality_review:
  state: "pass"
  updated_at: "2026-06-02T19:51:52.155Z"
  updated_by: "EVALUATOR"
  note: "Public seal and canonical JSON contract satisfies approved docs scope."
  evaluated_sha: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  blueprint_digest: "0156c9b7bf1704838282bfcd7ad86d4616772e51227777ef62b876a13523b226"
  evidence_refs:
    - ".agentplane/tasks/202606021950-VANWMT/README.md"
    - ".agentplane/tasks/202606021950-VANWMT/quality/20260602-195152155-recovery-context/quality-report.json"
    - ".agentplane/tasks/202606021950-VANWMT/quality/20260602-195152155-recovery-context/evaluator-prompt.md"
    - ".agentplane/tasks/202606021950-VANWMT/quality/20260602-195152155-recovery-context/evaluator-opinion.md"
    - ".agentplane/tasks/202606021950-VANWMT/blueprint/resolved-snapshot.json"
    - "scripts/validate-skill.sh"
  findings:
    - "Docs use public-seal JSON naming, keep public seal storage required for normal operation, and define canonical-json-v1 runtime compatibility rules; package validation passed."
commit:
  hash: "b60ed056e566ca50a6ce3843159e6adcce215e0b"
  message: "docs: fix hidden achievements protocol"
comments:
  -
    author: "DOCS"
    body: "Start: Clarify public seal JSON storage and canonical-json-v1 commitment rules, then validate the package."
  -
    author: "DOCS"
    body: "Verified: public seal storage, public-seal JSON naming, and canonical-json-v1 compatibility rules are documented, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
events:
  -
    type: "status"
    at: "2026-06-02T19:50:38.779Z"
    author: "DOCS"
    from: "TODO"
    to: "DOING"
    note: "Start: Clarify public seal JSON storage and canonical-json-v1 commitment rules, then validate the package."
  -
    type: "verify"
    at: "2026-06-02T19:51:24.668Z"
    author: "DOCS"
    state: "ok"
    note: "Verified: public seal storage is no longer listed as an optional quality source, seal files use public-seal JSON naming, and canonical-json-v1 rules are documented; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed."
  -
    type: "status"
    at: "2026-06-02T19:52:57.106Z"
    author: "DOCS"
    from: "DOING"
    to: "DONE"
    note: "Verified: public seal storage, public-seal JSON naming, and canonical-json-v1 compatibility rules are documented, with package validation, routing check, ap doctor, targeted searches, and git diff --check passing."
doc_version: 3
doc_updated_at: "2026-06-02T19:52:57.107Z"
doc_updated_by: "DOCS"
description: "Resolve public seal storage wording, public seal file format, and canonical JSON rules so runtimes have a consistent commitment contract."
sections:
  Summary: |-
    Clarify public seal storage and canonical JSON

    Resolve public seal storage wording, public seal file format, and canonical JSON rules so runtimes have a consistent commitment contract.
  Scope: |-
    - In scope: Resolve public seal storage wording, public seal file format, and canonical JSON rules so runtimes have a consistent commitment contract.
    - Out of scope: unrelated refactors not required for "Clarify public seal storage and canonical JSON".
  Plan: "Update SKILL.md and references/schemas.md to separate optional quality sources from required public seal storage, standardize the public seal file as YYYY-MM-DD.public-seal.json, and define canonical-json-v1 enough for runtime compatibility. Verify storage wording, schema examples, and validation checks."
  Verify Steps: |-
    PLANNER fallback scaffold for "Clarify public seal storage and canonical JSON". Replace with task-specific acceptance checks when PLANNER context is available.

    1. Review the requested outcome for "Clarify public seal storage and canonical JSON". Expected: the visible result matches ## Summary and stays inside approved scope.
    2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
    3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.
  Verification: |-
    <!-- BEGIN VERIFICATION RESULTS -->
    ### 2026-06-02T19:51:24.668Z — VERIFY — ok

    By: DOCS

    Note: Verified: public seal storage is no longer listed as an optional quality source, seal files use public-seal JSON naming, and canonical-json-v1 rules are documented; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
    Attempts: 0

    VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.779Z, excerpt_hash=sha256:00407409cde059180dd89b1e7e68f66139d5152e210155dac7e068e9faf4905a

    Details:

    BlueprintSnapshotRef:
    - state: current
    - path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021950-VANWMT/blueprint/resolved-snapshot.json
    - old_digest: 0156c9b7bf1704838282bfcd7ad86d4616772e51227777ef62b876a13523b226
    - current_digest: 0156c9b7bf1704838282bfcd7ad86d4616772e51227777ef62b876a13523b226
    - route_changed: no
    - safe_command: agentplane blueprint snapshot 202606021950-VANWMT

    <!-- END VERIFICATION RESULTS -->
  Rollback Plan: |-
    - Revert task-related commit(s).
    - Re-run required checks to confirm rollback safety.
  Findings: ""
id_source: "generated"
---
## Summary

Clarify public seal storage and canonical JSON

Resolve public seal storage wording, public seal file format, and canonical JSON rules so runtimes have a consistent commitment contract.

## Scope

- In scope: Resolve public seal storage wording, public seal file format, and canonical JSON rules so runtimes have a consistent commitment contract.
- Out of scope: unrelated refactors not required for "Clarify public seal storage and canonical JSON".

## Plan

Update SKILL.md and references/schemas.md to separate optional quality sources from required public seal storage, standardize the public seal file as YYYY-MM-DD.public-seal.json, and define canonical-json-v1 enough for runtime compatibility. Verify storage wording, schema examples, and validation checks.

## Verify Steps

PLANNER fallback scaffold for "Clarify public seal storage and canonical JSON". Replace with task-specific acceptance checks when PLANNER context is available.

1. Review the requested outcome for "Clarify public seal storage and canonical JSON". Expected: the visible result matches ## Summary and stays inside approved scope.
2. Run the most relevant validation step for this task. Expected: it succeeds without unexpected regressions in touched behavior.
3. Compare the final result against ## Scope and record any residual follow-up in ## Findings. Expected: open edges are explicit rather than implicit.

## Verification

<!-- BEGIN VERIFICATION RESULTS -->
### 2026-06-02T19:51:24.668Z — VERIFY — ok

By: DOCS

Note: Verified: public seal storage is no longer listed as an optional quality source, seal files use public-seal JSON naming, and canonical-json-v1 rules are documented; scripts/validate-skill.sh, routing check, ap doctor, targeted searches, and git diff --check passed.
Attempts: 0

VerifyStepsRef: doc_version=3, doc_updated_at=2026-06-02T19:50:38.779Z, excerpt_hash=sha256:00407409cde059180dd89b1e7e68f66139d5152e210155dac7e068e9faf4905a

Details:

BlueprintSnapshotRef:
- state: current
- path: /Users/densmirnov/Github/hidden-achievements-skill/.agentplane/tasks/202606021950-VANWMT/blueprint/resolved-snapshot.json
- old_digest: 0156c9b7bf1704838282bfcd7ad86d4616772e51227777ef62b876a13523b226
- current_digest: 0156c9b7bf1704838282bfcd7ad86d4616772e51227777ef62b876a13523b226
- route_changed: no
- safe_command: agentplane blueprint snapshot 202606021950-VANWMT

<!-- END VERIFICATION RESULTS -->

## Rollback Plan

- Revert task-related commit(s).
- Re-run required checks to confirm rollback safety.

## Findings
