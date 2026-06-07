# GDD 02 — Elements & Classes

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Project I uses a **3-element triangle** (🔥 Fire / 💧 Water / 🌪 Wind) and **5 classes** (Tank / Assassin / Archer / Mage / Support). Every hero is exactly one element and one class. <mark>**Launch 5★ roster = 15 heroes** — exactly one hero per element × class. Plus 15 4★ heroes (designs TBD).</mark>

## 2. Player Fantasy

> *I'm building a team where each hero counters something specific. Bringing the wrong element punishes me; bringing the right one feels devastating. Mixing classes is how I balance survivability and damage.*

## 3. Detailed Rules

### 3.1 Element Triangle

| Element | Strong vs. | Weak vs. | Visual identity |
|---------|-----------|----------|-----------------|
| 🔥 Fire | 🌪 Wind | 💧 Water | Red/orange palette; ember particles; phoenix imagery |
| 💧 Water | 🔥 Fire | 🌪 Wind | Blue/teal palette; wave/bubble particles; ice-themed for some heroes |
| 🌪 Wind | 💧 Water | 🔥 Fire | Green/white palette; leaf/wind-line particles; eastern shrine-maiden imagery |

<mark>**Ice = Water decision (D-02):** Glacier (Frostwarden) and Auron (Frostbound Prodigy) are visually ice/frost themed but element-tagged as Water. Their status effects (Frostbite, Freeze) are Water-element effects mechanically. This is a *visual identity* difference, not a separate element.</mark>

### 3.2 Element Bonus / Penalty

See `01-combat.md` § 3.6 for the formula. Quick reference:

| Difficulty | Bonus (advantage) | Penalty (disadvantage) |
|------------|-------------------|------------------------|
| Normal | +25% | -25% |
| Hard | +25% | -25% |
| Nightmare | +30% | -40% |
| Hell | +35% | -50% |

<mark>Elemental discipline scales with difficulty: Hell mode punishes bringing the wrong element more than Normal does.</mark>

### 3.3 Class System

| Class | Role | Primary Stats | Armor | Default Weapon Archetype |
|-------|------|---------------|-------|---------------------------|
| Tank | Frontline protector, taunter, shielder | HP, DEF, Accuracy | Heavy | Shield-based (sword+shield, gunlance, etc.) |
| Assassin | Burst single-target DPS, executioner | ATK, Speed, CritRate, CritDmg | Light | Dual blades, scythes, sickles |
| Archer | Sustained ranged DPS | ATK, Accuracy, CritDmg, Speed | Light | Bows, crossbows, bracers |
| Mage | AoE damage, debuff, control | ATK, Accuracy, Speed | Magic | Staves, grimoires, fans |
| Support | Heal, buff, cleanse, revive | Accuracy, Speed, HP | Magic | Staves, harps, lanterns |

<mark>**Weapon archetype clarification (F-04):** The class spec defines a *family* of weapons, not a strict requirement. Glacier's Gunlance is a Tank weapon. Marina's Harp is a Support weapon. Auron's Bracer is an Archer-class projectile weapon. Each hero's weapon must visually communicate the class identity (e.g., Tank weapons feel large/heavy, Assassin weapons feel agile/dual-wielded) but exact form factor is per-character.</mark>

### 3.4 Stat Grades per Class

(S = Exceptional, A = High, B = Above Average, C = Average, D = Below Average)

| Class | HP | ATK | DEF | SPD | CR | CD | ACC |
|-------|----|----|----|----|----|----|-----|
| Tank | S | D | S | D | D | D | B |
| Assassin | C | S | D | S | S | S | B |
| Archer | C | A | D | A | B | A | S |
| Mage | C | S | D | B | D | D | A |
| Support | B | D | B | A | D | D | S |

These are **class averages** — individual heroes may deviate (e.g., a particular Archer may have S CritRate). Used for balancing and gear recommendation logic only.

### 3.5 Launch Roster Map (FINAL)

<mark>

**Launch roster — 15 5★ heroes total:**

