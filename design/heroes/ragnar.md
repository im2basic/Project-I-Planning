# Ragnar — The Flamehunter

| Field | Value |
|-------|-------|
| **Element** | 🔥 Fire |
| **Class** | 🏹 Archer |
| **Role** | AoE DPS / Burn Specialist |
| **Weapon** | Inferno Recurve Bow (volcanic-steel bow with phoenix-feather fletching) |
| **Rarity** | ★★★★★ |
| **Banner Pool** | 🆕 Future Limited Banner (post-launch release) |
| **Status** | Design draft — kit from source PDF, polish pass pending |

## Appearance

- Rugged hunter aesthetic with wild crimson hair
- Golden eyes glowing with phoenix-flame light
- Black and red leather armor, exposed shoulders + collarbone
- Burning phoenix-feather cloak that smolders
- Large infernal recurve bow forged from volcanic steel
- Color palette: red, orange, black, gold accents

## Stat Grades

| HP | ATK | DEF | SPD | CR | CD | ACC |
|----|-----|-----|-----|-----|----|-----|
| C | A | D | A | B | A | A |

## Passive — Kindling Arrow

Critical Hits apply **Burn** (2 turns).

This makes Ragnar a strong Burn spreader even without active skill use — every basic crit ticks the Burn count up.

## Basic Attack — Blazing Shot

- **Cooldown:** None
- Fires a flaming arrow.
- **Effects:** Single Target Damage; 10% chance to apply **Burn** independently (separate from crit-Burn).

## Skill 1 — Explosive Arrow

- **Cooldown:** 2 turns | **Multiplier:** 1.8× AoE
- Ragnar fires an arrow that explodes on impact.
- **Effects:** AoE Damage; applies **Burn** to all hit enemies.

## Skill 2 — Phoenix Volley

- **Cooldown:** 3 turns | **Multiplier:** 0.55× per hit × 5 hits = 2.75× total
- Rapid flaming arrows into the sky that rain down.
- **Effects:** Hits 5 random enemies (or same target); each hit can crit; each hit may apply Burn (40% chance per hit).

## Ultimate — Solar Flare Barrage

- **Cooldown:** 5 turns | **Multiplier:** 2.6× AoE
- Ragnar channels the power of the sun. A massive flaming arrow ascends, then explodes into a rain of fire.
- **Effects:**
  - Massive AoE Damage
  - **Burn All Enemies** (3 turns — longer than standard 2)
  - +20% bonus damage to already-Burned enemies (stacking)

## Character Identity

**Strengths:** Strong AoE damage; reliable Burn spreader; excellent wave clear; high crit damage; Wind-element bosses melt under his fire (off-element penalty for them).

**Weaknesses:** Fragile back-line; limited crowd control; needs protection from front-line.

## Chibi Animations

- **Idle:** bow resting on shoulder, small embers drifting around him
- **Attack:** quick draw → fire arrow launches rightward
- **Skill 1:** arrow glows → explosive shot fires → fire explosion erupts at target
- **Skill 2:** rapid firing stance → multiple flaming arrows rain down across enemy formation
- **Ultimate:** massive solar arrow forms → launches skyward → meteor-like firestorm crashes down
- **Death:** drops bow → falls to one knee → collapses

## Team Role

Second AoE option in the Fire roster. Where Emberia is sustained Burn-stacker, Ragnar is **immediate explosive burst**. Different feel; both viable.

## Recommended Partners

- **Valdrik** — Taunts pull aggro off the fragile Ragnar
- **Akari** — buffs his ATK; revives if he dies first
- **Emberia** — Burn synergy (chain explosions)
- **Kaida** — single-target finisher behind Ragnar's AoE

## Auto-AI Defaults

- **Skill 1:** Cast on cooldown when 2+ enemies alive
- **Skill 2:** Cast on cooldown (random multi-hit always useful)
- **Ultimate:** Cast on cooldown when 3+ enemies alive AND at least 1 is Burned

## Quote

*"Even the sun rises only to fall. And I am the fall."*

---

## Fire Roster Comparison

(Per canonical source:)

| Hero | Role | Specialty |
|------|------|-----------|
| Valdrik | Tank | Frontline protection + Burn application |
| Akari | Support | Buffs + Revival Flame |
| Emberia | Mage | AoE Burn stacker (Crimson Flame) |
| Kaida | Assassin | Single-target executioner |
| **Ragnar** | **Archer** | **AoE Burn DPS** |

## Fire Team Synergy Flow

The canonical Fire team loop with Ragnar:

```
Valdrik           → tanks pressure
   ↓
Akari             → buffs ATK/Speed; Revival Flame insurance
   ↓
Emberia           → spreads Burn across the board
   ↓
Ragnar            → detonates the entire battlefield
   ↓
Kaida             → finishes survivors with execute damage
```

Ragnar becomes the Fire faction's dedicated ranged AoE damage dealer — the first true AoE Archer in Project I.

---

**Status notes (design polish pending):**
- Skill 2 vs Lyria's Tempest Volley — similar mechanic, may need differentiation
- Confirm Burn-on-crit triggers per-hit or once per attack roll
- Cloak VFX cost may be high — placeholder
