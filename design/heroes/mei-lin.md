# Mei Lin — The Jade Guardian

| Field | Value |
|-------|-------|
| **Element** | 🌪 Wind |
| **Class** | 🛡 Tank |
| **Role** | Protector / Shield Specialist |
| **Weapon** | Jade Tower Shield (massive jade shield engraved with protective runes) |
| **Rarity** | ★★★★★ |
| **Banner Pool** | 🆕 Future Limited Banner (post-launch release) |
| **Status** | Design draft — kit from source PDF, polish pass pending |

## Appearance

- Elegant eastern-inspired guardian, tall and composed
- Long black hair with jade ornaments
- Emerald-green eyes
- White and jade ceremonial armor with golden trim
- Flowing silk ribbons infused with wind magic (drift around her)
- Massive jade tower shield engraved with ancient protective runes
- Color palette: jade green, white, gold, black

## Stat Grades

| HP | ATK | DEF | SPD | CR | CD | ACC |
|----|-----|-----|-----|-----|----|-----|
| S | C | S | B | D | D | B |

## Passive — Guardian's Resolve

Whenever Mei Lin receives damage, gain 1 **Resolve** stack (max 5).

Each stack grants:
- +4% DEF
- +4% Shield Strength

(Note: same name as Valdrik's Resolve — each hero's stacks are isolated.)

## Basic Attack — Jade Strike

- **Cooldown:** None
- Strikes with her shield, releasing compressed wind.
- **Effects:** Single Target Damage.

## Skill 1 — Emerald Barrier

- **Cooldown:** 2 turns
- Mei Lin creates a protective wall of jade wind around her allies.
- **Effects:** Grants **Shield** to all allies (15% of Mei Lin's max HP, 2 turns).

## Skill 2 — Guardian's Gale

- **Cooldown:** 3 turns | **Multiplier:** 1.8× AoE
- Mei Lin spins her shield and creates a powerful wind vortex.
- **Effects:** AoE Damage; **Taunt All Enemies** (2 turns); **DEF Up** to self (+30%, 2 turns).

## Ultimate — Heavenly Jade Sanctuary

- **Cooldown:** 5 turns
- Mei Lin plants her shield into the ground and summons an enormous jade barrier.
- **Effects:**
  - Massive **Team Shield** (40% of Mei Lin's max HP, 2 turns)
  - **DEF Up** to all allies (+50%, 2 turns)
  - **Damage Reduction** to all allies (+30%, 2 turns)

## Character Identity

**Strengths:** Highest defensive utility in Wind roster; strong team shields; excellent survivability; reliable protection; good turn cycling for a tank.

**Weaknesses:** Low damage; limited offensive pressure; relies on teammates for kills.

## Chibi Animations

- **Idle:** shield planted beside her, jade talismans flutter in the wind, soft emerald particles drift
- **Attack:** shield bash → wind burst releases → returns to defensive stance
- **Skill 1:** raises shield → emerald barrier projects across allies → wind ribbons swirl
- **Skill 2:** spins shield → jade wind vortex forms → enemies are pulled toward her
- **Ultimate:** plants shield → massive jade barrier rises → protective winds surround team → ancient runes glow beneath her feet
- **Death:** shield falls beside her → drops to one knee → wind particles fade → collapses gracefully

## Team Role

The Wind-faction Tank counterpart to Valdrik / Glacier. Shield-focused (vs Valdrik's Taunt-focused, vs Glacier's CC-focused). Best for protecting fragile back lines.

## Recommended Partners

(Per canonical source sheet:)

- **Lyria** — back-line Crit Archer protected by Mei Lin's shields
- **Kael** — assassin gets shield insurance for his dive
- **Ayame** — fragile AoE Mage protected by Mei Lin
- **Sylphie** — sustain stacks with Mei Lin's shields

## Wind Roster Comparison

| Hero | Role | Specialty |
|------|------|-----------|
| Lyria | Archer | Precision DPS |
| Kael | Assassin | Burst single-target |
| Ayame | Mage | AoE Wind Sigil stacking |
| Sylphie | Support | Healer / cleanser |
| **Mei Lin** | **Tank** | **Shields & Damage Reduction** |

## Auto-AI Defaults

- **Skill 1:** Cast on cooldown when team has no active shields
- **Skill 2:** Cast on cooldown when 2+ enemies alive AND any ally HP < 70%
- **Ultimate:** Cast when boss-tagged enemy appears OR 2+ allies below 50% HP

## Quote

*"The jade does not break. Neither does my word."*

---

**Status notes (design polish pending):**
- Shield value (15%/40% of max HP) may need scaling with rarity/level
- Wind ribbons VFX should be performant in compact mode
- Taunt duration on Skill 2 vs Valdrik's 40% chance — Mei Lin is guaranteed but only on AoE
