# GDD 12 — Daily, Weekly, Hero Trials, Boss Rush, Achievements

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>The daily, weekly, and special endgame content loops keep the game **alive after the initial campaign clear**. Five sub-systems:

- **Daily Missions** (reset 04:00 local)
- **Weekly Missions** (reset Monday 04:00)
- **Login Bonus** (7-day rotating)
- **Hero Trials** (weekly single-hero showcase stages)
- **Boss Rush** (weekly chapter-bosses gauntlet)
- **Achievements** (permanent, one-time)</mark>

## 2. Player Fantasy

> *Every day has a checklist. Every week has a goal. Every level-up unlocks something to grind. The game never feels empty.*

## 3. Detailed Rules

### 3.1 Daily Missions (NEW)

<mark>

8 daily missions, with point totals. Hitting threshold milestones grants escalating rewards.

| Mission | Points |
|---------|--------|
| Clear 5 stages | 100 |
| Spend 1,000 Gold | 50 |
| Hatch 1 egg | 50 |
| Collect Shrine 1× | 50 |
| Dispatch 1 expedition | 50 |
| Perform 1 gacha pull (any banner) | 100 |
| Win a battle in <8 turns | 100 |
| Upgrade 1 skill | 75 |

**Total per day:** 575 points possible.

**Thresholds:**

| Points | Reward |
|--------|--------|
| 200 | 50 Gems |
| 400 | 100 Gems + 1 Common Egg |
| 575 (all complete) | 200 Gems + 1 Rare Egg + 1 Reroll Stone |

</mark>

### 3.2 Weekly Missions (NEW)

<mark>

6 weekly missions:

| Mission | Reward |
|---------|--------|
| Clear 50 stages (any difficulty) | 200 Gems |
| Clear 20 Hard+ stages | 400 Gems + 1 Sacred Stone |
| Defeat 5 chapter bosses | 1 Pristine Element Crystal |
| Complete 5 expeditions | 2 Sacred Stones + 100 Skill Stones |
| Reach Tower floor 25+ | 1 Apex Catalyst (only once per month; subsequent weekly clears give 50 Tower Coin) |
| Hatch 5 eggs | 1 Epic Egg |

</mark>

### 3.3 7-Day Login Bonus (NEW)

<mark>

| Day | Reward |
|-----|--------|
| 1 | 100 Gems |
| 2 | 1 Common Egg + 200 Gold |
| 3 | 5 Skill Stones |
| 4 | 1 Standard Summon Ticket |
| 5 | 1 Rare Egg |
| 6 | 10 Reroll Stones |
| 7 | **1 free Standard 5★ Hero pick** from the **Curated 6** (see below) |

The Day 7 reward exists ONCE per account; subsequent login streaks award a 7-day "Veteran" cycle that's smaller (50 Gems × 7) and resets every 7 days.

<mark>

#### Curated 6 — Free-pick hero pool

The Day 7 login bonus AND the Battle Pass Tier 50 free track reward share **the same Curated 6 list**:

| # | Hero | Element | Class | Why |
|---|------|---------|-------|-----|
| 1 | **Valdrik** | 🔥 Fire | Tank | Frontline anchor — pairs with Lyria's fragile back-line |
| 2 | **Glacier** | 💧 Water | Tank | Alternative Tank — Frost ecosystem starter |
| 3 | **Sylphie** | 🌪 Wind | Support | Premier healer — same-element synergy with Lyria |
| 4 | **Marina** | 💧 Water | Support | Alternative Support — sustain + cleanse |
| 5 | **Emberia** | 🔥 Fire | Mage | AoE wave-clear partner for single-target Lyria |
| 6 | **Kael** | 🌪 Wind | Assassin | Wind-team boss-killer pairing with Lyria |

**Lyria is excluded** — every player already owns her from the tutorial.

**Kaida and Neria are excluded** — they overlap roles with Kael (assassin) and Emberia (mage). Players who want them can still pull on Standard banner.

This list is curated for **starter team variety** — picking any of the 6 gives the player a complete 3-hero core alongside Lyria.

</mark>

</mark>

### 3.4 Hero Trials (NEW endgame mode)

<mark>

A **weekly rotating stage** built around a single hero. Each week, one of the available launch heroes is "featured" — the player can only bring that hero (plus optionally 1-2 partner heroes per trial design). <mark>At launch the rotation cycles through the 10 available heroes (9 Standard + Auron). As future Limited Banner heroes release, they automatically enter the rotation.</mark>

Each trial has 3 difficulty tiers (Bronze / Silver / Gold). Completing all three is the "Mastery" reward.

