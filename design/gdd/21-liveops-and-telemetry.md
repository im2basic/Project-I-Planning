# GDD 21 — Live-Ops, Telemetry, Security

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>Architecture for **running the game as a service**, even at launch with no live events. Covers: hot-config (server-driven balance), event calendar, maintenance broadcasts, telemetry events, anti-cheat basics, IAP receipt validation.</mark>

## 2. Player Fantasy

> *The game changes and grows over time without me having to download a patch every time the meta shifts.*

## 3. Detailed Rules

### 3.1 Hot-Config (server-driven balance)

<mark>

A set of game-balance values lives in a JSON config file fetched on launch (and periodically refreshed):

```json
{
  "version": "2026-06-15-001",
  "gacha": {
    "rates": { "legendary": 0.006, "epic": 0.072, "rare": 0.922 },
    "hardPity": 50,
    "freeDailyPullEnabled": true
  },
  "shrine": {
    "auto_collect_default": false,
    "levels": [ { "level": 1, "rate": 50, "cap": 500 }, ... ]
  },
  "battlePass": {
    "currentSeasonId": "season-1",
    "tierXpCost": 1000,
    "endsAt": "2026-08-15T04:00:00Z"
  },
  "currentLimitedBanner": {
    "heroId": "kaida",
    "endsAt": "2026-07-06T04:00:00Z"
  },
  "featuredChapterOfTheWeek": 5,
  "missions": { ... },
  "shopPrices": { ... },
  "dropTables": { ... }
}
```

**Fetched on:** game start, and every 4 hours during play.
**Fallback:** last cached config if server unreachable.
**Validation:** SHA-256 signature verified against embedded public key — prevents config injection.

This means: balance tuning, banner rotation, BP season transitions, event calendar all happen **without an app update**. Critical for live-ops at scale.

</mark>

### 3.2 Event Calendar (post-launch)

<mark>

Even though no events ship at launch, the calendar architecture is in place:

```json
{
  "events": [
    {
      "id": "event-summer-2026",
      "startsAt": "2026-07-01T04:00:00Z",
      "endsAt": "2026-07-15T04:00:00Z",
      "type": "limited-stage",
      "config": { ... }
    }
  ]
}
```

Events can be:
- **Limited stages** (with own drop tables)
- **Bonus rate** (e.g., +50% Gold for 48h)
- **Free pull** (1 free Limited pull during event)
- **Cosmetic-only** (limited cosmetics)
- **Maintenance** (server-side notice)
- **Compensation** (mass mail to all players)

Each event runs through the same config system. UI surfaces upcoming events in the Home dashboard.

</mark>

### 3.3 Maintenance Broadcast

<mark>

When server pushes a maintenance notice, all clients receive on next launch:

```json
{
  "maintenance": {
    "active": true,
    "message": "Balance patch in progress; expect downtime until 04:00 UTC",
    "expectedEndsAt": "2026-06-15T08:00:00Z"
  }
}
```

Banner UI overlays the game with a dismissible notification. If `maintenance.active = true` AND the game requires server validation (gacha pulls, IAP), block those actions with a clear message.

</mark>

### 3.4 Telemetry Events

<mark>

Game emits telemetry events to a backend (e.g., GameAnalytics, PostHog, or custom):

**Funnel events:**
- `app.launched`
- `app.tutorial.started`
- `app.tutorial.step.completed` (n)
- `app.tutorial.completed`
- `app.first_pull` (banner, result rarity)
- `app.first_purchase` (productId, amountUSD)
- `app.account.day_n_active` (n: 1, 3, 7, 14, 30)

**Combat events:**
- `combat.battle.started` (stage, difficulty)
- `combat.battle.outcome` (win/loss/wipe, turns, deaths)
- `combat.idle.simulation` (elapsedHours, lootValue)

**Progression events:**
- `progression.level_up` (heroId, fromLevel, toLevel)
- `progression.promote` (heroId, fromStar, toStar)
- `progression.awaken` (heroId, awakeningLevel)
- `progression.skill_upgrade` (heroId, skillId, fromRank, toRank)

**Economy events:**
- `economy.gem_spend` (amount, sink)
- `economy.crystal_spend` (amount, sink)
- `economy.crystal_purchase` (productId, amountUSD)
- `economy.shrine.collect` (gold)
- `economy.idle.claim` (gold, exp, items)

**Engagement events:**
- `engagement.daily.completed` (points)
- `engagement.weekly.completed`
- `engagement.bp.tier_up` (tier, premium)
- `engagement.tower.floor_cleared` (floor)
- `engagement.expedition.dispatched` / `completed`

**Privacy:**
- Player can opt-out via Settings → Account → Telemetry
- Even with opt-in, no PII is collected (no email, no IP-mapped location, no install fingerprint beyond Steam ID)
- All events are batched and sent on session end / 5-min cadence

</mark>

### 3.5 Anti-Cheat Basics

<mark>

Project I is **single-player**, but anti-cheat still matters because:
1. IAP is real money. Cheaters who edit saves to grant themselves Crystals avoid payment.
2. Tower of Trials has leaderboards. Cheaters can rank artificially.
3. Achievement Steam-integration — fake completes pollute the Steam ecosystem.

