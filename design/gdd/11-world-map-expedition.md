# GDD 11 — World Map & Expedition

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>**World Map / Expedition** is a passive-dispatch system. The player sends parties of low-rarity or off-team heroes on **timed missions** (1h / 4h / 8h / 12h) to gather materials, gold, EXP, gear, and rare drops. Up to 4 simultaneous expeditions. No combat — pure passive timer with reward roll on completion.</mark>

## 2. Player Fantasy

> *The heroes I'm not actively using still earn me real rewards. Even my 1★ Slime is a working member of the team.*

## 3. Detailed Rules

### 3.1 Structure

<mark>

- **Expedition Slots:** start with 1, expand to 4 via account level / BP rewards.
- **Mission Types:** 1h / 4h / 8h / 12h — each tier with several mission variations.
- **Crew Requirements:** each mission specifies hero count (1-4) and any class/element requirements.

</mark>

### 3.2 Mission Examples

<mark>

| Mission | Duration | Crew | Rewards |
|---------|----------|------|---------|
| Forest Scouting | 1h | 1 hero | 200 Gold, 50 Small EXP Crystals |
| Sea Patrol | 1h | 1 Water hero | 200 Gold, 50 Small EXP Crystals, 1 chance Water Crystal |
| Ember Run | 4h | 2 heroes incl. 1 Fire | 1,500 Gold, 1 Common Egg, Lesser Fire Crystal |
| Volcano Tomb | 8h | 3 heroes | 4,000 Gold, 1 Epic gear roll, 2 Sacred Stone |
| Boss Site Recon | 8h | 1 hero L40+ | 4,000 Gold, 50 Gems, possible Reroll Stone |
| Lost Sanctum | 12h | 4 heroes | 8,000 Gold, 2 Epic gear roll, Pristine Element Crystal (random), 1 chance for Hero Shard pack |

</mark>

### 3.3 Mission Rotation

<mark>

A pool of ~30 missions exists. **3 are active at any given time**, refreshing every 6 hours. Players who time their logins around refreshes can chain missions efficiently.

Each refresh cycle picks 3 missions weighted by:
- Player chapter progress (later missions unlock at chapter milestones)
- Time-tier variety (always at least one short, one medium, one long mission available)
- Element variety (rotates which elements are required across the cycle)

</mark>

### 3.4 Crew Selection

<mark>

The player selects heroes to dispatch. Constraints:

- Heroes used on an expedition **cannot be used in active combat** until the mission completes.
- Heroes on the **idle target stage team** ARE allowed to be expedition crew (idle team is separate).
- Heroes used as **Shrine workers** are excluded from expedition (must be unassigned first).
- Crew must meet **mission requirements** (count, class, element).

**Crew bonuses:**
- Higher-rarity crew = +X% reward chance (e.g., 5★ crew member = +25% Gold)
- Element match (crew element matches mission "element required") = +20% main-loot chance
- All crew members have the same element = +30% Element Crystal chance

</mark>

### 3.5 Quick-Send Logic

<mark>

Players who don't want to manage crew can tap **Quick-Send** to auto-assign:
- Selects appropriate heroes by class + element + level fitness
- Avoids using heroes currently in the main battle team
- Confirm preview shown before commit

</mark>

### 3.6 Completion

- Mission timer counts down even while game is closed.
- Notification on completion (per setting).
- Player must manually **claim** rewards (no auto-claim). Crew is freed at claim time.
- Reward roll uses a deterministic seed (testable, anti-cheat) per `gdd/17-save-system.md`.

### 3.7 Expedition vs. Idle Combat

| Aspect | Idle Combat | Expedition |
|--------|-------------|------------|
| Active heroes | 3 hero team | 1-4 hero crew |
| Outputs | Stage drops, EXP, gold, gear | Specific mission rewards |
| Active simulation? | Yes (combat ticks) | No (just timer) |
| Hero overlap allowed? | No (combat team and expedition crew can't overlap) | — |
| Best for | Gold, gear, EXP grind | Specific materials, eggs, Gems |

The two systems complement each other — players running an active combat team can also send 4 expeditions on idle heroes simultaneously.

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Crew bonus (rarity) | `+5% per crew star tier above 1★, capped at +25%` |
| Element-match bonus | flat +20% main reward chance |
| All-element bonus | flat +30% Element Crystal chance |
| Mission refresh time | every 6h since launch UTC |

## 5. Edge Cases

- **Crew hero deleted mid-mission:** mission completes normally, but rewards are reduced by 25% per missing crew member.
- **All slots full + mission expires:** rewards are mailed to the player (claim within 30 days).
- **Cross-mission element bonus stacking:** an Element Match bonus applies per-mission only; the All-Element bonus stacks with element-match.
- **Quick-Send picks a hero already on idle combat team:** Quick-Send respects this — skips that hero, picks next-fit.
- **Mission requirements not met:** dispatch button disabled with tooltip explaining which requirement is unmet.

## 6. Dependencies

- `03-stats-and-progression.md` — hero rarity, EXP rewards
- `06-idle-and-shrine.md` — Shrine workers exclusion, idle team
- `07-eggs-and-fusion.md` — eggs as reward
- `13-battle-pass.md` — expedition slot expansion from BP
- `17-save-system.md` — deterministic mission completion roll

## 7. Tuning Knobs

- Mission pool size (currently ~30)
- Refresh interval (currently 6h)
- Mission duration tiers (1/4/8/12h)
- Reward magnitudes per mission tier
- Crew bonus magnitudes (4)
- Number of expedition slots (1 → 4)

## 8. Acceptance Criteria

1. ✅ <mark>4 expedition slots are unlockable via account progression.</mark>
2. ✅ <mark>Missions refresh every 6 hours.</mark>
3. ✅ <mark>Crew bonuses apply correctly to reward rolls.</mark>
4. ✅ <mark>Quick-Send finds valid crew without overlapping active battle team.</mark>
5. ✅ <mark>Reward roll uses deterministic seed.</mark>
6. ✅ <mark>Hero locked on expedition cannot be used in active combat until claim.</mark>