| Tier | Difficulty | Reward |
|------|------------|--------|
| Bronze | Easy — feature hero L40+ recommended | 50 Skill Stones, 1 Reroll Stone, 100 Gems |
| Silver | Medium — feature hero must be 4★+ | 100 Skill Stones, 2 Reroll Stones, 200 Gems |
| Gold | Hard — feature hero must be 5★+ | 1 Pristine Element Crystal (matching hero's element), 5 Hero Shards of the feature hero, 500 Gems |

**Rotation:** week N's featured hero = `availableHeroIndex[(N - 1) % availableHeroCount]`. Predictable rotation so players know when to "play their favorites." `availableHeroCount` = 10 at launch, grows as Limited Banner heroes release.

**Encourages:** building a deep roster (eventually every hero gets attention), and earning Hero Shards of specific heroes you may not own.

</mark>

### 3.5 Boss Rush (NEW endgame mode)

<mark>

A weekly mode where the player fights all 12 chapter bosses **in sequence** with a single party of 3 heroes. No team swaps. Cooldowns persist across boss fights (mostly — they reset between bosses).

| Bosses Cleared | Reward |
|----------------|--------|
| 4 (first quarter) | 1 Sacred Stone, 200 Gems |
| 8 (mid) | 1 Sacred Crystal, 1 Pristine Element Crystal (random), 1 Reroll Stone |
| 12 (full clear — Normal/Hard) | 500 Gems, 1 Mythic gear ticket, profile badge |
| 12 (full clear — **Nightmare**, monthly first-time only) | **1 Apex Catalyst** + 500 Gems + 1 Mythic gear ticket + profile badge |

**Difficulty tiers:** Normal / Hard / Nightmare (Hell unlocks post-launch). Each tier is its own clear; rewards stack.

Boss Rush resets every Monday with the weekly missions.

</mark>

### 3.6 Achievements (NEW)

<mark>

Permanent one-time goals. Categories:

| Category | Examples | Rewards |
|----------|----------|---------|
| Collection | "Own 5 unique heroes", "Own all currently-released 5★ heroes", "Awaken 1 hero to max", "Own all 15 4★ heroes" | Gems, Hero Shards |
| Combat | "Deal 1M damage in a single hit", "Survive 50 turns in one battle", "Crit 100×" | Gems, eggs |
| Progression | "Reach account L20", "Clear chapter 12 Hell", "3-star all stages chapter 1" | Storage expansion, Gems |
| Tower | "Reach floor 50", "Reach floor 100", "Top 100 in monthly leaderboard" | Cosmetics, Tower Coin |
| Boss Rush | "Full clear on Normal", "Full clear on Nightmare" | Gems, badge |
| Gacha | "1,000 lifetime pulls", "Pull a Legendary on a 10-pull batch" | Gems, dupe shop voucher |
| Exploration / Codex | "Defeat each enemy type once", "Discover all chapters" | Gems, profile titles |

Estimated ~150 achievements at launch. ~25 are "secret" (hidden until triggered).

</mark>

### 3.7 Codex / Hero Gallery / Bestiary (NEW)

<mark>

Three browse-only collections:

- **Hero Gallery:** all 15 5★ heroes (incl. ones you don't own — locked with silhouette). Future-banner heroes show as "Coming Soon" with a date estimate. 4★ heroes also displayed (when released). Tapping shows kit, splash, element, class. Used for wishlist research.
- **Bestiary:** every enemy encountered in campaign + Tower. Records kill count and drop rates observed.
- **Item Codex:** all gear types, sets, and their bonuses.

Codex completion is achievement-tied (see 3.6).

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Daily mission progress | additive points |
| Weekly mission reset | Monday 04:00 local timezone |
| Daily mission reset | 04:00 local timezone |
| Hero Trial week index | `floor((daysSinceLaunch + 0) / 7) % availableHeroCount` (10 at launch, grows over time) |
| Boss Rush reset | Monday 04:00 local |
| Login bonus pre-claim grace | last claim ≥ 4h ago in the same day |

## 5. Edge Cases

- **Daylight savings:** mission resets use UTC offset captured at first launch + DST adjustments.
- **Server time vs. local time:** local time used for resets (intentional, allows players to claim "their morning" instead of arbitrary UTC).
- **Login streak missed:** if a player misses a day, streak resets to Day 1 (no penalty, just no Day 7 5★ pick that week — they re-earn it after another 7).
- **Hero Trial featured hero is locked:** if the player doesn't own them, Hero Shards can be earned via Bronze/Silver tiers using the 1-2 partner allowed slots. Gold tier locked.
- **Boss Rush mid-clear: party wipe:** the run ends; rewards earned so far are kept. Re-attempt allowed same week with a fresh team.

## 6. Dependencies

- `01-combat.md` — battle execution
- `09-campaign-structure.md` — Boss Rush uses chapter bosses
- `10-tower-of-trials.md` — Achievements integrate with Tower milestones
- `13-battle-pass.md` — BP progress earned from daily/weekly missions
- `17-save-system.md` — reset scheduling, achievement state
- `20-ui-menus-tabs.md` — Achievement screen, Codex screen

## 7. Tuning Knobs

- Daily / weekly point thresholds (3.1, 3.2)
- Login bonus content (3.3)
- Hero Trial rotation order (3.4)
- Boss Rush milestone rewards (3.5)
- Achievement count and reward sizes (3.6)

## 8. Acceptance Criteria

1. ✅ <mark>8 daily missions tracked, points awarded correctly.</mark>
2. ✅ <mark>Daily mission rewards distribute at 200/400/575 points.</mark>
3. ✅ <mark>Weekly missions reset Monday 04:00 local.</mark>
4. ✅ <mark>Day-7 login bonus delivers a free Standard 5★ hero pick once per account.</mark>
5. ✅ <mark>Hero Trial rotates deterministically each week through all currently-released 5★ heroes (10 at launch, growing as banner heroes release).</mark>
6. ✅ <mark>Boss Rush 12-clear awards Apex Catalyst + Mythic ticket.</mark>
7. ✅ <mark>~150 achievements at launch, including hidden ones.</mark>
8. ✅ Codex / Bestiary tracks completion and unlocks rewards.