| Element | Tank | Assassin | Archer | Mage | Support |
|---------|------|----------|--------|------|---------|
| 🔥 Fire | Valdrik ✅ | Kaida ✅ | Ragnar 🆕 | Emberia ✅ | Akari 🆕 |
| 💧 Water | Glacier ✅ | Seraphina 🆕 | Auron 🚀 | Neria ✅ | Marina ✅ |
| 🌪 Wind | Mei Lin 🆕 | Kael ✅ | Lyria ✅ | Ayame 🆕 | Sylphie ✅ |

✅ Standard banner pool (9 heroes, available at launch) — Valdrik, Emberia, Kaida, Glacier, Marina, Neria, Sylphie, Lyria, Kael
🚀 Launch Limited Banner (1 hero, available at launch) — Auron
🆕 Future Limited Banners (5 heroes, released post-launch over time) — Ragnar, Akari, Seraphina, Mei Lin, Ayame

**Banner-pool allocation summary:**

| Pool | Count | Heroes |
|------|-------|--------|
| Standard | 9 | Valdrik, Emberia, Kaida, Glacier, Marina, Neria, Sylphie, Lyria, Kael |
| Limited (launch) | 1 | Auron |
| Limited (future, ~1 per banner cycle) | 5 | Akari, Ragnar, Seraphina, Mei Lin, Ayame |

F2P players via the 210-pull Standard Selector have 9 heroes available, and the Wishlist system targets those 9. Limited heroes are time-windowed treats; Standard pool may absorb older Limited heroes after their second rerun ends (TBD post-launch).

**4★ roster:** 15 heroes planned. Designs are forthcoming (user is producing separately). 4★ heroes drop from Epic gacha tier, from Hatchery (rare egg tier), and from event rewards. 4★ → 5★ promotion requires fodder + Apex Catalyst per `gdd/03-stats-and-progression.md`.

</mark>

## 4. Formulas

Element math: see `01-combat.md` § 3.5–3.6.

Class stat priorities feed into auto-equip and recommended-team logic:

```
prioritize(hero, gear) = sum(gear.subStat[i].value × classWeight[hero.class][gear.subStat[i].type])
```

`classWeight[class][stat]` is a table. Example for Assassin:

| Stat | Weight |
|------|--------|
| ATK | 1.0 |
| CritRate | 1.0 |
| CritDmg | 0.9 |
| Speed | 0.8 |
| Accuracy | 0.5 |
| HP | 0.2 |
| DEF | 0.1 |

## 5. Edge Cases

- **Neutral-element enemy:** no bonus / no penalty either way. Used for "void" bosses, story-locked enemies, certain Tower of Trials floors.
- **Element disadvantage on a Support hero:** healing skills are *not* element-modified — Marina heals at full strength even against Wind enemies. Only damage skills feel the element math.
- **Class identity vs. weapon form:** a Mage carrying a "Tome" weapon vs. an "Astral Grimoire" — mechanically identical. Different visual identity only.

## 6. Dependencies

- `01-combat.md` — uses element multipliers, class stat priorities
- `03-stats-and-progression.md` — defines the 7 core stats
- `04-equipment.md` — Heavy / Light / Magic armor types per class
- `design/heroes/*.md` — each hero's element + class assignment

## 7. Tuning Knobs

- Element advantage/penalty per difficulty (3.2)
- Class stat-grade matrix (3.4)
- Class weight table (formula in 4)

## 8. Acceptance Criteria

1. ✅ Each of the 15 5★ launch heroes is exactly one element ∈ {Fire, Water, Wind} and one class ∈ {Tank, Assassin, Archer, Mage, Support}.
2. ✅ Element triangle math matches `01-combat.md`.
3. ✅ <mark>Class stat-grade matrix is referenced by the auto-equip logic.</mark>
4. ✅ <mark>Standard banner pool contains ≥ 10 heroes (so F2P has meaningful Standard pulls).</mark>
5. ✅ <mark>The "Standard Selector" guaranteed pick (after 210 Standard pulls) chooses from the Standard-pool heroes only.</mark>
