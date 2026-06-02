# Security Policy

## Reporting

Report security issues privately to the repository owner.

Do not open public issues containing:

- hidden achievement conditions;
- private deck contents;
- private runtime state;
- private evidence ledger entries;
- credentials, tokens, or private integration URLs;
- customer names or private channel identifiers.

## Scope

Security-sensitive areas include:

- prompt-injection handling for observed chat/task/document content;
- public/private ledger separation;
- salted deck commitment handling;
- admin-only deck inspection;
- adapter identity mapping;
- prevention of retroactive achievement creation.

## Expected Handling

Public artifacts must contain only non-secret seal commitments and opened-achievement summaries. Hidden decks, seal nonces, verifier reasoning, raw evidence, and private source URLs must remain in private runtime storage.
