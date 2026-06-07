# GDD 07 — Eggs & Fusion

## 1. Overview

The Egg system supplies a steady stream of 1★–3★ units used as **promotion fodder**, **Shrine workers** (passive Gold buff), and **Expedition crew**. Eggs are obtained via Gold purchase, story rewards, dailies, and events. They hatch on timers via the Hatchery building. <mark>Adds: full hatch reward tables, fusion ladder confirmation, instant-hatch pricing.</mark>

## 2. Player Fantasy

> *Between gacha sessions, there's always another egg ticking down. The small wins make the big wins feel earned.*

## 3. Detailed Rules

### 3.1 Egg Tiers

| Egg | Hatch time | Cost | Drop pool |
|-----|------------|------|-----------|
| Common Egg | 1 hour | 500 Gold | 100% 1★ |
| Uncommon Egg | 4 hours | 2,500 Gold | 85% 1★, 15% 2★ |
| Rare Egg | 8 hours | 15,000 Gold | 60% 1★, 35% 2★, 5% 3★ |
| Epic Egg (event/shop only) | 12 hours | — | 30% 2★, 60% 3★, 10% 4★ |

<mark>**Epic Eggs** are a NEW tier added beyond the source PDF. They are not Gold-purchasable — only granted from events, dailies, Tower milestones, and the Dupe Shop. This adds an aspirational tier without inflating the basic egg loop.</mark>

### 3.2 Hatchery

- Starts at 1 slot.
- Max 5 slots (additional unlocked via account level milestones — see `12-daily-weekly-loops.md`).
- Each slot has its own independent timer.
- An empty slot can accept any egg.

### 3.3 Hatch Process

1. Drag egg into open slot
2. Timer starts (per egg tier)
3. Notification when ready (per setting)
4. Player taps Hatch
5. Unit awarded → enters character storage

### 3.4 Instant Hatch

Spend Crystals to skip the timer. Cost scales with remaining time:

| Remaining time | Crystal cost |
|----------------|--------------|
| 0:00:00 | 0 (free claim) |
| 0:15:00 | 5 Crystals |
| 1:00:00 | 15 Crystals |
| 4:00:00 | 30 Crystals |
| 8:00:00 | 60 Crystals |
| 12:00:00 | 90 Crystals |

### 3.5 Egg Drop Pools (sample)

**Common Egg pool:**
- 70% Slime (1★)
- 10% Forest Sprite (1★)
- 10% Mushroomling (1★)
- 5% Tiny Wolf (1★)
- 5% Baby Drake (1★)

(Full tables for all 4 egg tiers live in the data table — `data/eggs.json`. The above is illustrative only.)

### 3.6 1★ / 2★ / 3★ Unit Roles

These low-rarity units are **never trash**. Uses:

- **Promotion fodder** — fuse 5 same-star → 1 next-star
- **Shrine workers** — equip 1-3 low-rarity units to the Shrine for +5-15% Gold/hr bonus (max 3 workers, stacks)
- **Expedition crew** — many Expedition missions accept low-rarity heroes
- **Achievement / Codex completion** — collecting all units rewards titles + gems

### 3.7 Unit Fusion Ladder

| Fuse | Cost | Result |
|------|------|--------|
| 5 × 1★ | 1,000 Gold | 1 × 2★ |
| 5 × 2★ | 5,000 Gold | 1 × 3★ |
| 5 × 3★ | 25,000 Gold | 1 × 4★ |
| 5 × 4★ | 100,000 Gold | 1 × 5★ |
| 5 × 5★ | 400,000 Gold + 1 Apex Catalyst | 1 × 6★ |

Note: 5★ → 6★ via fusion gives a generic "fodder 6★" (random class/element) — not a specific Legendary hero. Useful for the 5★→6★ promotion of named heroes (you need fodder 5★ to consume; this is how you make them).

### 3.8 Egg Acquisition Sources

| Source | Eggs |
|--------|------|
| Gold shop (always available) | Common, Uncommon, Rare (Gold cost) |
| Story stages | Common eggs, 1 per first-clear |
| Shrine milestones (every 5 levels) | Uncommon egg |
| Daily missions | 1-2 eggs depending on completion |
| Weekly missions | Rare egg per week tier |
| World Exploration (Expedition) | Random eggs |
| Achievements | One-time Rare or Epic egg rewards |
| Battle Pass tracks | 1 Epic egg in premium track per BP |
| Events (post-launch) | Limited eggs / event eggs |

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Instant-hatch cost | `ceil((remainingSeconds / 60) × 0.15) Crystals` (capped at 90 for 12h) |
| Shrine worker bonus | `Σ workerBonus = 5% × workerCount` (max 3 workers, max 15% bonus) |
| Fusion success rate | 100% (no failure for 1★–5★); 100% for 5★→6★ but Apex Catalyst required |

## 5. Edge Cases

- **All hatchery slots full + waiting eggs:** eggs queue in inventory; player must manually slot them.
- **Character storage full when hatching:** hatch blocks; UI prompts to expand or fuse first.
- **Fusion with mismatched rarities:** rejected.
- **Instant-hatch right after starting:** 0 seconds remaining = 0 Crystals (just claim).
- **Shrine workers locked from being consumed for fusion:** auto-flagged. Player must manually unlink to free them.

## 6. Dependencies

- `03-stats-and-progression.md` — star promotion uses fusion outputs as fodder
- `06-idle-and-shrine.md` — Shrine workers
- `08-inventory-and-storage.md` — egg/character storage slots
- `11-world-map-expedition.md` — Expedition reward eggs

## 7. Tuning Knobs

- Egg costs (3.1)
- Hatch times (3.1)
- Drop pool distributions (3.5)
- Fusion costs (3.7)
- Instant-hatch crystal formula (4)
- Shrine worker bonus magnitude (4)

## 8. Acceptance Criteria

1. ✅ Common Egg always hatches to a 1★ unit.
2. ✅ Rare Egg has a 5% chance to hatch a 3★ unit (testable over 1000 runs).
3. ✅ Instant-hatch correctly charges Crystals per the formula.
4. ✅ Fusion consumes exactly 5 same-rarity units + Gold cost.
5. ✅ <mark>Fusion of 5 × 5★ requires 1 Apex Catalyst.</mark>
6. ✅ Locked units (e.g., Shrine workers) cannot be auto-consumed in fusion.
