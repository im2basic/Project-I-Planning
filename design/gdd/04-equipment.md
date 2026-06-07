# GDD 04 — Equipment

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Each hero equips 7 items: Weapon, Helmet, Chest, Gloves, Boots, Accessory 1 (Ring), Accessory 2 (Necklace). Each piece has a **main stat** (fixed by slot + rarity) and <mark>2–3 random **sub-stats** rolled at drop. Pieces also belong to a **set**, with 2-piece and 4-piece bonuses if multiple set members are equipped together.</mark>

## 2. Player Fantasy

> *Finding a piece with the perfect sub-stats is its own reward — and committing to a Berserker set on my Assassin actually changes how she plays.*

## 3. Detailed Rules

### 3.1 Equipment Slots

| Slot | Main stat | Sub-stat eligibility |
|------|-----------|----------------------|
| Weapon | ATK% or flat ATK | ATK%, CritRate, CritDmg, Accuracy |
| Helmet | HP% or flat HP | HP%, DEF%, Accuracy, Speed |
| Chest | DEF% or flat DEF | DEF%, HP%, Accuracy, Speed |
| Gloves | CritRate%, CritDmg%, or ATK% | ATK%, CritRate, CritDmg, Speed |
| Boots | Speed (flat) or Speed% | Speed, HP%, DEF%, Accuracy |
| Ring (Accessory 1) | Any flat stat | Any sub-stat |
| Necklace (Accessory 2) | Any flat stat | Any sub-stat |

