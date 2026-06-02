# Contributing

This repository contains a Codex skill package. Keep changes focused on the skill behavior and packaging.

## Change Guidelines

- Keep `SKILL.md` compact and procedural.
- Put detailed schemas, prompts, and policies in `references/`.
- Put concrete examples in `examples/`.
- Put behavior-focused regression checks in `evals/evals.json`.
- Avoid storing runtime secrets, hidden decks, private ledgers, task URLs, customer names, or private channel IDs in the repository.
- Do not add generated OS/editor artifacts such as `.DS_Store`.

## Validation

Before opening a pull request, run:

```bash
scripts/validate-skill.sh
```

## Pull Requests

Include:

- what changed;
- why it changes the protocol or packaging;
- what validation was run;
- any remaining risk or behavior not covered by evals.
