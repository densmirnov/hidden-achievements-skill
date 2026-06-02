![Hidden Daily Achievements](header.png)

# Hidden Daily Achievements Skill

Hidden Daily Achievements turns normal team work into a lightweight hidden-achievement game.

Every workday the agent silently creates a private deck of hidden achievements, seals it so awards cannot be invented later, watches normal team events during the day, and reveals only the achievements that were actually opened.

**No morning teaser. No leaked conditions. No retroactive awards.**

## How It Feels For The Team

The team just works in chat and task tools as usual.

In the background, the agent may notice useful behavior:

- someone turns a messy discussion into a clear decision;
- someone names a blocker with cause and next step;
- someone moves a stale task forward;
- someone captures a useful customer or product signal;
- the team resolves an operational risk together;
- someone triggers a rare weird achievement with an unusual phrase plus real work.

If an achievement opens, the agent may announce it immediately when it is rare or important. Most opened achievements are batched into the evening summary.

Example evening summary:

```text
🎮 Hidden achievements today
Opened: 5 / 12

🔍 @user1 - "Fog Cutter"
🧱 @user2 - "Blocker Named"
✅ Team - "All Signals Green"

7 achievements remained hidden 🔒
```

Locked titles and locked conditions stay hidden.

## Example Achievements

These are examples of the kind of hidden achievements the skill can generate. The actual daily deck is private and based on the team's current brief, tasks, blockers, and context.

### ⚙️ Operations

#### 🧱 Blocker Named

> Make the invisible obstacle visible.

A user clearly states a blocker, its cause, and the next action needed.

**Trigger examples**

- 🧩 A task is moved to `Blocked` with a useful explanation.
- 🧭 A chat message explains what is blocked, why, and who or what is needed next.

**Possible public reveal**

```text
🧱 @user2 opened "Blocker Named".
Obstacle identified: cause, owner, and next step are now visible.
```

### 💬 Communication

#### 🔍 Fog Cutter

> Turn messy discussion into an executable next step.

A user turns a fuzzy discussion into a decision, owner, next step, and deadline.

**Trigger examples**

- 🧵 A chat thread is summarized into a concrete action plan.
- 📌 A task comment captures the decision and owner after a scattered discussion.

**Possible public reveal**

```text
🔍 @user1 opened "Fog Cutter".
The decision, owner, next step, and deadline are now clear.
```

### 📚 Knowledge

#### 🗂️ Context Preserved

> Save the reason, not just the result.

A user records a decision, tradeoff, or operational insight in a knowledge base or decision log.

**Trigger examples**

- 📝 A decision log entry is created from a chat discussion.
- 🔗 A task is linked to a relevant document with a useful explanation.

**Possible public reveal**

```text
🗂️ @user3 opened "Context Preserved".
The team can now find the decision without replaying the whole thread.
```

### 🎯 Role Or Domain

#### 📡 Signal Broker

> Connect a domain signal to today's work.

A user connects a domain-specific signal to today's project priority.

**Trigger examples**

- 👤 A customer insight is attached to an active product task.
- 🚢 An engineering risk is connected to a deployment or integration plan.

**Possible public reveal**

```text
📡 @user1 opened "Signal Broker".
Useful domain signal connected to today's priority.
```

### 🤝 Team

#### ✅ All Signals Green

> Close the loop together.

Multiple people coordinate to close a shared operational loop.

**Trigger examples**

- 🧱 One person identifies a blocker, another resolves it, and a third updates the task state.
- 🗓️ The team aligns owner, deadline, and next step for a priority item.

**Possible public reveal**

```text
✅ Team opened "All Signals Green".
The operational loop is closed: owner, status, and next step are aligned.
```

### 🌀 Weird

#### 🦫 Capybara Of Context

> Be strange, but useful.

A user mentions an unusual word such as `capybara` in a message that also contains useful work context.

This is not awarded for the word alone.

**Good**

```text
🦫 Capybara of conversion: 2 of 5 pilot users dropped at payment step;
added this to TASK-123 and proposed a fix.
```

**Bad**

```text
🦫 capybara capybara capybara
```

**Possible public reveal**

```text
🦫 @user2 opened legendary hidden achievement "Capybara Of Context".
The metrics are useful. The mascot is unexplained.
```

## What The Skill Prevents

- Retroactive achievement creation after an impressive event.
- Keyword farming and meme spam.
- Status churn such as moving tasks back and forth.
- Rewards for being always online or working late.
- Public leaks of hidden titles, hidden conditions, private evidence, or verifier reasoning.
- Prompt injection from task comments, chat messages, documents, URLs, or user-authored metadata.

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
- tracked macOS/editor artifacts;
- outdated protocol markers from earlier seal formats.

## Design Notes

The skill follows progressive disclosure:

- `SKILL.md` is the compact operating guide.
- `references/` contains longer implementation details.
- `examples/` contains reusable deck fragments.
- `evals/` contains behavior-focused regression cases.

The hidden deck must stay in private runtime storage. Public storage should contain only non-secret seal commitments and opened-award summaries.

## License

MIT. See [LICENSE](LICENSE).
