# Hidden Daily Achievements Skill

A Codex skill for building and operating sealed hidden daily achievements for team agents.

The skill defines a portable protocol for generating a private daily achievement deck, sealing it with a public commitment, evaluating chat/task/project-board/knowledge-base events, preventing retroactive awards, and summarizing only opened achievements.

## What It Covers

- Daily hidden achievement deck generation
- Scheduled fallback when no daily brief exists
- Salted public deck commitment
- Runtime capability contract
- Adapter and normalized event schemas
- Anti-spam and prompt-injection policies
- Strict verifier prompts and award threshold
- Private evidence ledger and public opened-awards ledger
- Behavioral evals for common regressions

## Repository Layout

```text
.
├── SKILL.md
├── INSTALL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── policies.md
│   ├── prompts.md
│   └── schemas.md
├── examples/
│   └── daily-deck-fragment.yml
├── evals/
│   └── evals.json
└── scripts/
    └── validate-skill.sh
```

## Installation

For full agent integration instructions, see [INSTALL.md](INSTALL.md).

Quick install:

```bash
git clone https://github.com/densmirnov/hidden-achievements-skill.git \
  "${CODEX_HOME:-$HOME/.codex}/skills/hidden-achievements-skill"
```

Then invoke the skill explicitly:

```text
Use $hidden-daily-achievements to add sealed hidden daily achievements to a team agent.
```

## Usage

Use this skill when a team agent needs to:

- generate a private daily achievement deck after a daily brief;
- use a scheduled snapshot when no daily brief exists;
- evaluate team chat and task events against sealed conditions;
- prevent keyword farming, status churn, and retroactive awards;
- keep private conditions and evidence out of public channels;
- produce an evening summary of opened achievements only.

The main entrypoint is [SKILL.md](SKILL.md). Detailed schemas, prompts, and policies live under [references/](references/).

## Validation

Run:

```bash
scripts/validate-skill.sh
```

The validation checks:

- `SKILL.md` frontmatter shape and naming rules;
- YAML parsing for `agents/openai.yaml` and example deck fragments;
- JSON parsing for evals;
- absence of common macOS/editor artifacts;
- absence of outdated protocol markers from earlier seal formats.

## Design Notes

The skill follows progressive disclosure:

- `SKILL.md` is the compact operating guide.
- `references/` contains longer implementation details.
- `examples/` contains reusable deck fragments.
- `evals/` contains behavior-focused regression cases.

The hidden deck must stay in private runtime storage. Public storage should contain only non-secret seal commitments and opened-award summaries.

## License

MIT. See [LICENSE](LICENSE).
