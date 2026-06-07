# 4★ Roster — Designs TBD

> **Status:** User is producing 4★ hero designs separately. This file is a placeholder + design constraints reference.

## Quantity

**15 4★ heroes** planned for launch.

## Suggested element + class distribution

To mirror the 5★ roster cleanly, the recommended split is **one 4★ per element + class combination**:

| Element | Tank | Assassin | Archer | Mage | Support |
|---------|------|----------|--------|------|---------|
| 🔥 Fire | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD |
| 💧 Water | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD |
| 🌪 Wind | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD | 4★ TBD |

= 15 4★ heroes, one per cell.

(User may choose a different split — this is a recommendation only.)

## Mechanical role of 4★ heroes

Per `gdd/03-stats-and-progression.md` and `gdd/05-gacha-and-currencies.md`:

- 4★ heroes are obtainable from **Epic-tier gacha drops** (7.2% gacha rate).
- 4★ heroes drop from **Rare Egg** hatches (small chance).
- 4★ heroes drop from **Expedition rewards** at higher mission tiers.
- 4★ heroes are **valid combat heroes** — not just fodder. Use them in early/mid-game teams.
- 4★ heroes can be **promoted to 5★** via the standard fusion ladder (5 × 4★ + 50,000 Gold + Sacred Crystal × 30 + Pristine Element Crystal).
- 4★ → 5★ promotion via fusion produces a "generic" 5★ — not a *named* hero. (To get a named 5★, you must summon them.)

## Design constraints (when authoring 4★ sheets)

When the user provides 4★ designs, each sheet should follow the same template as 5★ but with these differences:

| Field | 5★ approach | 4★ approach |
|-------|-------------|-------------|
| Stat grades | Mix of S / A / B / C / D | Mostly A / B / C — no S grades except in their core stat |
| Passive | 5-stack passive with synergy | Simpler passive — single-condition trigger, fewer stacks |
| Skill multipliers | 1.5× / 2.2× / 3.5× | 1.3× / 1.9× / 3.0× (15-20% lower) |
| Ultimate complexity | Multi-effect bundles | Simpler, 1-2 effects |
| Chibi anims | Full unique set | Can share base attack archetype within class |
| Splash art | Unique per hero | Unique per hero |

## Naming considerations

- 4★ names should feel distinctive, not "lesser versions" of 5★ names.
- Each 4★ should have personality — they're not background characters.
- Consider: a 4★ might foreshadow a future 5★ via shared lore (e.g. "Apprentice of the Phoenix" → eventual 5★ "Master of the Phoenix").

## When to author full 4★ sheets

After user provides 4★ designs:
1. Create one `.md` file per 4★ hero in `design/heroes/4-star/`
2. Follow the same template as 5★ sheets (see `README.md` § Design Conventions)
3. Update master plan to reflect the named 4★ roster
4. Re-render PDF

## Open questions for 4★

When user provides designs, also confirm:

- Do 4★ heroes have splash art OR just hero cards?
- Do 4★ heroes appear in Hero Trials / Boss Rush?
- Can 4★ heroes go to Tower of Trials?
- Are 4★ heroes featured on Limited banners (as 4★ rate-up) or only on Standard?
