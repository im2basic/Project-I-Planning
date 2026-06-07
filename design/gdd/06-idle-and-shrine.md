# GDD 06 — Idle & Shrine

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Project I is an **idle** game first. Heroes fight automatically while the player works. Two distinct passive systems generate value: **Idle Combat Rewards** (loot from auto-battles) and the **Shrine** (Gold-only passive generator). <mark>Adds: Idle Stage Selection UI, Idle ROI display, Active vs. Offline simulation rules.</mark>

## 2. Player Fantasy

> *I started the game when I sat down at my desk. Eight hours later I tab back in and there's a satisfying pile of loot waiting — enough to actually progress my heroes tonight.*

## 3. Detailed Rules

### 3.1 Idle Combat Rewards

While the game is **open** (active background), heroes run the selected idle stage on loop and collect:

- **Gold** — based on stage Gold/clear × clears/hour
- **Hero EXP** — Small/Medium EXP Crystals only, no Legendary from idle
- **Equipment** — drops per stage table; Epic+ has small chance, Legendary only on idle every ~3 hours on appropriate stages
- **Enhancement Materials** — Common/Rare Enhance Stones
- **Summon Currency (Rare)** — small Gem trickle, ~30/hour at Stage 50+
- **Skill Stones** — small drip, gated to stages chapter 5+ (Hard difficulty unlocks higher rates)

**Maximum idle storage:** 12 hours. After 12h, no further accumulation until claimed.

<mark>**Quality-of-life:** If idle storage caps, a desktop notification fires (toggleable in settings). Compact window also shows a "STORAGE FULL" badge.</mark>

### 3.2 Active vs. Offline Idle (NEW)

<mark>

Two distinct simulation modes:

| Mode | Rate | When |
|------|------|------|
| **Active** | 100% | Game window open (compact OR expanded), focused or unfocused |
| **Background** | 100% | Game running in system tray (TBH-style) |
| **Sleep / Closed** | 75% | Computer sleeping OR game fully closed; capped at 12-hour window |

The 75% offline rate is a small "thank you for keeping the game open" incentive without punishing players for closing their PC.

**Idle accumulation always caps at 12 hours of equivalent rate**, so a player who's offline for 4 days does NOT get 4 days of rewards on login.

**Simulation determinism:** offline accumulation is computed at login time using a deterministic seed (saved with the player profile). This means: (a) the player can't cheat by changing system clock, (b) re-simulating offline rewards gives the same result. See `gdd/17-save-system.md`.

</mark>

### 3.3 Idle Stage Selection (NEW)

<mark>

The player can idle on **any previously cleared stage**. Compact and Expanded windows both surface a "Currently Idling On: Chapter 4-7 (Normal)" indicator with a **Change Stage** button.

The Idle Stage Picker shows a sortable list of all unlocked stages with:

| Column | What it shows |
|--------|---------------|
| Stage name | Chapter 4-7 Normal |
| Last-clear time | Mean battle time × 60 / clears-per-hour |
| Gold / hour | Estimated gold drop rate |
| EXP / hour | Estimated EXP drop |
| Drop preview | Top 3 items by drop chance with element / rarity badge |
| Success rate | Auto-mode win rate from last 20 attempts (e.g., "95%") |
| 3-star tier reached | Best clear tier badge |

**Recommendation badge:** the highest-value stage that the current team can clear at ≥90% rate gets a 🌟 "Recommended" badge. Players can ignore the recommendation and idle on whatever they want.

**Pinned stages:** the player can pin up to 3 stages for quick-swap. Pinning is local-save, not server-side.

</mark>

### 3.4 Shrine

A persistent Gold-generation building. Generates Gold/hr while online or offline. Has a cap; collected manually (or auto-collected per setting). Levels 1-30 ship at launch (max 30 launch cap; expansions to 50+ later).

