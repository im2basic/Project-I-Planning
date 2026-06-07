# GDD 03 — Stats & Progression

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

A hero's combat power comes from four independent progression axes:

1. **Level** (1 → 60) — raw stat growth from EXP materials.
2. **Star Promotion** (1★ → 6★) — major power tier; consumes fodder.
3. **Awakening** (0 → 6) — duplicate-driven; new passives unlock at certain awakenings.
4. **Equipment** — see `04-equipment.md`.

<mark>Plus a fifth axis added here: **Skill Level** (1 → 10 per skill) — incrementally upgrade Skill 1 / Skill 2 / Ultimate with skill stones farmed from stages.</mark>

## 2. Player Fantasy

> *Every system I touch makes my favorite hero a little stronger. There's always a next milestone — a star, an awakening, a skill rank, a piece of gear.*

## 3. Detailed Rules

### 3.1 Core Stats (canonical, 7)

| Stat | Symbol | Purpose | Cap |
|------|--------|---------|-----|
| HP | HP | Max health | None (display-only ceiling at 999,999) |
| ATK | ATK | Outgoing damage scaler | None |
| DEF | DEF | Damage mitigation (see formula in `01-combat.md` § 3.5) | None |
| Speed | SPD | Action gauge fill rate | None (effective ceiling ~300 in practice) |
| Crit Rate | CR | Critical hit % | 100% |
| Crit Damage | CD | Critical damage multiplier % | None (effective ceiling ~400% in practice) |
| Accuracy | ACC | Hit & status apply chance | 200% (overflow grants special effects on certain heroes) |

<mark>**No secondary stats** like Magic Power, Healing Power, Damage Reduction, Shield Strength, Energy Generation, or Cooldown Reduction. Those source-PDF references are deprecated:
- "Magic Power" / "Healing Power" → folded into ATK (with healing-multiplier defined per-skill).
- "Damage Reduction" → folded into DEF (the DefMit formula handles it).
- "Shield Strength" → derived from caster's max HP at cast time.
- "Energy Generation" → deleted; no Energy system exists (cooldowns are turn-based).
- "Cooldown Reduction" → deleted; cooldowns are integer turns only.

This decision is pending user confirmation (F-05, F-06, F-07).</mark>

### 3.2 Hero Level System

- **Max Level:** 60
- **Stats per level:** small additive growth to **HP / ATK / DEF only**.
<!-- RESOLVED 2026-06-06 (design call by dev): Speed/CR/CD/ACC do NOT grow with level. Only HP/ATK/DEF scale (per §4 formulas). Rationale: matches the genre standard (Epic Seven), keeps base Speed a fixed, gear/buff-driven value so the action-gauge turn system stays strategic, and prevents Speed inflation that would let high-level teams outrun all content trivially. Speed/CritRate/CritDmg/Accuracy come from base stat + gear + buffs only. Implemented in ProjectI.Core ProgressionMath. Re-tunable after playtesting. -->
- **Speed / CritRate / CritDmg / Accuracy:** fixed at the hero's base value (modified only by gear and in-combat buffs), NOT by level.
- **No skill unlocks tied to level** (skill unlock is part of Awakening — see 3.4)

**Gold + EXP cost curve:**

| Level Range | Gold per level | EXP per level (cumulative for the range) |
|-------------|----------------|-------------------------------------------|
| 1–20 | 500 | ~50k total |
| 21–40 | 2,000 | ~200k total |
| 41–50 | 5,000 | ~500k total |
| 51–60 | 10,000 | ~1,000k total |

**Approx total per hero (1→60):** ~200,000 Gold + ~1.7M EXP.

**EXP Materials:**

| Material | EXP |
|----------|-----|
| Small EXP Crystal | 100 |
| Medium EXP Crystal | 500 |
| Large EXP Crystal | 2,500 |
| Legendary EXP Crystal | 10,000 |

Sources: campaign stages, Shrine rewards, daily missions, events.

### 3.3 Star Promotion

Major power tier. Available at level milestones; consumes 5 fodder units of the previous star.