<mark>**Rationale:** restricting main-stats per slot prevents trivial double-dipping (e.g. you can't put ATK% on Boots — Boots are for Speed). Accessories are open-slot for flexibility.</mark>

### 3.2 Armor Types (by class)

| Armor type | Classes | Look/feel |
|-----------|---------|-----------|
| Heavy | Tank | Plate, full helms, large gauntlets |
| Light | Assassin, Archer | Leather, cloth-lined, agile silhouette |
| Magic | Mage, Support | Robes, ornamental helms, ceremonial garb |

Armor type is **purely cosmetic** at the system level — sub-stats can roll on any armor type. Heavy/Light/Magic is a visual identity bucket, not a mechanical gate. (Source PDF implied this; clarifying.)

### 3.3 Rarity Tiers

| Rarity | Main stat ceiling | Sub-stat count | Drop weight |
|--------|-------------------|----------------|-------------|
| Common | Low | 0–1 | Very common |
| Uncommon | Low-mid | 1–2 | Common |
| Rare | Mid | 2 | Common |
| Epic | High | 2–3 (3 unlocked at +12 enhance) | Uncommon |
| Legendary | Very High | 3 (all 3 at drop) | Rare |
| Mythic (endgame) | Highest | 3 + 1 *bonus* (max 4) | Very rare; Tower/Boss Rush only |

<mark>The "Cosmic" tier from TBH is **not** used. Project I tops out at Mythic, with most of the curve centered on Epic / Legendary.</mark>

### 3.4 Main Stat Ladder

Main stats grow with enhancement level (0 → +15). Sample table for a Legendary Weapon:

| Enhance | ATK% Main Stat |
|---------|----------------|
| +0 | 18% |
| +3 | 25% |
| +6 | 32% |
| +9 | 41% |
| +12 | 50% |
| +15 | 60% |

<mark>**Enhancement increments:** Every +3 enhances ("safe milestones") unlock a sub-stat. Main stat grows continuously per +1 enhance. Failure at any enhance level **does not destroy** the item — it consumes the upgrade material only. Items cannot be destroyed by enhancement.</mark>

### 3.5 Sub-Stat System (NEW)

<mark>

**Sub-stat pool** (rolls one per random slot):

| Sub-stat | Note |
|----------|------|
| ATK +% | additive to base ATK |
| HP +% | additive to base HP |
| DEF +% | additive to base DEF |
| Speed | flat additive |
| CritRate% | flat additive |
| CritDmg% | flat additive |
| Accuracy% | flat additive |
| Status Resistance% | flat additive (reduces incoming status duration / chance) |
| Lifesteal% | % of damage dealt returned as HP (caps at 25% per piece) |
| Effect Hit% | bonus to status apply roll (separate from Accuracy — designed for Mage builds) |
| Counter-Attack% | flat additive — chance to counter when hit by single-target attack |

**Roll mechanics:**
- Initial drop: 2 sub-stats on Rare/Epic, 3 on Legendary/Mythic.
- A 3rd sub-stat slot unlocks at +12 enhancement (so Epic effectively has 3 slots after enhancement).
- Each sub-stat **value** rolls within a range determined by rarity. Higher rarity = higher minimum / maximum.
- At each +3 enhance milestone, an existing sub-stat receives a random additive roll (within its tier range). The player can lock 1 sub-stat per enhance attempt (using a **Lock Stone** material) to prevent it from being chosen for the roll-up.
- Mythic items uniquely have a 4th sub-stat that is **fixed** (e.g. always Lifesteal). The fixed sub-stat is set by the boss / source that drops it.

**Sub-stat reroll:**
- The **Forge** screen offers a sub-stat reroll using **Reroll Stones** (rare currency from Tower / Boss Rush / dupe shop).
- A reroll completely re-randomizes ONE sub-stat slot (player picks which). It's destructive — the old value is gone.
- A "preview-then-confirm" UI shows the new roll before committing — but the new roll cannot be re-rolled cheaply. Each reroll attempt costs the same Stones.
- This makes endgame gear hunting about (a) farming the right item, (b) committing carefully to reroll which sub-stat, (c) accepting the variance.

</mark>

### 3.6 Equipment Sets (NEW)

<mark>

6 sets ship at launch. Each set has a 2-piece and 4-piece bonus.

| Set | 2-piece bonus | 4-piece bonus | Theme |
|-----|--------------|----------------|-------|
| **Berserker** | +15% ATK | +30% Counter-Attack chance, +20% CritDmg | Aggressive DPS |
| **Bastion** | +20% DEF | +25% Shield Strength, +15% Damage Reduction (clamped to DEF stat in formula) | Tank specialist |
| **Swiftwind** | +25% Speed | +1 Action Gauge per ally-Speed-Up trigger | Speed-stack teams |
| **Mystic** | +15% Accuracy | +25% Effect Hit, debuffs last +1 turn | Mage / debuff |
| **Vampire** | +12% Lifesteal | +30% Healing on Lifesteal procs, ignores 20% enemy DEF | Sustain DPS |
| **Lifegiver** | +20% Healing Done | +1 cleanse per turn for the wearer, allies under 50% HP heal +25% from this hero | Support specialist |

**Set requirements:**
- 2-piece = any 2 pieces of the same set
- 4-piece = any 4 pieces of the same set
- A hero can wear 2 different 2-piece sets (e.g. 2 Berserker + 2 Bastion = both 2-piece bonuses active) OR commit to a 4-piece + 2-piece split (e.g. 4 Berserker + 2 Bastion).
- The 4-piece bonus **replaces** the 2-piece bonus (it does not stack with it from the same set).

**Sets do NOT apply to Accessories.** Ring and Necklace are slot-agnostic and never count toward set count.

</mark>

### 3.7 Enhancement & Salvage (NEW)

<mark>

**Enhancement:**
- Each +1 enhance costs gold + an Enhance Stone (item) of matching rarity.
- Failure rate at +12+ enhances: 30% (item stays, materials consumed). Use Lucky Charms (premium item / event reward) to guarantee.
- No item is destroyed by enhancement.

**Salvage:**
- Sell any unwanted item for gold.
- "Salvage" instead refunds part of the upgrade materials + adds Enhance Stones.
- Bulk-salvage by rarity (Common / Uncommon / Rare all selectable in inventory).
- Locked or Favorited items cannot be salvaged.

**Salvage refund table:**

| Item rarity + enhancement | Refund |
|---------------------------|--------|
| Common +0 | 10 Gold |
| Rare +6 | 200 Gold, 1 Common Enhance Stone |
| Epic +12 | 1,500 Gold, 1 Rare Enhance Stone, 1 Reroll Stone |
| Legendary +15 | 8,000 Gold, 1 Epic Enhance Stone, 2 Reroll Stones |
| Mythic +15 | 50,000 Gold, 1 Legendary Enhance Stone, 5 Reroll Stones |

</mark>

### 3.8 Quick-Equip & Loadouts

<mark>

**Quick-Equip "Recommended" button** — in the Equipment menu, one tap auto-equips the highest-priority items per the hero's class weights (see GDD 02 § 3.4).

**Quick-Swap presets** — each hero stores up to 3 named equipment loadouts (e.g. "Boss Fight", "Idle Farm", "PvE Speed"). One-tap swap.

**Equipment Lock / Favorite** — both flags exist:
- **Locked** = cannot be sold/salvaged/fed into upgrades. Toggle in detail view.
- **Favorited** = sort-priority flag, does not block actions. Used for "show favorites first" filters.

**Bulk-select** — multi-select up to 100 items at once for bulk-sell or bulk-salvage. Confirm dialog shows total return.

</mark>

### 3.9 Equipped Item Display

The Equipment screen shows, for each slot:
- Item icon + rarity color border
- Main stat (highlighted)
- All sub-stats (current values, color-coded by tier)
- Enhancement level (0/+15)
- Set name + current set-count progress (e.g. "Berserker 2/4")
- Locked / favorited indicator

Tapping an equipped item opens a comparison view showing alternative items in inventory.

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Effective stat with gear | `BaseStat × (1 + Σ percentGearBonus) + Σ flatGearBonus` |
| Shield value when set bonus applies | `0.25 × wearer.maxHP × (1 + bastion4pcBonus)` |
| Counter-attack roll | `roll < (BaseCounterChance + Σ gearCounter)` |
| Lifesteal heal | `damageDealt × (Σ lifestealSubStat) × (1 + vampire4pcBonus)` |

## 5. Edge Cases

- **Same sub-stat rolled twice:** Treat as additive (e.g., two +5% ATK rolls = +10% effective).
- **All 3 sub-stat slots rolled into the same stat:** Possible. RNG. Diminishing returns are not enforced — the stack is real.
- **Reroll picks the same value:** Allowed. The reroll is destructive of the old value; if RNG produces the same number, the player just loses Stones for no gain.
- **4-piece set with mismatched main stats:** Allowed. Set bonuses care about set membership, not main stats.
- **Locked item attempts to be sold via bulk-select:** Excluded from the bulk operation, surfaced in the confirm dialog ("8 items selected, 1 locked — not selling").
- **Mythic item's fixed 4th sub-stat re-rolls?** No — the fixed slot cannot be rerolled. Only the 3 randomized slots can.

## 6. Dependencies

- `01-combat.md` — uses gear stats in damage formula
- `03-stats-and-progression.md` — defines core stat list and class weights
- `02-elements-and-classes.md` — class → armor type mapping
- `08-inventory-and-storage.md` — inventory slots and bulk actions
- `09-campaign-structure.md` — drop tables for gear by stage / boss
- `12-daily-weekly-loops.md` — Reroll Stones from weekly content

## 7. Tuning Knobs

- Sub-stat value ranges per rarity (3.5)
- Set bonus magnitudes (3.6)
- Enhancement failure rates at +12+ (3.7)
- Sub-stat pool (3.5) — can add new sub-stats post-launch
- Number of equipment sets — start with 6, add more in seasonal patches
- Reroll Stone cost per reroll (currently 1 per attempt)

## 8. Acceptance Criteria

1. ✅ Each equipped item shows its main stat + sub-stats with values.
2. ✅ <mark>Set 2-piece and 4-piece bonuses apply correctly when piece count is met.</mark>
3. ✅ <mark>Mythic items always have exactly 4 sub-stats; one is fixed per drop source.</mark>
4. ✅ <mark>Sub-stat reroll consumes 1 Reroll Stone and randomizes exactly one player-selected sub-stat.</mark>
5. ✅ <mark>Enhancement failure never destroys the item.</mark>
6. ✅ <mark>Bulk-salvage of 50 Common items returns the documented salvage value within 1% accuracy.</mark>
7. ✅ Quick-Equip respects class stat priorities from `02-elements-and-classes.md`.
8. ✅ Locked items cannot be salvaged via bulk-select.
