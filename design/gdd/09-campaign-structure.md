# GDD 09 — Campaign Structure

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

<mark>The campaign is the spine of all PvE progression. It defines the world ("acts" of the journey), the stages where idle farming happens, the bosses that gate progress, and the difficulty tiers that extend the campaign's lifespan.</mark>

## 2. Player Fantasy

> *Each chapter introduces a new theme, a new enemy archetype, a stronger boss — and four difficulty tiers means once I've cleared it, there's a Hard/Nightmare/Hell version waiting.*

## 3. Detailed Rules

### 3.1 Structure

<mark>

| Layer | Count | Purpose |
|-------|-------|---------|
| Acts | 3 (launch) | Major narrative beats; thematic biome change |
| Chapters | 4 per Act = 12 launch | Sub-region; each ends in a chapter boss |
| Stages | 10 per Chapter = 120 stages | Wave-based combat encounters |
| Difficulty tiers | 4 (Normal / Hard / Nightmare / Hell) | Apply across the whole campaign |

Total stage permutations: 120 stages × 4 difficulties = **480 distinct stage instances**.

</mark>

### 3.2 Acts (high-level themes)

<mark>

| Act | Theme | Element Bias | Boss archetype |
|-----|-------|--------------|----------------|
| Act 1 — Awakening | Forests, hillside ruins, early adventure | Wind dominant; mixed | Forest guardian, beast lord, fallen knight, wind drake |
| Act 2 — Ashes & Embers | Volcanic ranges, burning ruins | Fire dominant | Magma elemental, ember tyrant, phoenix scion, crimson dragon |
| Act 3 — Tides & Frost | Sea coast, ice mountains | Water dominant | Tidal beast, frost giant, abyssal kraken, leviathan |

This element bias guarantees players need at least 2 elements to progress comfortably — preventing mono-element teams from steamrolling the whole game.

</mark>

### 3.3 Stage Format

Each stage is a sequence of waves:

| Stage type | Waves | Boss? |
|-----------|-------|-------|
| Standard stage (1-9) | 3 waves of 1-5 enemies | No (chapter-mid boss optional on stages 5, 7) |
| Chapter boss stage (10) | 2 trash waves + 1 boss wave | Yes |

### 3.4 Difficulty Tiers

<mark>

| Difficulty | Enemy HP/ATK | Element Penalty | Gold Reward | First-clear Bonus | Drop Quality |
|-----------|--------------|------------------|--------------|-------------------|--------------|
| Normal | 1.0× | -25% | 1.0× | Standard | Common→Rare |
| Hard | 1.5× | -25% | 1.3× | +Skill Stones x20 | Common→Epic |
| Nightmare | 2.5× | -40% | 1.7× | +Sacred Crystal x5 + Pristine Element Crystal | Common→Legendary |
| Hell | 4.0× | -50% | 2.5× | +Apex Catalyst (1, ONCE per chapter) + Cosmetic | Rare→Mythic (Mythic only from chapter bosses) |

**Difficulty unlock gates:**
- Hard: clear chapter 6 on Normal
- Nightmare: clear chapter 9 on Hard
- Hell: clear chapter 12 on Nightmare

</mark>

### 3.5 First-clear vs. Repeat-clear Rewards

<mark>

**First-clear** rewards (per stage, per difficulty):
- Standard: Gems (10-100 depending on stage depth), 1 Common/Uncommon egg, 1 piece of gear at stage tier
- Bonus 3-star rewards (see 3.6)
- First time clearing a chapter boss also grants 50-500 Gems + difficulty-tier specific bonuses (see 3.4)

**Repeat-clear** rewards:
- Standard gold table for the stage
- Standard drop table (gear)
- Sometimes EXP Crystals, materials
- NO Gems, NO eggs, NO milestone rewards

This sharp distinction prevents players from feeling like they need to grind early stages forever.

</mark>

### 3.6 3-Star Rating System (NEW)

<mark>

Each stage clear is rated 0-3 stars based on three independent conditions:

1. **Clear the stage** (★1)
2. **All heroes survived** (no KO during stage) (★2)
3. **Cleared in under N turns** (varies by stage; typically 8-15 turns) (★3)

A 3-star clear awards bonus rewards. 3-starring all stages in a chapter awards a chapter completion bonus (10 Gems, 1 piece of Sacred Stone, profile badge).

**Recorded as best-ever**: the player can't "lose" stars by re-running. Best is always shown. UI marker on the stage select map.

