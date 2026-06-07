# GDD 22 — Boss Design (PLACEHOLDER)

> **Status:** PLACEHOLDER. User is finalizing boss themes / kits separately. This file holds the boss-slot structure and design constraints. Fill in each boss row when designs land.

## 1. Overview

12 chapter bosses + Tower of Trials phase bosses + Boss Rush gauntlet. Each chapter boss is the **defining encounter** of that chapter — the most memorable moment in the player's run.

## 2. Required per boss

When designing each boss, fill in:

- **Name** (e.g. "Embertongue Wyrm")
- **Title** (e.g. "Tyrant of the Crater")
- **Chapter** (1-12)
- **Element** (🔥 / 💧 / 🌪 / Neutral)
- **Visual theme** (3-5 lines)
- **HP scale** (relative to standard enemies — typically 5-10×)
- **2-4 unique skills** (cooldown, mechanic)
- **Signature mechanic** (the "thing" — e.g. "revives once at 50% HP", "every 4 turns spawns 2 adds")
- **Drop table** — promotion material, equipment set hint, first-clear bonus
- **Element resistance** (optional — some bosses are neutral, some have a counter-element)
- **Hell variant** (does the boss gain new mechanics on Hell, or just bigger numbers?)

## 3. Per-Act element guidance

Per `gdd/09-campaign-structure.md` § 3.2:

| Act | Theme | Suggested boss elements |
|-----|-------|--------------------------|
| Act 1 — Awakening | Forests, ruins | Mostly Wind + Neutral; final boss could be Wind-heavy |
| Act 2 — Ashes & Embers | Volcanic | Mostly Fire + Neutral; final boss is Fire |
| Act 3 — Tides & Frost | Sea + ice | Mostly Water + Neutral; final boss is Water |

## 4. Boss slot stubs (TO FILL)

### Act 1 — Awakening

| # | Chapter | Boss Name | Element | Theme | Status |
|---|---------|-----------|---------|-------|--------|
| 1 | 1 | _TBD_ | 🌪 Wind / Neutral | Forest guardian / first major foe | ⏳ Design pending |
| 2 | 2 | _TBD_ | 🌪 Wind | Beast lord | ⏳ Design pending |
| 3 | 3 | _TBD_ | Neutral | Fallen knight (story tone shift) | ⏳ Design pending |
| 4 | 4 | _TBD_ | 🌪 Wind | Wind drake / Act 1 climax | ⏳ Design pending |

### Act 2 — Ashes & Embers

| # | Chapter | Boss Name | Element | Theme | Status |
|---|---------|-----------|---------|-------|--------|
| 5 | 5 | _TBD_ | 🔥 Fire | Magma elemental / introduction | ⏳ Design pending |
| 6 | 6 | _TBD_ | 🔥 Fire | Ember tyrant | ⏳ Design pending |
| 7 | 7 | _TBD_ | 🔥 Fire | Phoenix scion (signature: revives once) | ⏳ Design pending |
| 8 | 8 | _TBD_ | 🔥 Fire | Crimson dragon / Act 2 climax | ⏳ Design pending |

### Act 3 — Tides & Frost

| # | Chapter | Boss Name | Element | Theme | Status |
|---|---------|-----------|---------|-------|--------|
| 9 | 9 | _TBD_ | 💧 Water | Tidal beast | ⏳ Design pending |
| 10 | 10 | _TBD_ | 💧 Water (ice-themed) | Frost giant | ⏳ Design pending |
| 11 | 11 | _TBD_ | 💧 Water | Abyssal kraken | ⏳ Design pending |
| 12 | 12 | _TBD_ | 💧 Water | Leviathan / final boss of campaign | ⏳ Design pending |

## 5. Common boss patterns to reuse (template library)

When designing bosses, mix-and-match from these proven patterns:

- **Phase shift** — boss has 3 HP phases (100→66%, 66→33%, 33→0%) with different attack patterns
- **Add summoning** — boss summons 2 minions every N turns
- **Damage gate** — boss is shielded until you break its shield within X turns
- **DPS check** — boss enrages at turn N (already in `gdd/01-combat.md` § 3.11)
- **Element shift** — boss changes element each phase (forces team flexibility)
- **Revive mechanic** — boss comes back once at 50% HP (e.g. Phoenix Scion)
- **AoE pulse** — boss does AoE every 3 turns; force player to bring sustain
- **Damage focus** — boss targets the highest-DPS hero in the party
- **Cleanse immunity** — boss debuffs can't be cleansed (forces resistance gear)
- **Heal-block** — heals on the team are reduced by 50% during boss fight

## 6. Tower of Trials phase bosses

Floors **10 / 20 / 30 / 40 / 50 / 60 / 70 / 80 / 90 / 100** are boss floors. These can reuse campaign bosses with intensified mechanics, OR be Tower-exclusive bosses.

- **Floors 10-50:** chapter boss variants (re-themed)
- **Floors 60-100:** Tower-exclusive bosses (final 5 should feel like raid-level encounters)

Floor 100 boss is THE flagship endgame encounter — should have a unique kit, custom art, custom music.

## 7. Boss-design constraints

- Must respect the **enrage timer** (`gdd/01-combat.md` § 3.11)
- Must be **scoutable** (`gdd/01-combat.md` § 3.16) — kit visible after first defeat
- Should be **counterable by 2+ team comps** (avoid hard-counter-only bosses)
- Should drop **predictable rewards** (players plan farm runs)
- Hell-mode variants must add **at least one new mechanic** — not just stats

## 8. Dependencies

- `gdd/01-combat.md` — combat engine, enrage system
- `gdd/09-campaign-structure.md` — chapter context
- `gdd/10-tower-of-trials.md` — Tower phase bosses
- `gdd/12-daily-weekly-loops.md` — Boss Rush uses campaign bosses
- Art direction (TBD) — boss aesthetic guard rails

## 9. Acceptance Criteria (once filled)

1. ⏳ All 12 chapter bosses have name + element + 2-4 skills + signature mechanic
2. ⏳ All 10 Tower phase bosses defined
3. ⏳ Hell-mode variants documented per boss
4. ⏳ Each boss has at least one "fair" counter team and one "ideal" counter team
5. ⏳ Drop tables specified
