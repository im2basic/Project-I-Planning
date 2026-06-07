# GDD 25 — Enemy AI

## 1. Overview

Enemy AI scales with **enemy level** — higher-level enemies make smarter decisions. This creates a natural difficulty curve where Chapter 1 mobs feel mindless but Chapter 12 / Tower / Boss enemies play strategically. AI tiers are deterministic and testable.

## 2. Player Fantasy

> *Early enemies are fodder. By Chapter 5, they start using skills. By Chapter 10, they're targeting my squishies. Bosses play like a real opponent.*

## 3. Detailed Rules

### 3.1 AI Tiers

Enemy AI is gated by **AI Tier**, which is set per-enemy via spawn data (not strictly by level — designers can tag a "smart" enemy in Chapter 2 if they want a difficulty spike).

By default, AI Tier is determined by enemy level:

| Enemy Level | Default AI Tier | Behavior name |
|-------------|------------------|----------------|
| 1-10 | **Tier 0** | Mindless |
| 11-25 | **Tier 1** | Reactive |
| 26-40 | **Tier 2** | Tactical |
| 41-55 | **Tier 3** | Strategic |
| 56+ | **Tier 4** | Optimal |

Bosses, Hell-mode enemies, and Tower floor 50+ enemies are always **Tier 4** regardless of level.

### 3.2 Tier 0 — Mindless

Used for very early-game enemies (Chapter 1 Normal stages).

**Action selection:**
- 100% basic attack on cooldown
- Skills never used (treat skills as unavailable)
- No Ultimate (unless boss)

**Targeting:**
- Random alive hero

**Personality:** "Just charging forward." Predictable, easy to bait.

### 3.3 Tier 1 — Reactive

Mid-Chapter 1 and Chapter 2 enemies.

**Action selection:**
- 70% basic attack, 30% Skill 1 (if off-cooldown)
- Skill 2 never used
- Ultimate never used unless HP < 30% (desperate move)

**Targeting:**
- Random alive hero (basic attack)
- Lowest current HP hero (skill 1 — finishing instinct)

**Personality:** "They've started swinging back." Slight finishing-attack threat.

### 3.4 Tier 2 — Tactical

Chapters 3-7 normal enemies.

**Action selection:**
- 50% basic attack
- 30% Skill 1 (if off-cooldown)
- 15% Skill 2 (if off-cooldown)
- 5% Ultimate (if off-cooldown AND in last enemy alive — desperate)

**Targeting:**
- Damage skills target **lowest HP%** alive hero
- Buff skills (if enemy is support) target lowest-HP ally
- AoE skills cast when 2+ heroes alive

**Personality:** "They're picking off my back line." Players need taunt or shield protection.

### 3.5 Tier 3 — Strategic

Chapters 8-12 normal, Hard mode enemies.

**Action selection:**
- 35% basic attack
- 25% Skill 1
- 25% Skill 2
- 15% Ultimate (if off-cooldown AND meaningful target available)

**Targeting:**
- Damage targets **lowest effective DEF** hero first (squishies)
- AoE skills cast when **2+ heroes have any active buff** (priority: strip buffs)
- Debuff skills target the highest-ATK hero (cripple DPS)
- Single-target Ultimates target the **highest-threat** hero (highest ATK × Speed)
- Healing skills (if enemy is support-tagged) cast when ally HP < 50%

**Personality:** "They know what they're doing." Players need to think about formation + counter-comp.

### 3.6 Tier 4 — Optimal

Nightmare, Hell, Tower floor 50+, all bosses.

**Action selection:**
- Action priority is **fully evaluated each turn** using a utility-based decision tree:
  1. If Ultimate is off-cooldown AND (any hero is below 30% HP OR boss-tagged condition met): cast Ultimate
  2. Else if Skill 2 is off-cooldown AND its expected damage/effect value is high (heuristic): cast Skill 2
  3. Else if Skill 1 is off-cooldown: cast Skill 1
  4. Else: basic attack

**Targeting:**
- Damage targets **lowest effective HP** (current HP × DEF factor) — the "easiest kill"
- AoE damage cast when **2+ heroes alive AND total expected damage > single-target option**
- Element-mod aware: prefer striking a target with off-element penalty (where enemy has advantage)
- Defensive plays: if a hero is dropping low and the enemy has a Heal-block / cleanse-resist style move, that move is prioritized
- Cleave through Tank Taunts: if Tier-4 enemy has DEF-ignore skills, those are prioritized against the Taunting Tank

**Personality:** "They're playing the game with me." Top-tier content. Players need optimized teams + good gear.

### 3.7 Boss Special Rules

In addition to Tier 4 AI, **bosses** have:

