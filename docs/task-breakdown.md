# Atomic Task Breakdown

Source: external protocol review pasted on 2026-06-03.

## P0

- [x] Move `seal_nonce` generation out of LLM output and into runtime CSPRNG.
- [x] Define exact `public_seal` schema and commitment input.
- [x] Require `deck.effective_from <= event.occurred_at <= deck.expires_at`.
- [x] Restrict manual awards so they cannot bypass the sealed deck.
- [x] Evaluate eligibility through canonical `actor.user_id`, not display handles.

## P1

- [x] Reject bot/system events by default.
- [x] Bind `announce.mode` to the global instant announcement policy.
- [x] Split public-seal-required operation from private-only development mode.
- [x] Add privacy retention and evidence minimization policy.
- [x] Define cautious leaderboard policy instead of leaving it implicit.

## P2

- [x] Add executable structural eval checks for the protocol regressions covered in this package.
- [x] Add vendor-neutral non-Codex install guidance.
- [x] Add sample adapter mapping guidance for Telegram, Linear, Jira, and GitHub Issues.
