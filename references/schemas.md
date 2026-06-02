# Schemas for Hidden Daily Achievements

Use these schemas to implement runtime configuration, normalized events, private daily decks, triggers, and ledger records.

## Contents

- Runtime configuration
- Capability manifest
- Adapter contract
- Normalized chat event
- Normalized task event
- Supported event types
- Daily deck schema
- Scheduled snapshot fallback source
- Trigger schema patterns
- Ledger schemas

## Runtime configuration

```yaml
skill_config:
  timezone: "Etc/UTC"
  workdays: ["Mon", "Tue", "Wed", "Thu", "Fri"]
  achievement_count: 12
  achievement_count_min: 6
  achievement_count_max: 12
  strict_count_mode: false
  configured_workday_start_time: "09:00"
  daily_brief_event: "daily_brief_sent"
  evening_summary_event: "evening_summary_started"
  public_generation_announcement: false
  reveal_locked_at_evening: false
  max_instant_announcements_per_day: 4
  default_language: "en"
  admin_users:
    - "@admin"
  chat:
    system: "generic_chat"
    main_channel_id: "{{MAIN_CHANNEL_ID}}"
  task_tracker:
    system: "generic_tasks"
    project_id: "{{PROJECT_ID}}"
    statuses: ["Inbox", "Todo", "In Progress", "Blocked", "Need answer", "Done"]
    priority_labels: ["P0", "P1", "P2"]
  project_board:
    system: "generic_board"
    project_id: "{{BOARD_ID}}"
  knowledge_base:
    system: "generic_git_or_docs"
    public_path: "knowledge/gamification/"
    private_runtime_path: "runtime/gamification/"
  team_profile:
    members:
      - id: "user_1"
        chat_handle: "@user1"
        task_handle: "user1"
        role: "Product"
        domains: ["customer", "sales", "strategy"]
      - id: "user_2"
        chat_handle: "@user2"
        task_handle: "user2"
        role: "Engineering"
        domains: ["backend", "deploy", "integrations"]
      - id: "user_3"
        chat_handle: "@user3"
        task_handle: "user3"
        role: "Operations"
        domains: ["delivery", "process", "documentation"]
```

Treat every value as runtime input. Avoid hardcoding organization names, repository URLs, personal names, private chat IDs, customer names, or domain-specific vendor names in the skill package.

## Capability manifest

Adapters should expose a capability manifest before the skill runs. Missing optional capabilities should reduce deck specificity. Missing required capabilities should disable the skill.

```yaml
capabilities:
  chat:
    read_messages: true
    read_threads: true
    send_messages: true
    stable_message_ids: true
  tasks:
    read_tasks: true
    read_comments: true
    read_status_changes: true
    read_assignees: true
    stable_task_event_ids: true
  storage:
    private_state: true
    append_only_private_ledger: true
    public_seal: true
    public_ledger: true
  identity:
    stable_actor_ids: true
    chat_to_task_mapping: true
  time:
    local_date: true
    timezone: true
  optional:
    daily_brief: true
    project_board: false
    knowledge_base: false
    weekly_context: false
```

## Adapter contract

Each external adapter must map source events to normalized events.

```yaml
adapter_contract:
  event_id:
    required: true
    rule: "Stable across retries. Use a deterministic synthetic ID if the source does not provide one."
  event_type:
    required: true
    rule: "One of supported event_types or a documented extension."
  occurred_at:
    required: true
    rule: "ISO-8601 with timezone."
  actor:
    required: true
    rule: "Canonical internal user_id plus available external handles."
  source:
    required: true
    rule: "Source system, object IDs, and source_url when available."
  text:
    required_when_textual: true
    rule: "Raw observed text, not a model summary."
  bot_or_system_event:
    required: true
    rule: "Mark bot, automation, and system events so they can be excluded unless explicitly allowed."
  thread_context:
    required_when_available: true
    rule: "Preserve reply parent, thread ID, and related task link when available."
```

Synthetic event IDs should be derived from source system, event type, source object ID, actor ID, occurred-at timestamp, and a hash of raw observed text or state-change fields.

## Normalized chat event

```yaml
event_id: "chat:channel:message_id"
event_type: "chat_message_created"
occurred_at: "YYYY-MM-DDTHH:MM:SS+00:00"
actor:
  user_id: "user_1"
  chat_handle: "@user1"
  task_handle: "user1"
source:
  system: "generic_chat"
  channel_id: "{{CHANNEL_ID}}"
  message_id: "{{MESSAGE_ID}}"
text: "..."
related_task: null
metadata:
  reply_to_event_id: null
  thread_id: null
  source_url: null
  bot_or_system_event: false
  attachments: []
  urls: []
```

## Normalized task event

```yaml
event_id: "task:TASK-123:comment:456"
event_type: "task_comment_created"
occurred_at: "YYYY-MM-DDTHH:MM:SS+00:00"
actor:
  user_id: "user_2"
  chat_handle: "@user2"
  task_handle: "user2"
source:
  system: "generic_tasks"
  project_id: "{{PROJECT_ID}}"
  task_id: "TASK-123"
  comment_id: "456"
text: "Implemented the webhook check. Next step: run the sandbox test."
related_task:
  id: "TASK-123"
  title: "Implement integration"
  status: "In Progress"
  priority: "P0"
  assignee: "user2"
  deadline: "YYYY-MM-DD"
metadata:
  labels: ["integration"]
  source_url: "{{SOURCE_URL_IF_AVAILABLE}}"
  bot_or_system_event: false
```

## Supported event types

