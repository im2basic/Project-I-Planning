# GDD 10 — Tower of Trials

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>The **Tower of Trials** is a 100-floor endgame mode that resets monthly. Each floor is a fixed encounter that escalates in difficulty. Players use any 3 heroes from their roster (heroes lock between floors — can't reuse). Floors 1-20 are easy entry; 21-50 require build-craft; 51-80 require optimization; 81-100 are flex / wall-pushing endgame.</mark>

## 2. Player Fantasy

> *I built a deep roster for a reason. The Tower keeps asking me to bring out heroes I never use, climb a few more floors than last month, and prove the depth I've earned.*

## 3. Detailed Rules

### 3.1 Structure

<mark>

| Floor band | Difficulty | Reward focus |
|-----------|-----------|--------------|
| 1-10 | Tutorial — auto-clearable | Skill Stones, Gold, Tower Coin |
| 11-25 | Mid-build challenge | Sacred Stones, Tower Coin, gear |
| 26-50 | Optimization wall | Epic gear, Sacred Crystal, Pristine Element Crystal, Tower Coin |
| 51-80 | Advanced strategy | Legendary gear (forced sub-stat at floor 60), Reroll Stones, Apex Catalyst (1 at floor 70) |
| 81-100 | Endgame wall | Mythic gear, profile badges, monthly leaderboard ranking |

</mark>

### 3.2 Hero Lock Rule

<mark>

**Each hero used to clear a floor cannot be used on the next floor.**

Exception: every 10th floor (10, 20, 30, ...) is a "Rest Floor" — all heroes unlock and become usable again.

This forces depth-of-roster play. A player with only 3 strong heroes will struggle past floor 10. A player with 15 well-built heroes can sprint to floor 50+.

</mark>

### 3.3 Monthly Reset

<mark>

- Tower resets on the **1st of each month at 00:00 UTC**.
- Player's highest cleared floor is preserved as **personal best** (leaderboard cache).
- Per-floor rewards reset (so a player can re-climb the rewards).
- Boss floor (every 10th) cosmetic / one-time rewards are also re-earnable each month.

</mark>

### 3.4 Floor Modifiers

<mark>

Some floors apply **active modifiers** that change combat rules:

| Modifier | Effect | Example floor |
|----------|--------|---------------|
| Burning Ground | All combatants take 5% maxHP burn per turn | Floor 15 |
| Reverse Element | Element advantage becomes disadvantage (and vice versa) | Floor 28 |
| One-Hero Force | Only one hero in the party can act per turn (cycle) | Floor 35 |
| Ultimate Lockout | Ultimates disabled | Floor 47 |
| Crit-Only | Only critical hits deal damage; non-crits deal 1 | Floor 55 |
| Double Speed | All combatants act every turn (no gauge) | Floor 64 |
| Counter Field | All single-target attacks have 50% counter chance | Floor 73 |
| Boss Phase Shift | Boss has 3 HP phases with different element each | Floor 80, 90, 100 |

Mods are revealed in the floor scout panel before committing.

</mark>

### 3.5 Tower Coin (currency)

<mark>

Awarded for clearing floors. Sources:
- Floor first-clear: 10-150 Tower Coin (scales)
- Monthly milestone (every 10 floors): bonus Tower Coin
- Top-10% leaderboard (post-monthly close): bonus Tower Coin

**Tower Shop (Tower Coin-only):**

| Item | Cost | Limit (per month) |
|------|------|-------------------|
| Sacred Crystal | 50 | 5 |
| Apex Catalyst | 2,000 | 1 (1 per **Tower season** = 1 per monthly reset) |
| Reroll Stone | 100 | 10 |
| Pristine Element Crystal (chosen element) | 200 | 5 |
| Mythic gear ticket | 500 | 1 |
| Tower exclusive cosmetic | 1,000 | 1 |
| Skill Stones x100 | 50 | 5 |
| 10 × Hero Shards (chosen Standard hero) | 600 | 3 |

</mark>

### 3.6 Leaderboard

<mark>

- Visible to player: their personal rank within their server / region.
- No PvP combat — leaderboard is purely "highest floor cleared."
- Top 100 ranks earn end-of-month bonus rewards.
- Friends ranking visible if friends list exists (deferred to post-launch).
- Anti-cheat: max-floor claim is validated against server-side combat log (see `21-liveops-and-telemetry.md`).

</mark>

### 3.7 Tower UI

<mark>

- Vertical-scrolling 100-floor map (visually evocative — a literal tower silhouette)
- Current floor highlighted, prior cleared floors shown with checkmarks
- Heroes "used this run" panel — shows which heroes are locked for the next floor
- Rest Floor markers (10, 20, ...) clearly visible
- Modifier preview on each floor
- "Reset run" button (resets all hero locks, doesn't re-clear floors)

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Floor HP/ATK | `100 × (1 + 0.15 × floorNumber)` baseline; modifiers apply on top |
| Tower Coin per floor | `10 + 2 × floorNumber` |
| Monthly milestone (10-floor) bonus | `floor / 2 + 50` Tower Coin |
| Top-10% bonus | `100 × (rank percentile factor)` |

## 5. Edge Cases

- **All heroes used and no Rest Floor reached:** the player cannot proceed; must claim "Reset run" which un-locks heroes but doesn't unwind cleared floors.
- **Mid-floor crash / disconnect:** floor state is saved at start; current floor restarts on relaunch.
- **Monthly reset during active run:** player's progress carries forward; rewards already claimed don't re-grant.
- **Hero deleted mid-tower (via sale or fusion):** they are removed from the run team if used. If used on a current locked floor, the lock entry persists (treated as locked but unusable).
- **Modifier conflicts with hero passive:** modifier always wins (e.g., Ultimate Lockout disables even Akari's Phoenix Festival).

## 6. Dependencies

- `01-combat.md` — combat engine
- `02-elements-and-classes.md` — element matchups
- `03-stats-and-progression.md` — hero stat baselines
- `09-campaign-structure.md` — drops align with campaign tier; Apex Catalyst overlap
- `17-save-system.md` — monthly reset, leaderboard persistence
- `21-liveops-and-telemetry.md` — anti-cheat validation

## 7. Tuning Knobs

- Floor HP/ATK scaling coefficient (currently 0.15)
- Tower Coin reward formula
- Modifier assignment per floor
- Tower Shop costs and weekly limits
- Hero lock rule (Rest Floor cadence)

## 8. Acceptance Criteria

1. ✅ <mark>100 floors are populated with mod and difficulty at launch.</mark>
2. ✅ <mark>Hero lock rule enforces no-reuse between floors except at Rest Floors.</mark>
3. ✅ <mark>Monthly reset clears floor rewards but preserves leaderboard.</mark>
4. ✅ <mark>Tower Coin balance and shop limits work per the table.</mark>
5. ✅ <mark>Modifier effects apply correctly (testable on Floor 15 Burning Ground, etc.).</mark>
6. ✅ <mark>Leaderboard top-10% rewards distribute on monthly close.</mark>