3-star clears do not need to happen on the same difficulty — 3-starring a Nightmare run satisfies the chapter completion bonus for ALL difficulties of that stage (gracefully).

</mark>

### 3.7 Boss Design

<mark>

Each chapter boss has:
- ~5-10× HP of a standard enemy
- 2-4 unique skills (vs. a normal enemy's 1-2)
- A signature mechanic (e.g. Chapter 3 boss "Wind Drake" applies AoE Speed Down every 4 turns; Chapter 7 boss "Phoenix Scion" revives once at 50% HP)
- An **enrage timer** (see `01-combat.md` § 3.11)
- An **element match** (sometimes resistant to certain elements)
- **Scout-eligible** (see `01-combat.md` § 3.16)

Drops:
- Difficulty-tier specific gear (Mythic drops only from Hell-mode chapter bosses)
- Promotion materials (Sacred Stones, Element Crystals at appropriate difficulty)
- First-clear Gems + eggs

</mark>

### 3.8 Mid-week Event Stage (NEW)

<mark>

Every Wednesday, one of the campaign chapters becomes the "Featured Chapter of the Week" with:
- +50% Gold drop
- +25% gear drop chance
- 2× Skill Stone drops in that chapter
- A rotating mini-quest ("Clear 5 stages in featured chapter") with Gem reward

The featured chapter cycles deterministically (week 1 = chapter 1, week 2 = chapter 2, ...). This re-engages players with old content and keeps farming targets fresh.

</mark>

### 3.9 Drop Table Discipline

Each stage has an explicit drop table (data-driven). Tables follow consistent principles:
- Higher stage = higher chance of higher-rarity drops
- Boss stages drop the "set-specific" items (e.g., chapter 5 boss only drops Berserker set on Hard+)
- No stage drops every set — players must visit specific stages for specific sets

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Enemy HP at stage S, difficulty D | `BaseHP[S] × DifficultyMultiplier[D]` |
| Enemy ATK at stage S, difficulty D | `BaseATK[S] × DifficultyMultiplier[D]` |
| Repeat-clear gold | `BaseGold[S] × DifficultyMultiplier[D].goldBonus × idleClearRate[S]` |
| 3-star turn budget | `8 + floor(S / 20) + 1 × difficultyTierIndex` |
| Featured chapter cycle index | `((weekNumberSinceLaunch) % 12) + 1` |

## 5. Edge Cases

- **First-clear bonus already claimed:** subsequent runs reward only the repeat-clear table.
- **3-star turn budget edge:** turn N exactly = qualifies (use `<=`).
- **Hero death late in the stage:** ★2 is lost forever for that run. To re-earn, must clear without any KO.
- **Featured chapter overlap with player's current chapter:** no special rule — bonus stacks.
- **Skipping difficulty tiers:** not allowed. Hard unlocks only after Chapter 6 Normal clear.

## 6. Dependencies

- `01-combat.md` — uses difficulty modifiers in damage/HP/Speed
- `02-elements-and-classes.md` — element bias per Act
- `03-stats-and-progression.md` — Element Crystals, Sacred Stones drop sources
- `04-equipment.md` — gear drop tables, set distribution
- `06-idle-and-shrine.md` — idle stage selection includes campaign stages
- `13-battle-pass.md` — chapter-completion missions feed BP

## 7. Tuning Knobs

- Difficulty multipliers (3.4)
- First-clear vs repeat rewards (3.5)
- 3-star turn budgets (4)
- Featured chapter rotation period
- Boss enrage thresholds (inherited from `01-combat.md`)
- Drop table per stage (data-driven, hot-config)

## 8. Acceptance Criteria

1. ✅ <mark>120 stages × 4 difficulties = 480 distinct stage instances are defined.</mark>
2. ✅ <mark>Difficulty unlock gates work (Hard requires Ch.6 Normal clear, etc.).</mark>
3. ✅ <mark>3-star rating per stage is recorded and never decreases.</mark>
4. ✅ <mark>First-clear rewards are granted exactly once; repeat-clear table works on subsequent runs.</mark>
5. ✅ Chapter boss enrage applies per `01-combat.md` § 3.11.
6. ✅ <mark>Featured chapter rotates weekly, deterministic from launch week.</mark>
7. ✅ Mythic drops are restricted to Hell-mode chapter bosses.
8. ✅ Element bias per act matches the documented theme.