| Level | Gold/hr | Cap | Materials needed |
|-------|---------|-----|------------------|
| 1 | 50 | 500 | Free (start) |
| 5 | 150 | 1,500 | Gold only |
| 10 | 500 | 5,000 | Gold + Sacred Pebble × 20 |
| 15 | 1,000 | 10,000 | Gold + Sacred Stone × 5 |
| 20 | 2,000 | 20,000 | Gold + Sacred Stone × 20 |
| 25 | 4,000 | 40,000 | Gold + Sacred Crystal × 5 |
| 30 | 8,000 | 80,000 | Gold + Sacred Crystal × 30 |

<mark>**Auto-collect toggle (setting):** when ON, the shrine empties automatically into the player's gold balance at the moment it hits the cap. Default: OFF (so the player retains the act of "going to claim" — a small dopamine moment).</mark>

<mark>**Shrine collect animation:** shrine collection triggers a brief gold-shower animation + satisfying SFX. Critical for feel.</mark>

### 3.5 Shrine Materials

See `gdd/03-stats-and-progression.md` § 3.7 for the full Sacred Stone ladder.

### 3.6 Daily Gameplay Loop

```
Open game / launch tray
   ↓
Auto-collect or claim Shrine
   ↓
Claim idle rewards
   ↓
Equip / level new gear
   ↓
Run new content (campaign / Tower / Expedition / dailies)
   ↓
Set idle target stage
   ↓
Tab away, work
```

### 3.7 Idle ROI Display (NEW)

<mark>

In the Idle Stage Picker, a small "vs. current" comparison strip shows:

```
Current: Chapter 4-7 Normal — 230 G/hr, 95% success
Recommended: Chapter 5-3 Normal — 280 G/hr (+22%), 92% success
   ↳ "+50 G/hr but 3% more wipes"
```

This is purely informational. Helps min-maxers without forcing them.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Idle gold/hr at stage S | `goldPerClear[S] × (3600 / avgClearSeconds[S])` |
| Offline accumulation | `min(hoursAway, 12) × idleRate × 0.75` (Sleep / Closed) |
| Shrine accumulation | `Shrine.rate × elapsedHours, capped at Shrine.cap` |
| Win rate estimate | Last 20 attempts on this stage with current team |

## 5. Edge Cases

- **Player logs in after 24h:** they get 12h of accumulation (cap), not 24h. UI explicitly shows "Storage was full — collect more frequently to maximize."
- **Idle target stage is deleted by patch:** auto-revert to last successfully cleared stage; flash a notice.
- **Team is too weak for current idle stage:** auto-wipe-downgrade (3 consecutive wipes) triggers per `01-combat.md` § 3.9.
- **Player changes idle stage mid-accumulation:** previous accumulated rewards are NOT lost; they're calculated against the OLD stage at the moment of change. The new stage starts fresh.
- **Daylight savings / system clock jumps:** server-validated time (or local time + clock-tamper detection) prevents exploits.

## 6. Dependencies

- `01-combat.md` — combat simulation runs idle battles
- `03-stats-and-progression.md` — Shrine materials
- `09-campaign-structure.md` — drop tables per stage
- `15-desktop-window-ux.md` — compact-mode idle visualization, notifications
- `17-save-system.md` — deterministic offline simulation, anti-tamper
- `21-liveops-and-telemetry.md` — Shrine drop-rate hot-config

## 7. Tuning Knobs

- Idle cap (12 hours)
- Offline rate (75%)
- Shrine level table (3.4)
- Auto-collect default OFF
- ROI threshold (recommend stage when ≥10% G/hr improvement with ≥85% success rate)

## 8. Acceptance Criteria

1. ✅ Player who closes the game for 8 hours gets exactly 8h × 0.75 = 6h of equivalent rewards.
2. ✅ Player closed for 30 hours gets capped at 12h of rewards.
3. ✅ <mark>Idle target stage is configurable from compact AND expanded mode.</mark>
4. ✅ <mark>Recommendation badge appears on highest-ROI stage with ≥90% success rate.</mark>
5. ✅ <mark>Shrine auto-collect toggle works correctly (when ON, collects at cap; OFF requires manual).</mark>
6. ✅ <mark>Desktop notification fires when idle storage caps (if notifications enabled).</mark>
7. ✅ <mark>Offline simulation is deterministic for the same seed (testable).</mark>
