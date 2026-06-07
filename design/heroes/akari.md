# Akari — The Phoenix Chronicler

| Field | Value |
|-------|-------|
| **Element** | 🔥 Fire |
| **Class** | 💚 Support |
| **Role** | Buffer / Revival Support |
| **Weapon** | Phoenix Lantern (floating fire lantern blessed by the Phoenix Spirit) |
| **Rarity** | ★★★★★ |
| **Banner Pool** | 🆕 Future Limited Banner (post-launch release) |
| **Status** | Design draft — kit from source PDF, polish pass pending |

## Appearance

- Elegant eastern-inspired shrine maiden
- Long crimson hair tied with golden phoenix ornament
- Amber eyes that glow softly
- White and red ceremonial robes with phoenix-feather trim
- Golden phoenix ornaments at wrists and waist
- Floating fire lantern beside her with a small Phoenix Spirit inside
- Color palette: red, gold, white, ember orange

## Stat Grades

| HP | ATK | DEF | SPD | CR | CD | ACC |
|----|-----|-----|-----|-----|----|-----|
| B | D | B | A | D | D | S |

## Passive — Phoenix Ember

Whenever an ally falls below 50% HP:
- Restore a small amount of HP (10% of Akari's ATK)
- Can trigger **once per ally per battle**

## Basic Attack — Lantern Flame

- **Cooldown:** None
- Akari sends a small phoenix flame toward an enemy.
- **Effects:** Single Target Damage.

## Skill 1 — Blessing of Ashes

- **Cooldown:** 2 turns | **Heal multiplier:** 0.5× ATK
- Akari's lantern releases restorative embers.
- **Effects:** **Heal All Allies**; applies **ATK Up** (+30%, 2 turns).

## Skill 2 — Crimson Rebirth

- **Cooldown:** 3 turns
- Akari surrounds allies with phoenix flames.
- **Effects:** Apply **Revival Flame** to all allies (2 turns): if an ally is defeated during this window, they revive with 20% HP. Each ally can be revived only once per battle.

## Ultimate — Phoenix Festival

- **Cooldown:** 5 turns | **Heal multiplier:** 1.2× ATK
- A massive phoenix appears from Akari's lantern and circles the battlefield.
- **Effects:**
  - Large **Team Heal**
  - **ATK Up** (+30%, 2 turns)
  - **Speed Up** (+30%, 2 turns)
  - Apply **Revival Flame** to all allies (2 turns)

## Character Identity

**Strengths:** Strong buffs; emergency recovery; unique revival utility (only hero with proactive revive); excellent team support; high accuracy.

**Weaknesses:** Low damage; limited crowd control; relies on team to win.

## Chibi Animations

- **Idle:** lantern floating beside her, small phoenix embers orbiting, warm glow beneath feet
- **Attack:** lantern swings → phoenix spark fires forward
- **Skill 1:** lantern opens → healing embers scatter → warm light spreads outward
- **Skill 2:** phoenix flames envelop each ally → revival sigils appear briefly
- **Ultimate:** large phoenix spirit emerges → flames spiral around allies → golden feathers rain down
- **Death:** lantern falls → flame extinguishes → Akari kneels and fades

## Team Role

The Fire-faction Support counterpart to Sylphie. Where Sylphie is pure sustain, Akari trades a bit of healing for **revival insurance** — extremely powerful in hard content where one bad turn would wipe.

## Recommended Partners

- **Valdrik** — durable frontline that Akari's revives protect
- **Emberia** — gets her ATK Up + Speed Up buffs to maximum AoE burn
- **Kaida** — gets revived after she dives too deep
- **Auron** — fragile Water Archer she keeps alive through Frostbound bursts

## Fire Team Synergy Flow

The intended Fire-faction loop with Akari at the heart of it:

```
Valdrik           → tanks pressure
   ↓
Akari             → buffs ATK/Speed + applies Revival Flame
   ↓
Emberia           → burns the entire battlefield with stacked Crimson Flame
   ↓
Kaida             → executes the weakened survivors
```

Akari gives the Fire faction what it otherwise lacks: **sustain, recovery, and second chances** — while keeping the aggressive fire identity through phoenix-themed support magic.

## Auto-AI Defaults

- **Skill 1:** Cast on cooldown when 2+ allies below 80% HP
- **Skill 2:** Cast on cooldown when entering boss waves OR when team has 1+ ally below 40% HP
- **Ultimate:** Cast when 2+ allies below 50% HP OR boss-tagged enemy appears

## Quote

*"Fall — and rise again. The Phoenix remembers."*

---

**Status notes (design polish pending):**
- Heal multipliers may need tuning vs Sylphie's
- Revival Flame should NOT trigger if Akari herself dies — confirm in implementation
- Phoenix Spirit visual should be subtle, not overpower other VFX
