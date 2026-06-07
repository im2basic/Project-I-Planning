# GDD 16 — Tutorial & Onboarding

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>9-stage scripted onboarding flow. Designed for **reroll-friendly speed** — a player can reach the guaranteed Legendary in under 25 minutes. No real-money pressure for the first 7 days. Each stage introduces exactly one new system.</mark>

## 2. Player Fantasy

> *In 20 minutes I went from "what's this?" to "I love this team, I want to keep building." Nothing felt forced; everything I unlocked felt earned.*

## 3. Detailed Rules

### 3.1 Tutorial Sequence

<mark>

| Stage | Subject | Time | Mechanics introduced |
|-------|---------|------|----------------------|
| 1 | First Battle | 2 min | Combat basics, Speed, basic attack, Skill 1 |
| 2 | Element Triangle | 2 min | Element advantage, Skill 2 cast |
| 3 | Ultimate & Defend | 3 min | Ultimate use, Defend action |
| 4 | Idle Rewards Intro | 3 min | Idle accumulation explained, Shrine intro |
| 5 | **First Gacha — Guaranteed Lyria** | 3 min | Pull animation, gacha currency, pity tease. **First 10-pull is scripted: Lyria is guaranteed to appear.** Lyria is the **main character** — every player gets her as their starter. |
| 6 | Level & Promote | 5 min | EXP crystals, leveling, promotion (1★→2★ tutorial fodder provided) |
| 7 | Equipment | 4 min | Equip first piece of gear, sub-stats explained, set bonus highlight |
| 8 | Compact Mode Intro | 1 min | Switch to compact, idle reward demo |
| 9 | Daily / Weekly / BP / Tower / Expedition unlock teaser | 3 min | Brief tour of the meta game, all systems unlocked |

**Total tutorial time:** ~26 minutes for a thorough first run.

</mark>

### 3.2 Reroll-Friendly Pacing

<mark>

- Tutorial 5★ is **guaranteed**.
- Day-1 free gems = ~3,000 (enough for ~18 pulls). Combined with tutorial = ~30 pull equivalents.
- Account reset is fast: settings → "Reset tutorial / start fresh" → re-tutorial in 20 min.
- This makes reroll the genre-standard 20-30 min loop. Don't fight it; embrace it.

</mark>

### 3.3 Onboarding Sequence

<mark>

**Day 0 (first session):**
- Tutorial → Beginner Step-Up Banner Step 1 unlock → Day 1 login bonus
- Account L5 unlock: Inventory expansion +20

**Day 1-3:**
- Daily missions introduced (Day 1 reward)
- 7-day login streak active
- Hatchery unlocked (Day 1)
- Expedition unlocked (Day 2)
- Tower of Trials introduced (Day 3, account L10 gate)

**Day 4-7:**
- Battle Pass introduced (Day 4)
- Hero Trials introduced (Day 5)
- Boss Rush introduced (Day 7)

**Day 7 login bonus:** the free Standard 5★ pick.

**Day 14:** Beginner Step-Up Banner expires.

</mark>

### 3.4 First-Time-User Hints

<mark>

Inline hint tooltips appear once per system on first use:

- "Tap a hero to see their detail screen!"
- "Sort options are in the filter dropdown!"
- "Skill cooldowns reset between stages."
- "Set bonuses activate at 2 or 4 pieces."
- "Hero Trials reward Hero Shards — collect 50 to unlock a hero!"
- "Pity carries over. Don't reset, it's tracked across banners!"

All hints can be **dismissed** and never re-shown. Bypass available via "Reset Tutorials" in settings.

</mark>

### 3.5 Tutorial UI

<mark>

- Modal overlay with pulsing "next" button.
- "Skip Tutorial" button surfaces only after stage 3 (no skip in the first 3 stages — critical for ensuring players understand combat).
- "Replay Tutorial" available in settings → Account.
- Localized text for all hint strings (per `gdd/19-localization-plan.md`).

</mark>

### 3.6 First Hero — Lyria (Main Character)

<mark>

**Lyria is the main character and starter hero — every player receives her at Stage 5 of the tutorial.** No choice / no reroll-pick. Lyria's tutorial moment is scripted to feel celebratory: full splash art, name reveal, kit-tour modal.

After Lyria is added, the tutorial auto-builds a starter team:
- **Lyria** (Wind Archer — primary DPS)
- **Sylphie** (Wind Support — partner; granted as a 3★ promotable to 4★ via tutorial fodder)
- **Valdrik** (Fire Tank — partner; granted as a 3★ promotable to 4★)

The two 3★ partner units exist so the player has a functioning party immediately. The player can replace them with summoned heroes as soon as they pull better options.

**Why no choice?** Project I uses Lyria as its mascot / identity. Letting players reroll past her dilutes that identity. Players who want a different starter can still pull on the Beginner Step-Up Banner (3.3) which gives ~2 additional Legendaries quickly.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Total day-1 reachable gem count | ~3,000 (gives ~18 pulls) |
| Guaranteed Legendary timing | Stage 5 of 9 |
| Beginner Step-Up Banner expiry | account day 14 |

## 5. Edge Cases

- **Tutorial interrupted:** state saves at each step; resume on next launch.
- **Tutorial skipped after stage 3:** the player can still earn Day 1 rewards normally; only the in-game guided experience is shorter.
- **Tutorial reset after major progress:** confirmation modal explicitly warns about gem / Gold loss. Reset does NOT refund Crystals.
- **Reroll account creation:** new account = clean state. Old account on same Steam ID may not be reusable (post-launch policy).

## 6. Dependencies

- `01-combat.md` — tutorial uses simplified combat
- `05-gacha-and-currencies.md` — Step-Up Banner, free pulls
- `06-idle-and-shrine.md` — Shrine introduction in stage 4
- `12-daily-weekly-loops.md` — login bonus, daily missions
- `13-battle-pass.md` — BP introduction in day 4
- `19-localization-plan.md` — tutorial strings

## 7. Tuning Knobs

- Tutorial stage count (currently 9)
- Tutorial total time (target 26 min)
- Day-1 gem allowance (~3,000)
- Hero choice for starter pick (3.6 list)
- Hint trigger system

## 8. Acceptance Criteria

1. ✅ <mark>Tutorial completes in under 30 minutes (95% of players).</mark>
2. ✅ <mark>Tutorial stage 5 awards Lyria as the guaranteed starter Legendary (no choice).</mark>
3. ✅ <mark>Sylphie and Valdrik are granted as 3★ partner units so player has a functioning starter team.</mark>
4. ✅ Day-1 free gems total at least 3,000.
5. ✅ <mark>Tutorial can be reset from settings; resetting does NOT refund Crystals.</mark>
6. ✅ <mark>All hints can be dismissed permanently.</mark>
