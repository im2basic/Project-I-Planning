# Seraphina — The Abyssal Reaper

| Field | Value |
|-------|-------|
| **Element** | 💧 Water |
| **Class** | 🗡 Assassin |
| **Role** | Burst DPS / Executioner |
| **Weapon** | Tidal Scythe (large crescent water-blade scythe) |
| **Rarity** | ★★★★★ |
| **Banner Pool** | 🆕 Future Limited Banner (post-launch release) |
| **Status** | Design draft — kit from source PDF, polish pass pending |

## Appearance

- Elegant assassin with long silver-blue hair flowing
- Ocean-blue eyes with a faint serpentine glow
- Light armored dress in white and teal with flowing water ribbons
- Massive crescent-shaped Tidal Scythe — water-blade form
- Bare midriff, subtle scaling armor accents
- Color palette: deep blue, white, silver, teal

## Stat Grades

| HP | ATK | DEF | SPD | CR | CD | ACC |
|----|-----|-----|-----|-----|----|-----|
| D | S | D | A | A | S | B |

## Passive — Death Tide

Whenever Seraphina lands a Critical Hit, gain 1 **Tide** stack (max 5).

Each stack grants:
- +5% Critical Damage

(Note: this is Seraphina's "Tide" stack — separate from Neria's "Tide" stacks. Each hero's stacks are isolated.)

## Basic Attack — Tidal Reap

- **Cooldown:** None
- Swift scythe slash.
- **Effects:** Single Target Damage.

## Skill 1 — Undertow Slash

- **Cooldown:** 2 turns | **Multiplier:** 1.5× single-target
- Wave surges beneath target as Seraphina swings her scythe.
- **Effects:** High Single Target Damage; applies **Slow** (2 turns).

## Skill 2 — Whirlpool Reaping

- **Cooldown:** 3 turns | **Multiplier:** 0.55× per hit × 4 hits = 2.2× total
- Spins her scythe, creating a violent whirlpool around target.
- **Effects:** Hits 4 times on selected target; each hit can crit; +30% bonus damage against Slowed enemies.

## Ultimate — Leviathan's Judgment

- **Cooldown:** 5 turns | **Multiplier:** 3.5× single-target + execute bonus
- A gigantic spectral sea serpent appears behind Seraphina as she performs a devastating execution strike.
- **Effects:**
  - Massive Single Target Damage
  - **Guaranteed Critical Hit**
  - +50% bonus damage based on target's missing HP%
  - **If target is below 30% HP:** deal additional execute damage (+2.0× multiplier extra)

## Character Identity

**Strengths:** Extremely high single-target burst; excellent boss killer; strong execute potential; high crit scaling. Slightly different feel from Kael — Seraphina has the **execute window** as her signature.

**Weaknesses:** Fragile; limited AoE; requires setup; no team utility.

## Chibi Animations

- **Idle:** scythe resting on shoulder, water droplets drifting upward, small currents around feet
- **Attack:** quick scythe swing → water crescent releases
- **Skill 1:** wave rises → scythe cleaves downward → water eruption
- **Skill 2:** spinning reaper attack → whirlpool forms around her
- **Ultimate:** Leviathan spirit appears → massive overhead scythe swing → ocean explodes outward
- **Death:** drops scythe → falls to one knee → collapses

## Team Role

Execute-focused Water Assassin. Best against bosses with HP phase windows. Pair with debuffers (Glacier, Neria) for setup.

## Recommended Partners

(Per canonical source — implied via Water Roster Comparison context:)

- **Glacier** — Frostbite-d / Slowed targets eat extra damage; pair with Whirlpool Reaping
- **Marina** — keeps her fragile self alive (heal + cleanse)
- **Neria** — debuffs that Seraphina exploits
- **Auron** — both single-target Water DPS; together they shred bosses

## Water Roster Comparison

| Hero | Role | Specialty |
|------|------|-----------|
| Glacier | Tank | Frontline + Frost ecosystem |
| Marina | Support | Heal / cleanse |
| Neria | Mage | Magic DPS / control |
| Auron | Archer | Freeze specialist / single-target |
| **Seraphina** | **Assassin** | **Critical Execution Damage** |

## Auto-AI Defaults

- **Skill 1:** Cast on cooldown when target is not already Slowed
- **Skill 2:** Cast on cooldown when target is Slowed (max value)
- **Ultimate:** Cast when target HP < 30% (execute window) OR when target is at full HP and boss-tagged

## Quote

*"The tide does not ask permission. It just arrives."*

---

**Status notes (design polish pending):**
- Execute threshold (30%) may scale with difficulty
- Tide stack vs Neria's Tide — clarify naming in implementation (consider renaming Seraphina's to "Abyss" stacks)
- Scythe weapon archetype confirmed (Assassin-class allowed)
