# GDD 01 — Combat System

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Project I's combat is **auto-paced turn-based**. A party of 3 heroes fights enemies (1-5 per wave). Speed determines turn order. Each hero performs one action per turn — Basic Attack, Skill 1, Skill 2, Ultimate, or Defend. Skills have integer turn cooldowns. Compact window mode runs combat fully on auto. Expanded window mode allows the player to toggle manual control on or off per-stage.

## 2. Player Fantasy

> *I'm watching my hand-picked dream team out-strategize a fight while I work. When a tough boss appears, I can lean in, tab open, and play it perfectly — but the moment I tab out, the team I trained handles it for me.*

The fantasy is **idle commander, not active fighter**. Manual play is a power tool for hard content, not the default expectation.

## 3. Detailed Rules

### 3.1 Battle Format
- **Party size:** 3 heroes.
- **Enemies per wave:** 1-5; varies by stage and difficulty.
- **Waves per stage:** 3-5 normal waves, then a boss wave on chapter-end stages.
- **Victory:** all enemies defeated. Stage rewards granted, idle clock advances.
- **Defeat:** all 3 heroes KO'd. <mark>Stage auto-repeats with reduced rewards (no first-clear bonus, ~50% loot table roll). No "retry limit," no "stamina charged" — the player simply loses the time spent on that attempt.</mark>

### 3.2 Turn Order

Highest **Speed** stat acts first. <mark>**Speed tie-breakers** (in order): (1) higher current ATK; (2) lower current HP%; (3) party position (left → right).</mark>