| Promotion | Level required | Fodder | Gold cost |
|-----------|----------------|--------|-----------|
| 1★ → 2★ | 20 | 5 × 1★ | 5,000 |
| 2★ → 3★ | 30 | 5 × 2★ | 15,000 |
| 3★ → 4★ | 40 | 5 × 3★ | 50,000 |
| 4★ → 5★ | 50 | 5 × 4★ | 150,000 |
| 5★ → 6★ | 60 | 5 × 5★ | 500,000 |

<mark>**Promotion materials** (in addition to fodder + gold):
- 2★→3★: 10 × Sacred Dust (egg / story drop)
- 3★→4★: 20 × Sacred Fragment (chapter completion + Tower 10-floor reward)
- 4★→5★: 30 × Sacred Crystal (chapter boss drop, Hard+, Tower 20-floor reward)
- 5★→6★: 50 × Radiant Soulstone (Tower 50-floor reward, Boss Rush weekly milestone)
- Also required for 6★: **1 × Apex Catalyst** per element (Fire/Water/Wind) — <mark>**genuinely rare.** F2P realistic supply: ~1 every 1-2 months. Premium-BP buyers: ~1-2 per month. See § 3.7 Apex Catalyst Supply below for exact sources.</mark>

This makes 6★ a long-term aspiration even for daily players.</mark>

<mark>**Important rule (from source PDF, kept):** 5★ summoned heroes START at 5★ Level 1 — they do **not** start at 1★. But they still consume 4★ fodder to promote to 5★… wait, they're already 5★. Let me re-read the source. The PDF says "5★ units start at 5★ but still require fodder from lower rarities for promotion." So summoned 5★ heroes are at 5★ Level 1, and progress only via Level (1→60), Awakening, gear, and skills — they cannot go below 5★. To promote any 5★ to 6★, the player consumes 5 × 5★ fodder + the materials above. The 5★ fodder can be either: (a) duplicate 5★ heroes (consumed instead of becoming Awakening copies), or (b) sacrificial 5★ fodder units obtained from special events / shop. This keeps 6★ as the rarest, most aspirational tier.</mark>

### 3.4 Awakening (Duplicate System)

Each hero supports 6 Awakening levels (Awakening 0 = base unlock).