- **Enrage timer** per `gdd/01-combat.md` § 3.11 — at turn N, boss buffs itself massively
- **Phase shift triggers** (per-boss design) — at HP thresholds, boss changes attack pattern
- **Signature mechanic** (per-boss design) — see `gdd/22-boss-design.md`

These are layered ON TOP OF Tier 4 AI. The base decision-making is still utility-driven.

### 3.8 Status Effect AI Behavior

Enemies aware of their own status effects:

| If enemy has... | They will... |
|-----------------|--------------|
| **Burn / Regen** (DoT on themselves) | Same actions; doesn't change AI |
| **Stun / Freeze** | Skip turn (forced) |
| **Slow** | Lower Speed → fewer turns in time |
| **DEF Down** (themselves) | Tier 3+: if a healer/buffer is available, target it first to cleanse |
| **Shield breaking soon** | Tier 4: prioritize protective skills |
| **Crowd Control Resistance** (themselves) | Tier 4: more aggressive plays (they know CC won't land) |

### 3.9 AI in Idle / Auto-mode play

When the player is in **idle mode** (`gdd/06-idle-and-shrine.md`), the auto-AI runs on a deterministic seed. Enemy AI runs the same tier rules — no "easier" idle AI. This keeps idle results consistent with manual play of the same stage.

### 3.10 Tower & Boss Rush AI

- Tower floor 1-49: AI tier scales by floor (similar to level scaling)
- Tower floor 50+: always Tier 4
- All Tower bosses (every 10 floors): Tier 4 + boss rules
- Boss Rush: always Tier 4

### 3.11 Hell-Mode AI Tweaks

Hell mode applies **AI Tier +1** override:
- Tier 0 → Tier 1
- Tier 1 → Tier 2
- ...
- Tier 4 → Tier 4 + Hell-only modifier: enemy spends turn looking at *next* turn's action and pre-positions accordingly (slight prediction)

### 3.12 AI Variability (anti-stale-meta protection)

To prevent players from solving "always cast skill 1 then skill 2 then ultimate" loops:

- Tier 2+ rolls a **5% chance** to deviate from optimal play and pick the 2nd-best move instead
- Tier 3+ rolls a **3% chance** to deviate
- Tier 4 rolls a **2% chance** to deviate

This variability is **seeded deterministically per-battle** (so a save replay produces identical results — see `gdd/17-save-system.md`).

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Default AI Tier from level | `clamp(floor((enemyLevel - 1) / 12), 0, 4)` |
| Deviation roll | `roll < deviationChance[tier]` |
| Targeting utility (Tier 4) | `damageValue × (1 + elementBonus) × (1 / max(1, defMitigationOf(target)))` |
| AoE cast threshold | `count(aliveTargets) ≥ 2 AND aoeMultiplier × count ≥ singleTargetMultiplier × 1.2` |

## 5. Edge Cases

- **All heroes have identical stats** (training-room scenario) — targeting falls through to first-in-position
- **Tier 4 enemy with no off-cooldown skill** — basic attack the lowest HP target
- **All heroes Taunted by one Tank** — Tier 4 with DEF-ignore: still hits Tank but uses DEF-ignore skill; Tier 3 without DEF-ignore: still must hit the Tank (Taunt forces it)
- **Enemy is Stunned/Frozen on its turn** — skip turn entirely; cooldowns DO tick down
- **Enemy is Taunted (rare — debuff on enemy)** — must target the Taunter
- **Heal skill from enemy with no allies** — skip (skill not selectable)

## 6. Dependencies

- `gdd/01-combat.md` — combat engine; turn order; status effects
- `gdd/09-campaign-structure.md` — enemy level scaling per stage/difficulty
- `gdd/10-tower-of-trials.md` — Tower difficulty progression
- `gdd/17-save-system.md` — deterministic seed for AI variability
- `gdd/22-boss-design.md` — boss-specific overrides

## 7. Tuning Knobs

- AI Tier breakpoints by level (currently `floor((level-1)/12)`)
- Deviation chances per tier (5% / 3% / 2%)
- Utility weights in Tier 4 targeting
- Hell-mode tier override (currently +1)
- Action probability tables per tier

## 8. Acceptance Criteria

1. ✅ Tier 0 enemies always basic-attack a random hero (testable)
2. ✅ Tier 2+ enemies target the lowest-HP hero with damage skills (testable)
3. ✅ Tier 4 enemies cast Ultimates only when meaningful (not on lone trash mob)
4. ✅ Bosses always run Tier 4 + boss rules regardless of level
5. ✅ Deviation roll is deterministic (same seed produces same deviation)
6. ✅ Hell mode applies Tier +1 to all enemies in the stage
7. ✅ Stunned enemies skip turn but tick cooldowns (testable)
8. ✅ Tier 3+ Mages prioritize highest-ATK target with debuffs
9. ✅ Healing enemies cleanse ally DEF Down at Tier 3+ (when available)
