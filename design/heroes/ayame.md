# Ayame — The Storm Dancer

| Field | Value |
|-------|-------|
| **Element** | 🌪 Wind |
| **Class** | 🔮 Mage |
| **Role** | AoE DPS / Debuffer |
| **Weapon** | Tempest Ritual Fan (ceremonial fan with kanji talismans + wind sigils) |
| **Rarity** | ★★★★★ |
| **Banner Pool** | 🆕 Future Limited Banner (post-launch release) |
| **Status** | Design draft — kit from source PDF, polish pass pending |

## Appearance

- Eastern shrine-maiden / kagura-dancer aesthetic
- Long flowing black hair tied with green-and-white ribbons
- Bright green eyes with subtle wind-glow
- White and green ceremonial robes with kanji paper talismans pinned at sleeves
- Tempest Ritual Fan carried in dominant hand — talismans float around her
- Color palette: white, jade green, gold-paper, black accents

## Stat Grades

| HP | ATK | DEF | SPD | CR | CD | ACC |
|----|-----|-----|-----|-----|----|-----|
| D | S | D | A | B | A | A |

## Passive — Dancing Winds

Whenever Ayame uses a skill, gain 1 **Wind Sigil** stack (max 5).

Each stack grants:
- +5% Skill Damage
- +3% Speed

At max stacks: Ayame ignores 20% enemy DEF.

## Basic Attack — Wind Charm

- **Cooldown:** None
- Releases an enchanted talisman carried by the wind.
- **Effects:** Single Target Damage; 20% chance to inflict **Speed Down** (1 turn).

## Skill 1 — Whirling Talisman

- **Cooldown:** 2 turns | **Multiplier:** 1.8× AoE
- Ayame scatters sacred talismans across the battlefield.
- **Effects:** AoE Damage; applies **Speed Down** (2 turns).

## Skill 2 — Sacred Gale Dance

- **Cooldown:** 3 turns | **Multiplier:** 1.8× AoE
- Ayame performs an ancient shrine ritual summoning slicing winds.
- **Effects:** AoE Damage; applies **Accuracy Down** (-30%, 2 turns); generates 2 Wind Sigil stacks.

## Ultimate — Heavenly Tempest Rite

- **Cooldown:** 5 turns | **Multiplier:** 2.6× AoE
- Ayame opens a sacred storm circle and commands the wind spirits.
- **Effects:**
  - Massive AoE Damage
  - **Removes all enemy buffs**
  - Applies **Wind Vulnerability** (-25% Wind resistance, all enemies, 2 turns)
  - Generates maximum (5) Wind Sigil stacks immediately

## Character Identity

**Strengths:** Highest AoE damage in Wind team; excellent wave clear; strong debuff utility; fast skill cycling; scales well in long battles.

**Weaknesses:** Low HP / DEF; vulnerable to assassins; relies on skills for damage; weak basic attacks.

## Chibi Animations

- **Idle:** holds ritual fan, paper talismans float around her, sleeves sway in wind
- **Attack:** throws talisman → fan slash effect → returns to ritual stance
- **Skill 1:** scatters talismans outward → wind cuts across enemies → talismans flutter away
- **Skill 2:** ritual dance pose → spiraling winds form → slicing wind blades hit enemies
- **Ultimate:** sacred shrine circle appears → storm clouds gather overhead → talismans swirl around enemies → massive tornado erupts
- **Death:** drops ritual fan → talismans scatter away → falls gracefully

## Team Role

Wind AoE Mage. Mirror of Emberia (Fire) and Neria (Water). Pairs with Wind-team for max element synergy. Excellent in chapters with Water-element enemies (Wind > Water).

## Recommended Partners

(Per canonical source sheet:)

- **Mei Lin** — shields Ayame's fragile back line (Wind synergy)
- **Sylphie** — heals + buffs Ayame's AoE
- **Kael** — assassin finisher for surviving enemies
- **Marina** — alternate sustain across mixed Water/Wind teams
- **Valdrik** — alternate frontline tank with Burn synergy on AoE-cleared boards

## Auto-AI Defaults

- **Skill 1:** Cast on cooldown when 2+ enemies alive
- **Skill 2:** Cast on cooldown when 2+ enemies alive AND target has no Accuracy Down already
- **Ultimate:** Cast on cooldown when 3+ enemies alive OR boss-tagged enemy alive AND enemies have buffs to strip

## Quote

*"The fan turns, the wind answers."*

---

**Status notes (design polish pending):**
- Wind Sigil vs Lyria's Focus — both 5-stack passives; clarify uniqueness
- Skill 1 and Skill 2 are both AoE — consider differentiating one as Mid-AoE (3 random) vs full AoE
- Sacred Gale Dance Accuracy Down value (-30%) may be too punishing; tune