**Mitigations:**
- Save file checksum + obfuscation (see `gdd/17-save-system.md`)
- Steam Cloud sync — only synced saves can earn ladder/Steam achievements
- Server-side validation for: gacha pulls, IAP grants, Tower floor claims, Boss Rush clears
- Tower leaderboard: combat replays validated server-side (deterministic re-simulation must match claimed clear)
- Cheaters: not banned (single-player), but their ladder entries are excluded and Steam achievements rejected

**Cheat Engine detection (passive):**
- Memory tampering watcher on critical values (Gem balance, Crystal balance, current gacha pity)
- If tampering detected → flag account for offline review (no immediate consequence; manual review for ladder/achievement exclusion)

</mark>

### 3.6 IAP Receipt Validation

<mark>

All IAP purchases follow:

```
1. Player clicks "Buy" → Steam dialog opens
2. Player confirms → Steam processes payment
3. Steam returns transaction ID + receipt
4. Client validates receipt against Steam Web API
5. If valid: grant in-game items, store receipt in purchaseHistory
6. If invalid: reject grant, log incident, surface error to player
```

**Refund handling:**
- Steam sends webhook → game tracks receipt status
- If refund detected: revoke granted items if possible (Crystals reduced; Gems removed; if already spent, balance goes negative — block further purchases until balance balances)
- Player notified via in-game mail

</mark>

### 3.7 Server / Backend Stack (minimum viable)

<mark>

Required backend services for v1:

| Service | Provider | Purpose |
|---------|----------|---------|
| Config Server | Custom (AWS/GCP) or Firebase Remote Config | Hot-config delivery |
| Telemetry | GameAnalytics / PostHog | Event ingestion |
| Steam API | Steam Web API | Receipt validation, achievement grants |
| Crash Reporting | Sentry / Unity Cloud Diagnostics | Stability monitoring |
| Customer Support | Helpscout / Zendesk | Ticket handling (post-launch) |
| Leaderboard | Steam Leaderboard API | Tower monthly leaderboard |

**Latency target:** Config fetch < 500ms; telemetry batching < 5 min cadence; receipt validation < 2s.

</mark>

### 3.8 Compensation System

<mark>

For when things go wrong (server outage, balance bug, lost rewards):

1. Operations identifies affected players (could be all, or a segment)
2. Bulk mail with explanation + compensation items
3. Items expire 30 days
4. Player sees clear "Apology Gift" mail entry

Standard compensation packages:
- **Minor:** 100 Gems + 1 Standard Ticket
- **Medium:** 500 Gems + 1 Limited Ticket + 50 Skill Stones
- **Major:** 1,500 Gems + 5 Limited Tickets + 1 Pristine Element Crystal

</mark>

### 3.9 News / Patch Notes

<mark>

Patch notes published via:
- In-game news carousel (Home dashboard)
- Steam announcement
- Website (post-launch)

Each patch tagged with:
- Version number
- Changelog (player-friendly summary)
- Compensation for bugs being fixed (if any)
- New content list
- Balance change list

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Config refresh cadence | every 4 hours |
| Telemetry batch cadence | every 5 minutes |
| Compensation tier formula | based on bug severity (Minor/Medium/Major) |
| Leaderboard server validation | re-simulate combat with stored seed; compare outcome |

## 5. Edge Cases

- **Offline first launch:** use embedded default config until first sync.
- **Telemetry endpoint unreachable:** queue events locally; flush on next sync.
- **Steam Web API down during purchase:** purchase completes (Steam handles it), grant deferred until next sync. Player notified.
- **Two simultaneous IAP attempts from same account:** deduplicated by transaction ID.
- **Compensation mail expires:** items lost. UI showed 7-day warning. Player can re-request via support (manual review).

## 6. Dependencies

- `05-gacha-and-currencies.md` — gacha pull server validation
- `10-tower-of-trials.md` — leaderboard validation
- `13-battle-pass.md` — BP season transitions via config
- `14-monetization.md` — receipt validation
- `15-desktop-window-ux.md` — Telemetry opt-out setting
- `17-save-system.md` — purchase history, save validation

## 7. Tuning Knobs

- Config refresh interval (4h)
- Telemetry batch size / cadence
- Anti-cheat sensitivity (passive monitoring thresholds)
- Compensation tier amounts
- Leaderboard re-simulation cadence

## 8. Acceptance Criteria

1. ✅ <mark>Config fetches on launch and re-fetches every 4 hours.</mark>
2. ✅ <mark>Banner / BP / event schedule changes apply via config without app update.</mark>
3. ✅ <mark>Telemetry events fire correctly (testable via debug log).</mark>
4. ✅ <mark>IAP receipts validate against Steam Web API.</mark>
5. ✅ Failed IAP validation surfaces clear error.
6. ✅ <mark>Save tampering blocks gacha + ladder entries (but allows continued single-player play).</mark>
7. ✅ <mark>Compensation mail can be sent to all players via ops dashboard (or scripted).</mark>
8. ✅ Telemetry respects opt-out setting.