```yaml
event_types:
  - chat_message_created
  - task_created
  - task_comment_created
  - task_status_changed
  - task_closed
  - task_assignee_changed
  - task_deadline_changed
  - project_board_item_changed
  - knowledge_file_changed
  - decision_log_entry_created
  - daily_team_activity_check
```

## Daily deck schema

```yaml
version: 1
date: "YYYY-MM-DD"
timezone: "Etc/UTC"
generated_at: "YYYY-MM-DDTHH:MM:SS+00:00"
expires_at: "YYYY-MM-DDT23:59:59+00:00"
public_generation_announcement: false
source:
  type: "daily_brief"
  brief_event_id: "{{BRIEF_EVENT_ID}}"
  brief_sha256: "sha256:..."
  project_snapshot_sha256: "sha256:..."
settings:
  achievement_count: 12
  strict_count_mode: false
  max_instant_announcements_per_day: 4
  reveal_locked_at_evening: false
seal:
  seal_nonce: "base64url-128-bit-or-stronger-random"
  canonicalization:
    json_object_keys: "lexicographic"
    encoding: "UTF-8"
    whitespace: "none"
    array_order: "preserved"
    timestamps: "ISO-8601-with-timezone"
achievements:
  - id: "YYYY-MM-DD-short-kebab-id"
    title: "Short playful title"
    visibility: "hidden"
    category: "operations"
    rarity: "common"
    scope: "personal"
    eligible_users: ["@user1", "@user2", "@user3"]
    target_context:
      focus_terms: []
      related_tasks: []
      related_statuses: []
      related_domains: []
    private_condition: "One sentence describing what must happen."
    trigger:
      any: []
    verifier:
      type: "deterministic"
      require_meaningful_progress: true
      reject_if_only_mentions_keyword: true
    anti_spam:
      once_per_user_per_day: true
      once_per_achievement_per_day: false
      min_meaningful_chars: 40
      ignore_messages_with_only_keywords: true
    reward:
      xp: 10
    announce:
      mode: "evening_batch"
      text: "✨ @{user} opened hidden achievement: “{title}”. {short_reason}"
```

Scheduled snapshot fallback source:

```yaml
source:
  type: "scheduled_snapshot"
  generated_after: "configured_workday_start_time"
  recent_context_window_hours: 24
  project_snapshot_sha256: "sha256:..."
  recent_context_sha256: "sha256:..."
  reason: "daily_brief_event_unavailable"
```

## Trigger schema patterns

Use deterministic trigger fields only when the runtime can check them.

```yaml
trigger:
  any:
    - event_type: "task_comment_created"
      task_matches_any: ["TASK-123"]
      text_contains_any: ["decision", "owner", "deadline", "next step"]
      min_meaningful_chars: 80
    - event_type: "task_status_changed"
      to_status_any: ["Blocked", "Need answer"]
    - event_type: "chat_message_created"
      text_contains_any: ["blocked", "blocker", "waiting", "cannot continue"]
      min_meaningful_chars: 40
```

Common trigger fields:

```yaml
fields:
  event_type: string
  actor_any: [string]
  text_contains_any: [string]
  also_contains_any: [string]
  min_meaningful_chars: integer
  task_matches_any: [string]
  task_priority_any: [string]
  task_deadline_is_today: boolean
  before_deadline: boolean
  from_status_any: [string]
  to_status_any: [string]
  labels_include_any: [string]
  created_from_chat: boolean
  references_chat_discussion: boolean
  path_matches_any: [string]
```

## Ledger schemas

Write the private ledger as append-only JSONL.

```json
{
  "version": 1,
  "type": "award",
  "date": "YYYY-MM-DD",
  "achievement_id": "YYYY-MM-DD-short-kebab-id",
  "title": "Fog Cutter",
  "category": "communication",
  "rarity": "uncommon",
  "scope": "personal",
  "user_id": "user_1",
  "chat_handle": "@user1",
  "task_handle": "user1",
  "awarded_at": "YYYY-MM-DDTHH:MM:SS+00:00",
  "source_event_id": "chat:channel:message_id",
  "source_url": "{{SOURCE_URL_IF_AVAILABLE}}",
  "event_hash": "sha256:...",
  "reason_public": "@user1 summarized the decision, owner, and next step.",
  "reason_private": "The event includes decision, owner, next step, and task reference.",
  "verifier": {
    "type": "llm_strict",
    "confidence": 0.91,
    "evidence": ["event.text", "event.related_task.id"]
  },
  "announced": true,
  "announcement_event_id": "chat:channel:message_id"
}
```

Write the public ledger as markdown or JSON without private fields.

```json
{
  "version": 1,
  "type": "public_award",
  "date": "YYYY-MM-DD",
  "achievement_id": "YYYY-MM-DD-short-kebab-id",
  "title": "Fog Cutter",
  "scope": "personal",
  "chat_handle": "@user1",
  "reason_public": "@user1 summarized the decision, owner, and next step.",
  "xp": 10,
  "announcement_event_id": "chat:channel:message_id"
}
```

The public ledger must not include raw message text, hidden conditions, locked titles, source URLs for private systems, private channel IDs, customer names, verifier confidence, private reasons, or raw evidence.

Correction entry:

```json
{
  "version": 1,
  "type": "reversal",
  "date": "YYYY-MM-DD",
  "achievement_id": "YYYY-MM-DD-short-kebab-id",
  "user_id": "user_1",
  "reversed_at": "YYYY-MM-DDTHH:MM:SS+00:00",
  "reason": "manual admin correction"
}
```