| Awakening Level | Total Copies | Effect |
|-----------------|--------------|--------|
| 0 | 1 | Unlock hero |
| 1 | 2 | +5% all stats, +1 ATK skill cap |
| 2 | 3 | Skill 1 +1 level cap, +5% all stats |
| 3 | 4 | Skill 2 +1 level cap, +5% all stats |
| 4 | 5 | Ultimate +1 level cap, +5% all stats |
| 5 | 6 | <mark>**Unique passive boost** per hero (e.g. Lyria's Focus cap raises from 5 → 7 stacks)</mark> |
| 6 (max) | 7 | <mark>**Awakened Form** — unique visual aura + unlocks Awakening exclusive skill bonus per hero. Capstone reward.</mark> |

**Beyond 6:** additional duplicate copies convert to **Hero Essence**. Hero Essence is used in:
- The **Dupe Shop** (currently called "Essence Shop") — buy promotion materials, EXP crystals, gold, and select-a-hero fragments.
- **Hero Shard exchanges** — see `gdd/05-gacha-and-currencies.md`.

<mark>**Hero Essence rate:** 7th copy = 100 Essence; 8th = 110; 9th = 121; (10% growth per copy, capped at 200 per copy beyond the 16th).</mark>

### 3.5 Skill Level (NEW)

<mark>

Each of a hero's three skills (Skill 1, Skill 2, Ultimate) can be leveled 1–10 independently. Higher skill levels increase damage / heal / buff magnitude — but do **not** alter cooldowns.

**Effect per skill rank** (additive to base):

| Rank | Effect |
|------|--------|
| 1 | Base (default for newly unlocked hero) |
| 2–5 | +3% effect magnitude per rank (i.e., rank 5 = +12% over base) |
| 6 | +5% effect (rank 6 = +17% total) |
| 7 | +5% (22%) |
| 8 | +7% (29%) |
| 9 | +8% (37%) |
| 10 | +13% (50% over base) |

**Skill rank cost:**

| Rank | Skill Stones | Gold |
|------|--------------|------|
| 2 | 5 | 1,000 |
| 3 | 10 | 3,000 |
| 4 | 20 | 8,000 |
| 5 | 35 | 20,000 |
| 6 | 60 | 50,000 |
| 7 | 90 | 100,000 |
| 8 | 130 | 200,000 |
| 9 | 180 | 400,000 |
| 10 | 250 | 800,000 |

**Skill rank cap by Awakening (Section 3.4):**

| Skill | Default cap | Cap raised by |
|-------|-------------|---------------|
| Skill 1 | 5 | Awakening 2 → 7, Awakening 4 → 9, Awakening 6 → 10 |
| Skill 2 | 5 | Awakening 3 → 7, Awakening 5 → 9, Awakening 6 → 10 |
| Ultimate | 5 | Awakening 4 → 7, Awakening 5 → 9, Awakening 6 → 10 |

**Skill Stones** — sources:
- Campaign repeat-clear (Hard+) — small drop chance per stage clear
- Daily Mission "Skill Stones x10" reward
- Tower of Trials floor milestones
- Hero Trials weekly reward
- Dupe Shop purchasable
- Hero Essence convertable (50 Essence → 10 Stones)

</mark>

### 3.6 Element Crystals

<mark>

The source PDF references "Wind Crystals" as an example inventory item. Defining the full system:

**Element Crystals** are tier-3+ ascension materials per element. Used as Promotion Materials for star promotions of heroes of the matching element.

| Tier | Drop source |
|------|-------------|
| Lesser Element Crystal | Stage repeat-clear, matching-element chapter |
| Greater Element Crystal | Chapter boss drop, Hard+ matching-element chapter |
| Pristine Element Crystal | Tower of Trials, Hero Trial weekly, matching-element boss |
| Apex Catalyst | Cross-element (used for 6★ promotion regardless of source element) |

Tier upgrade: 10 Lesser → 1 Greater → 10 Greater → 1 Pristine.

Element Crystals are bound to their element — Fire Crystals cannot promote a Water hero. Apex Catalysts are universal but extremely rare.

</mark>

<mark>

### 3.7 Apex Catalyst Supply (tightened)

Apex Catalyst is the gate item for 5★ → 6★ promotion. Total supply is intentionally tight so 6★ promotion is a long-term aspirational goal.

| Source | Frequency | F2P? | Premium-BP? |
|--------|-----------|------|--------------|
| Tower of Trials floor 70 milestone | 1 per Tower monthly reset | ✅ | ✅ |
| Boss Rush — full clear on **Nightmare** | 1 per **monthly first-clear** (NOT weekly) | ✅ (if you can clear) | ✅ |
| Dupe Shop | 1 per month, **100,000 Hero Essence** (doubled from earlier draft) | ✅ if accumulated | ✅ |
| BP Premium Tier 25 reward | 1 per season (60 days) | ❌ | ✅ |
| Limited Banner "Power Bundle" $29.99 | 1 per bundle purchase | ❌ | Paid |

**Estimated realistic monthly supply:**

- **Hardcore F2P** clearing Tower 70 + Boss Rush Nightmare + dumping Essence into Dupe Shop = **3 Apex/month**
- **Casual F2P** clearing only Tower 70 = **1 Apex/month**
- **Average F2P** (Tower 70 + Boss Rush Hard-only) = **1-2 Apex/month**
- **Premium-BP buyer** = **+0.5 Apex/month** from BP
- **Limited Banner big-spender** = +1 Apex per banner cycle from Power Bundle

This means 6★ promotions happen ~once every 1-2 months for committed players, ~once a season for casual players. That preserves 6★ as a real aspiration over a year of play.

### 3.8 Sacred Stones (Shrine Material)</mark>

<mark>

Source-PDF referenced "Sacred Stones" for Shrine upgrades. Tier ladder:

| Tier | Used for | Source |
|------|----------|--------|
| Sacred Pebble | Shrine 1→10 | Stage clear (any) |
| Sacred Stone | Shrine 11→20 | Chapter boss (Hard+) |
| Sacred Crystal | Shrine 21→30 (planned post-launch expansion) | Weekly Boss Rush, Tower 50-floor reward |
| Sacred Relic | Shrine 31+ (post-launch) | Limited event reward only |

</mark>

### 3.9 Progression Loop Summary

```
Pull a hero → start at 5★ L1 (if 5★) or 1-3★ L1 (if egg/fusion)
   ↓
Level up via EXP Crystals + Gold
   ↓
Promote (if not 5★+) by consuming fodder + Promotion Material
   ↓
Awaken via duplicates → unlocks higher skill rank caps
   ↓
Level skills via Skill Stones
   ↓
Equip Sub-Stat / Set-Bonus gear (see 04-equipment.md)
   ↓
Repeat for new heroes; chase 6★ for favorites
```

## 4. Formulas

| Concept | Formula |
|---------|---------|
| HP at level L | `BaseHP × (1 + 0.04 × (L-1))` |
| ATK at level L | `BaseATK × (1 + 0.035 × (L-1))` |
| DEF at level L | `BaseDEF × (1 + 0.04 × (L-1))` |
| Skill magnitude at rank R | `BaseEffect × SkillRankMultiplier[R]` (see 3.5 table) |
| Hero Essence from 7+ duplicate | `100 × 1.1^(copy - 7)`, capped at 200 |
| Stat multiplier from Awakening | `1 + 0.05 × awakeningLevel` (cap at +30% at Awakening 6) |
| Star promotion stat boost | Variable per star — see GDD 04 for gear sub-stat scaling |

## 5. Edge Cases

- **Hero with 0 dupes** — cannot Awaken at all. Stuck at Awakening 0 until dupe arrives or Hero Shards traded for 1 copy.
- **Hero at 6★ Awakening 6 with Skill Rank 10 on all skills** — fully maxed. Future copies all convert to Essence.
- **Skill rank exceeds the current Awakening cap** — system rejects the upgrade attempt with a clear error.
- **Element Crystal mismatch** — promoting a Fire hero with Wind Crystals is rejected at the confirm step.
- **Apex Catalyst shortage** — block 6★ promotion until catalyst is available; the player can hold all other materials ready.

## 6. Dependencies

- `01-combat.md` — uses stat values
- `02-elements-and-classes.md` — element + class assignments per hero
- `04-equipment.md` — sub-stats add to core stats
- `05-gacha-and-currencies.md` — Hero Essence, Dupe Shop
- `06-idle-and-shrine.md` — Sacred Stones source
- `09-campaign-structure.md` — Element / Skill Stone drop tables

## 7. Tuning Knobs

- Level growth coefficients (3.5%, 4%)
- Skill rank cost curve (3.5)
- Awakening stat boost (5% per rank, cap 30%)
- Promotion fodder counts (currently 5 per tier)
- Promotion material counts (10/20/30/50)
- Hero Essence conversion rate (3.4)
- Element Crystal tier ratios (10:1)

## 8. Acceptance Criteria

1. ✅ A hero promoted from 4★→5★ at level 50 retains their level (does not reset).
2. ✅ <mark>Skill rank 10 cannot be reached without Awakening 6 on the affected skill.</mark>
3. ✅ <mark>A duplicate received past Awakening 6 deterministically converts to Hero Essence at the documented rate.</mark>
4. ✅ <mark>Promotion fails cleanly with a user-facing error if Apex Catalyst is missing.</mark>
5. ✅ Total gold cost from L1 to L60 is approximately 200k (within ±5%).
6. ✅ <mark>Skill Stones are obtainable through at least 4 distinct content paths (campaign, dailies, Tower, Dupe Shop).</mark>