<mark>**Action gauge model:** Each combatant has an internal "action gauge" that fills at a rate proportional to Speed. When the gauge reaches 100, that combatant takes a turn and the gauge resets to 0. This produces irregular turn orders when Speed values are uneven (a fast hero can act twice between two slow heroes' turns) which is far better than strict round-robin.</mark>

### 3.3 Hero Actions

Each turn a hero performs exactly one of:

| Action | Cooldown | Notes |
|--------|----------|-------|
| Basic Attack | None | Always available |
| Skill 1 | 2 turns | Mid-power, usually single-target |
| Skill 2 | 3 turns | Higher-power, often AoE / utility |
| Ultimate | 5 turns | Highest-impact ability |
| Defend | None | -50% damage taken this turn, +30% counter chance (see 3.10) |

<mark>**Defend** is automatically chosen by auto-AI when (a) the hero has no off-cooldown skill and (b) basic-attacking would target a debuff-immune enemy. Manual players can use it as a deliberate stall tactic.</mark>

### 3.4 Cooldown Behavior

- Cooldowns tick down at the **start** of the hero's turn (not end). A 2-turn cooldown means: cast on turn 1, available again on turn 3.
- <mark>**Ultimate** cooldown starts only the first time it's used (does NOT start at battle start). This prevents the boring "wait 5 turns for first ult" pattern.</mark>
- <mark>**Cooldowns persist between waves within the same stage**, but **reset between stages**. This is a deliberate choice for pacing — late waves feel earned but each stage starts fresh.</mark>

### 3.5 Damage Formula

<mark>

```
RawDamage   = ATK × SkillMultiplier
ElementMod  = 1 + ElementBonus              (Fire→Wind / Wind→Water / Water→Fire = +25%; reverse = -25%; same/neutral = 0%)
CritRoll    = uniform(0..1) < CritRate / 100
CritMod     = 1 + (CritDamage / 100)        if CritRoll else 1.0
AccRoll     = uniform(0..1) < (Accuracy - EnemyResistance) / 100
DefMit      = EnemyDEF / (EnemyDEF + 1000 + 5 × AttackerLevel)
Damage      = floor(RawDamage × ElementMod × CritMod × (1 - DefMit))
Damage      = max(1, Damage)                (a hit always deals at least 1)
```

**Healing** uses the same formula sans Element/Crit/DefMit, scaled by `HealingMultiplier` (skill-defined). Healing can crit only if the skill explicitly allows it.

**Status effect application** rolls separately: `EffectApplied = uniform(0..1) < (Accuracy - EnemyResistance) / 100`. Status effects ignore the attack's hit roll — a status can land on an attack that missed damage if Accuracy is high enough.

**SkillMultiplier reference table** (skill designer tuning knob):

| Action | Default Multiplier | Reason |
|--------|--------------------|--------|
| Basic Attack | 1.00× | Baseline |
| Skill 1 | 1.50× | Mid-burst |
| Skill 2 | 1.80× (AoE) or 2.20× (single-target) | AoE penalty |
| Ultimate | 3.50× (single) or 2.60× (AoE) | Designed around 5-turn investment |

**DefMit example:** Enemy with 800 DEF vs. lvl 40 attacker = 800 / (800 + 1000 + 200) = 40% mitigation. Same enemy vs. lvl 60 attacker = 800 / (800 + 1000 + 300) = 38%. Higher-level attackers cut through DEF, but never reduce it to zero.

</mark>

### 3.6 Element System

| Element | Strong vs. | Weak vs. |
|---------|-----------|----------|
| 🔥 Fire | 🌪 Wind (+25%) | 💧 Water (-25%) |
| 💧 Water | 🔥 Fire (+25%) | 🌪 Wind (-25%) |
| 🌪 Wind | 💧 Water (+25%) | 🔥 Fire (-25%) |
| Neutral | — | — |

<mark>Element neutral (enemy of no listed element, e.g. void/stone bosses) applies neither bonus nor penalty.</mark>

<mark>**Off-element penalty escalates with difficulty tier:** Normal -25%, Hard -25%, Nightmare -40%, Hell -50%. (See `09-campaign-structure.md`.)</mark>

### 3.7 Class System

| Class | Role | Primary Stats | Notes |
|-------|------|---------------|-------|
| Tank | Frontline, taunt, shield | HP, DEF, Accuracy | Heavy Armor |
| Assassin | Single-target burst | ATK, Speed, CritRate, CritDmg | Light Armor |
| Archer | Sustained ranged DPS | ATK, Accuracy, CritDmg | Light Armor |
| Mage | AoE & debuff | ATK, Accuracy, Speed | Magic Armor |
| Support | Heal / buff / cleanse | Accuracy, Speed, HP | Magic Armor |

### 3.8 Formation / Positioning

<mark>

**Two-row formation:**

| Position | Row | Role |
|----------|-----|------|
| Slot 1 | Front | Tank by default |
| Slot 2 | Front | Bruiser / off-tank |
| Slot 3 | Back | DPS / Support / Mage |

**Damage routing:**
- **Single-target enemy attacks** target Front Row first unless they have piercing/back-row skills. Back-row heroes take 30% damage from front-row-targeted attacks (splash).
- **AoE attacks** hit all 3 slots equally.
- **Taunt** redirects all single-target attacks to the taunting hero regardless of row.
- **If both Front-Row slots are dead**, the Back-Row hero is treated as Front Row.

**Slot count:** 3 fixed. Future expansion to 4 or 5 is a backlog item, not v1.

</mark>

### 3.9 KO & Wipe Behavior

- <mark>A KO'd hero is **dead for the remainder of the current stage**. They cannot be revived mid-stage except by abilities that explicitly say so (e.g., Akari's `Crimson Rebirth`).</mark>
- <mark>**Between stages**, all heroes revive to 100% HP automatically. There is no "out-of-combat heal" cost.</mark>
- <mark>**Party wipe** (all 3 KO'd): Stage auto-restarts. Rewards from that attempt are reduced — the player gets 50% of the standard repeat-clear loot table and **no** first-clear bonus or 3-star bonus.</mark>
- <mark>**Idle-mode wipe loop:** if a party wipes 3 consecutive times on the current idle stage, the idle simulation auto-downgrades to the last stage the party cleared cleanly. A toast notification surfaces this. The player can override and resume the harder stage manually.</mark>

### 3.10 Counter-Attack

<mark>**Counter-attack** is not a base stat. It is granted by:
- Specific hero skills (e.g., a hypothetical "Vengeance Stance" passive).
- The **Defend** action (+30% chance to counter the next single-target attack against this hero).
- Equipment Set bonuses (e.g., the Berserker set — see `04-equipment.md`).

A counter triggers on a single-target attack against the counter-eligible hero. It does **not** consume the hero's next turn. Counter damage uses Basic Attack multiplier (1.00×) and cannot crit unless the source explicitly allows it. Counters cannot themselves be countered (no infinite loops).</mark>

### 3.11 Boss Enrage

<mark>

Every boss stage has an **enrage timer**. After N turns, the boss applies a permanent buff to itself: `+100% ATK, +50% Speed, +200% Skill cooldown reduction`.

| Difficulty | Boss enrage turn |
|------------|------------------|
| Normal | 30 |
| Hard | 25 |
| Nightmare | 20 |
| Hell | 15 |

Enrage exists to **prevent infinite-stall builds** (e.g., perma-shield Tank + perma-heal Support) on bosses. Stage bosses without an enrage become trivially farmable, which breaks the difficulty curve.

</mark>

### 3.12 Buff / Debuff Stacking Rules

<mark>

| Rule | Behavior |
|------|----------|
| **Identical buff from same source** | Refreshes duration to its full value. Does NOT increase magnitude. |
| **Identical buff from different sources** | Replaces if the new magnitude is **higher** or duration is **longer**, otherwise ignored. |
| **Different buffs** | Stack freely. A hero can have ATK Up + DEF Up + Speed Up simultaneously. |
| **Identical debuff** | Same rules: refresh / replace if stronger or longer. |
| **Stack-based passives** (e.g. Lyria's Focus, Kael's Predator) | Cap at 5 stacks. Each new trigger adds 1 stack; old stacks do NOT have individual timers. Stacks persist until the hero dies or the stage ends. |
| **Maximum total buffs/debuffs per combatant** | 8 buffs + 8 debuffs, hard cap. Excess is rejected silently (oldest stays). |
| **Cleanse priority** | Cleansing removes oldest debuff first unless skill specifies otherwise. |

</mark>

### 3.13 Status Effects (canonical list)

| Effect | Type | Behavior | Default duration |
|--------|------|----------|------------------|
| Burn | Debuff | Deal 8% of caster's ATK as damage at start of victim's turn | 2 turns |
| Freeze | Debuff | Skip next turn | 1 turn |
| Frostbite | Debuff | -20% Speed, -10% DEF | 2 turns |
| Slow | Debuff | -30% Speed | 2 turns |
| ATK Down | Debuff | -30% ATK | 2 turns |
| DEF Down | Debuff | -30% DEF | 2 turns |
| Accuracy Down | Debuff | -30% Accuracy | 2 turns |
| Speed Down | Debuff | -30% Speed | 2 turns |
| Stun | Debuff | Skip next turn, immune to most other debuffs | 1 turn |
| Haste | Buff | +30% Speed | 2 turns |
| ATK Up | Buff | +30% ATK | 2 turns |
| DEF Up | Buff | +30% DEF | 2 turns |
| Shield | Buff | Absorbs damage equal to value, expires when consumed | 2 turns or until depleted |
| Regen | Buff | Heal 8% of caster's max HP at start of victim's turn | 2 turns |
| Taunt | Debuff (on enemy) | Forces target to single-attack the taunter | 1-2 turns |
| Crowd Control Resistance | Buff | Immune to Freeze, Stun, Taunt | 2 turns |
| Revival Flame | Buff | If KO'd while active, revive at 20% HP, then expire | 2 turns |

<mark>**Note:** Many character passives also generate unique stacks (Focus, Predator, Crimson Flame, Wind Sigil, Frostguard, Resolve, Tide, Frost Charge, Infernal Momentum, Nature Blessing, Serenity). These follow the stack-based passive rules above (cap 5, no individual timers).</mark>

### 3.14 Auto-AI Specification

<mark>

When auto mode is active, each hero follows a deterministic decision tree on its turn:

```
function decideAction(hero, allies, enemies):
    if hero.HP < 20% and Defend gives survival benefit:
        return Defend

    if Ultimate is off cooldown:
        if any Ultimate-priority condition is met:
            return Ultimate
        elif 2+ enemies are alive AND Ultimate is AoE:
            return Ultimate
        elif strongest enemy HP > 30% AND Ultimate is single-target:
            return Ultimate

    if Skill 2 is off cooldown:
        return Skill 2  (targeted per Skill 2's type)

    if Skill 1 is off cooldown:
        return Skill 1  (targeted per Skill 1's type)

    return Basic Attack
```

**Default targeting** by skill type:

| Skill type | Auto-target |
|------------|-------------|
| Single-target damage | Enemy with lowest HP% (finish them off) |
| AoE damage | N/A — hits all |
| Single-target heal | Ally with lowest HP% |
| Self-buff | Self |
| Team-buff | All allies |
| Debuff (single) | Enemy with highest ATK (silence them) |

**Manual override:** in the expanded mode Hero Detail screen, the player can toggle each hero's auto behavior per-skill (e.g., "Lyria's Ultimate: only cast on Boss tag" or "Sylphie's Skill 1: cast at any ally HP < 60%"). This is a **per-hero preference**, saved to the save file, persistent across battles.

**Auto-mode bias slider** (advanced setting): Aggressive / Balanced / Conservative.
- **Aggressive:** ults released ASAP regardless of enemy count
- **Balanced:** as above (default)
- **Conservative:** ults held until enemy HP > 70% on at least 2 targets or boss-tagged enemy is alive

</mark>

### 3.15 Combat Speed Multiplier

<mark>

In **expanded mode**, players can set combat speed to 1×, 2×, 3×, or 4×. Default is 1×. Higher speeds shrink animation playback time but **do not** alter game logic (no skipped frames in damage roll). The speed setting is saved as a profile preference.

In **compact mode**, combat runs at 1× always — to keep the desktop CPU footprint predictable and prevent the game from spiking the system while idle. Players who want fast farming should expand to the full window.

Tower / Boss Rush / Hero Trial stages remember per-mode speed presets (e.g., Tower defaults to 3×, Campaign defaults to 1×) — separately saved.

</mark>

### 3.16 Boss Preview / Scout

<mark>

Before entering any boss stage (campaign or Tower), tapping a **Scout** button surfaces:

- Enemy roster (sprites + names + element + class)
- Enemy levels (relative to player average team level)
- Boss skill list (icons only on first scout; full descriptions unlock after first defeat)
- Recommended counter-elements / party comp

Scouting is **free** — no resource cost, no cooldown. It exists to reduce blind-attempt frustration.

</mark>

### 3.17 Turn Order Timeline UI

<mark>

The expanded-mode combat screen shows a **horizontal turn order timeline** at the top, displaying the next 6 turns based on action-gauge fill rates and predicted Speed changes. Used by manual players to plan Skill 2 sequencing. Hidden in compact mode (no room).

Timeline updates each tick — when Speed changes mid-turn (e.g., Haste applied), the timeline reshuffles visibly so the player sees the impact of their buff.

A simpler version of this UI is visible to auto players too — it's purely informational and helps explain *why* the auto-AI picks the moves it does.

</mark>

### 3.18 Manual Retry

<mark>

After party wipe, the player sees a **Retry** modal with three options:

1. **Retry (same team)** — restart immediately. No cost.
2. **Edit team & retry** — opens the team-builder. No cost.
3. **Abandon** — return to stage select. No cost.

Manual retries are unlimited. No daily limit. No stamina cost. The only "cost" is time spent on the failed run.

</mark>

### 3.19 Replay / Damage Log

<mark>

At the end of every battle (win or loss), the player can tap **Replay** to open a damage log showing:

- Total damage dealt per hero (with per-skill breakdown)
- Total damage taken per hero
- Healing done per hero
- Status effects applied (count)
- Highest single-hit damage and which skill caused it

The log is not saved between battles — it's intended for quick "did I make a mistake?" review during the post-battle screen. It's also useful for the Hero Trials and Tower of Trials min-max community.

A full replay video / step-by-step playback is **not** in v1 (backlog).

</mark>

### 3.20 Team Presets

<mark>

The Team menu lets the player save up to **5 named team presets** (e.g., "Fire Burn", "Boss Hunter", "Tower Climb", "Wind PvE"). Each preset stores:

- Selected 3 heroes
- Each hero's current equipment
- Each hero's manual auto-AI overrides
- Optional preset notes

Switching presets is **one tap** — useful for switching between idle farming team and active boss-fight team.

A new battle's "Last Used Team" is always auto-saved as preset slot #6 (overwrites). This means the player always has a one-tap restore even if they don't manually save presets.

</mark>

## 4. Formulas (consolidated reference)

See section 3.5 for the full damage equation. Other key formulas:

| Concept | Formula |
|---------|---------|
| Action gauge fill per tick | `gauge += Speed × 0.001` (target: full at gauge ≥ 100) |
| HP scaling per level | `HP_at_L = BaseHP × (1 + 0.04 × (L-1))` |
| ATK scaling per level | `ATK_at_L = BaseATK × (1 + 0.035 × (L-1))` |
| DEF scaling per level | `DEF_at_L = BaseDEF × (1 + 0.04 × (L-1))` |
| Shield damage absorption | `Shield absorbs incoming Damage first; excess hits HP` |
| Burn / Regen tick | `value = (caster.ATK × 0.08)` (Burn) or `(caster.maxHP × 0.08)` (Regen) |
| Crit chance hard cap | 100% (no overflow) |
| Accuracy hard cap | 200% (overflow grants +damage on certain effects — see Lyria passive) |
| Status resistance hard cap | 95% (5% min hit rate always) |

## 5. Edge Cases

- **Simultaneous KO** (mutual kill, e.g., reflect): defender resolves first. Attacker's death is then resolved.
- **Caster KO'd mid-skill animation:** the skill's effects still apply (animation visually completes). Stat-based status (Burn DoT, Regen) referencing the caster's stats uses the **snapshot at cast time**.
- **Cooldown overflow:** if a buff somehow reduces a cooldown below 0, treat as 0 (next turn the skill is available).
- **0-speed scenario:** if all combatants have Speed=0 (test setup), default to position order, then auto-revive Speed to 1 to prevent infinite loop.
- **All enemies dead mid-Ultimate animation:** Ultimate still completes; loot rolls; victory triggers after animation.
- **Hero counterattack when KO'd by triggering hit:** counter does **not** fire — counter requires the defender to survive the hit.
- **Pre-emptive auto-skip:** if a stage is set to "Auto" and the player tabs away, the game keeps simulating. If they tab back, screen recovers to current state — there is no "rewind" buffer.

## 6. Dependencies

- **Stats system** (`gdd/03-stats-and-progression.md`) — defines HP/ATK/DEF/Speed/CritRate/CritDmg/Accuracy values.
- **Equipment** (`gdd/04-equipment.md`) — supplies sub-stats and set bonuses (some grant counter, lifesteal, shield boost).
- **Hero abilities** (per-hero sheets in `design/heroes/`) — each hero's Skill 1, Skill 2, Ultimate definitions.
- **Campaign / difficulty** (`gdd/09-campaign-structure.md`) — difficulty modifiers, boss enrage timer values.
- **Idle simulation** (`gdd/06-idle-and-shrine.md`) — the auto-AI runs in idle mode at a tick rate defined there.
- **UI / menus** (`gdd/20-ui-menus-tabs.md`) — turn timeline, scout panel, retry modal, replay log.

## 7. Tuning Knobs

- Skill multipliers per action type (3.5 table)
- Action gauge fill rate constant (`0.001`)
- Crit / Accuracy / Status hit caps
- Per-stat per-level growth coefficients (3.5%, 4%)
- Boss enrage thresholds per difficulty (3.11)
- Default status effect durations (3.13)
- Off-element penalty per difficulty (3.6)
- Counter chance from Defend action (default 30%)
- AoE penalty (Skill 2 single-target multiplier 2.20× vs AoE 1.80×)
- Auto-mode bias slider behavior thresholds (3.14)
- Repeat-wipe auto-downgrade threshold (3 consecutive wipes in 3.9)

## 8. Acceptance Criteria

1. ✅ A hero with 150 Speed acts before a hero with 130 Speed in a controlled test scenario.
2. ✅ A Skill 1 with cooldown 2 cast on turn 1 is unavailable on turn 2 and available on turn 3.
3. ✅ <mark>Damage formula in 3.5 produces deterministic output for fixed seeds (used in unit tests).</mark>
4. ✅ Element triangle math: Fire-skill on Wind enemy = 1.25× modifier; Fire-skill on Water enemy = 0.75× modifier; Fire on Neutral = 1.0× modifier.
5. ✅ <mark>Party wipe results in stage auto-restart, with first-clear bonus suppressed and reward roll reduced to 50% of standard repeat table.</mark>
6. ✅ Buff stacking — applying the same ATK Up twice from same source extends duration, not magnitude.
7. ✅ <mark>Auto-AI never uses Ultimate on a single trash mob when a boss-tagged enemy is alive (Balanced bias mode).</mark>
8. ✅ <mark>Turn order timeline UI updates within 1 frame when Speed changes mid-turn.</mark>
9. ✅ Crit / Accuracy / Status caps are enforced (a hero with 250 CritRate still crits at 100%, not 250%).
10. ✅ <mark>Compact mode runs at locked 1× combat speed regardless of expanded-mode preference.</mark>
11. ✅ <mark>Boss enrage applies the documented buff stack and remains for the rest of the battle.</mark>
12. ✅ <mark>Counter-attacks only fire if the defender survives the triggering hit.</mark>
13. ✅ <mark>3 consecutive idle-mode wipes on the same stage auto-downgrade idle target to last-cleanly-cleared stage.</mark>
