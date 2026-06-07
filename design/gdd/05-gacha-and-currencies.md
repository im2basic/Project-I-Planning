# GDD 05 — Gacha & Currencies

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Project I uses a multi-currency gacha. Two banner types, two pity systems, three currencies, plus a Dupe Shop powered by Hero Essence. <mark>Adds: Pity Tracker UI, Wishlist system, Beginner Step-Up Banner (replaces flat discount), Free Daily Pull, Hero Shard exchange.</mark>

## 2. Player Fantasy

> *Pulls feel exciting because rare hits really happen — and even when they don't, the pity counter is visibly moving, the wishlist is closing in, and dupes are turning into Essence I can spend on a hero I actually want.*

## 3. Detailed Rules

### 3.1 Currencies

| Currency | Tier | Source | Use |
|----------|------|--------|-----|
| **Gold** | Progression | Stages, Shrine, dailies, idle | Level / promote / enhance |
| **Gems** | Free / paid soft | Quests, achievements, events, BP, paid packs | Buy Summon Tickets |
| **Crystals** | Paid only | Real-money purchases ONLY | Convert 1:1 to Gems; premium shop |
| **Summon Ticket** | Item | 160 Gems each | Single pull on a banner |
| **Hero Essence** | Dupe soft | Duplicate conversion past Awakening 6 | Dupe Shop |
| **Hero Shard** | Targeted dupe | <mark>Specific hero-shard drops from dupe conversion + monthly events</mark> | <mark>50 shards = 1 copy of a chosen Standard hero</mark> |

<mark>**Crystal → Gem conversion** is one-way. Once converted, the Gems cannot be re-converted to Crystals. This protects the Crystal-only shop economy.</mark>

### 3.2 Banner Types

#### Limited Character Banner
- 1 featured Legendary, 2-3 featured Epics
- Duration: 21 days
- After expiry: featured Legendary leaves rotation, eventually returns in reruns
- Rates: Legendary 0.6%, Epic 7.2%, Rare 92.2%
- <mark>**Hard pity only at 50 pulls.** No soft pity — the rate stays at 0.6% on every pull until the 50th, at which point a Legendary is guaranteed.</mark>
- Carries over to NEXT Limited banner (does not reset on banner end)
- <mark>**Launch Limited Banner: Auron** (Water Archer, Frostbound Bracer). Follow-up Limited Banners over the live-ops calendar: Ragnar → Akari → Seraphina → Mei Lin → Ayame.</mark>

#### Standard Banner
- Permanent
- All Standard-pool heroes
- Rates: same as Limited
- <mark>Hard pity only at 50 pulls (no soft pity).</mark>
- **Standard Selector** unlocks after 210 Standard pulls (one-time, free Standard 5★ pick)
- <mark>**Launch Standard pool: 9 heroes** — Valdrik, Emberia, Kaida, Glacier, Marina, Neria, Sylphie, Lyria, Kael. After a Limited Banner hero's second rerun, they may rotate into the Standard pool (post-launch decision).</mark>

#### Beginner Step-Up Banner (NEW)
<mark>

Replaces the source-PDF "first 50 pulls 20% off" with a structured step-up:

| Step | Pulls | Cost | Reward |
|------|-------|------|--------|
| 1 | 10 pulls | 1,200 Gems (was 1,600 — 25% off) | Guaranteed Epic+ in batch |
| 2 | 10 pulls | 1,400 Gems | Guaranteed Legendary in batch |
| 3 | 10 pulls | 1,600 Gems | Guaranteed Standard Selector unlock + 1 free Standard 5★ pick |

Available only to accounts ≤ 14 days old AND that haven't completed step 3 yet. Once step 3 is done, the banner disappears forever for that account.

**Pity isolation:** Step-Up Banner pulls have their **own pity counter** — they do NOT count toward Limited or Standard hard pity. The Step-2 guaranteed Legendary is a *bonus* on top of normal pity, not a consumption of it. This is intentional: it gives new players a strong first-week without burning their long-term pity counters.

Legendaries pulled on the Step-Up Banner ARE drawn from the **Standard Banner pool** (so Step 2's guaranteed Legendary is one of the 9 Standard heroes — not a Limited Banner hero).

</mark>

### 3.3 Pity Tracker UI (NEW)

<mark>

The Gacha screen always shows:

- <mark>Current pulls toward hard pity (e.g., "27/50") — single counter, no soft pity stage</mark>
- Standard Banner cumulative count (toward 210 Selector unlock)
- Time remaining on Limited banner (countdown)

A small "pity will carry over" banner shows on the last day of a Limited banner so players don't accidentally feel cheated.

</mark>

### 3.4 Wishlist System (NEW)

<mark>

In the Standard Banner UI, the player picks **3 Wishlist heroes** from the Standard pool. The hard-pity Legendary (every 50 pulls) is guaranteed to be **one of the wishlisted heroes** — random choice among the 3.

**Rules:**
- Wishlist edits are free, but locked for 24 hours after a save (prevents abuse).
- A hero that has reached max Awakening (6) is greyed out from the Wishlist — pulling them is wasteful.
- Standard Selector unlock (every 210 pulls) is also auto-filtered to suggest Wishlist heroes first.

This single feature is a huge F2P quality-of-life lever. Modern players expect it (Genshin / Star Rail set the standard).

</mark>

### 3.5 Free Daily Pull (NEW)

<mark>

Every 24 hours since last reset, the player gets **one free pull on the Standard Banner** (does not apply to Limited). Counts toward both Standard pity and Standard Selector (210). Cannot be saved up — must be claimed daily.

This is small but compounding: 365 free pulls / year. Big retention lever.

</mark>

### 3.6 Pull Types

| Type | Cost | Notes |
|------|------|-------|
| Single Pull | 1 ticket | Independent roll |
| 10-Pull | 10 tickets | Epic guarantee in batch (1 Epic minimum, can be higher) |

10-Pull pity progression is identical to 10 single pulls.

### 3.7 New Player Bonus (folded into Step-Up Banner)

The source-PDF "first 50 pulls 20% discount" is replaced by the **Beginner Step-Up Banner** (3.2). This is more impactful for players AND simpler to communicate.

Track flags:
- `beginnerStepUp.step1Complete: bool`
- `beginnerStepUp.step2Complete: bool`
- `beginnerStepUp.step3Complete: bool`

### 3.8 Duplicate Conversion + Hero Shards

<mark>

When a duplicate of a hero already at max Awakening (6) is pulled:

- The player receives **Hero Essence** (universal currency — see 3.1).
- The player **also** receives **Hero Shards specific to that hero**. 1 dupe = 5 Hero Shards.
- 50 Hero Shards = 1 copy of that hero (used for fusion, Awakening, fodder, or just unlocking heroes you haven't pulled).
- **Cross-conversion:** 50 Shards of any Standard hero can be exchanged for 50 Shards of any other Standard hero at a 2:1 cost (so 100 source → 50 target). Limited heroes cannot be cross-converted.

Why this matters: F2P players who never pull a specific hero can still slowly unlock them through Shard accumulation. Whales who over-pull get something useful for the next dupe instead of pure Essence.

</mark>

### 3.9 Dupe Shop (Essence Shop)

<mark>

A persistent shop using **Hero Essence** as the currency.

**Stock (refreshes weekly except where noted):**

| Item | Cost | Limit |
|------|------|-------|
| 10× Skill Stones | 500 Essence | 5/week |
| 1× Legendary EXP Crystal | 1,000 Essence | 3/week |
| 1× Sacred Stone | 2,000 Essence | 2/week |
| 1× Pristine Element Crystal (random element) | 5,000 Essence | 1/week |
| 1× Apex Catalyst | **100,000 Essence** | 1/month |
| 100× Hero Shards of a player-chosen Standard hero | 10,000 Essence | 2/month |
| 1× Mythic Reroll Stone | 8,000 Essence | 3/month |
| Cosmetic emote pack | 3,000 Essence | Permanent |

Tuning knob: cost values are adjustable post-launch via hot-config (see `gdd/21-liveops-and-telemetry.md`).

</mark>

### 3.10 Roll Algorithm

<mark>

```
1. Add 1 to pullCount for the banner
2. If hard pity hit (pullCount == 50): force Legendary roll
   Else: roll d(10000) against baseRate (0.6% Legendary / 7.2% Epic / 92.2% Rare)
3. If Legendary:
   - Limited banner: pick the featured Legendary
   - Standard banner:
     - If hard pity (pullCount == 50): pick from Wishlist (random among up to 3)
     - Else: weighted random from Standard pool
4. If Epic: weighted random from Epic pool
5. If Rare: weighted random from Rare pool
6. If Legendary acquired (any source): reset pullCount to 0 for this banner
7. Save state
```

**Rate stays flat at 0.6% Legendary on every pull until 50.** No soft-pity ramp.

</mark>

### 3.11 Account-Level Banner Data (save schema)

```json
{
  "gacha": {
    "limited": {
      "pullCount": 27,
      "guaranteed": true   // true if next Legendary is the featured one (Limited only)
    },
    "standard": {
      "totalPullCount": 184,
      "standardSelectorClaimed": false,
      "wishlist": ["valdrik", "lyria", "sylphie"],
      "wishlistLockedUntil": 1717612800
    },
    "freeDailyPull": {
      "lastClaimedAt": 1717526400
    },
    "beginnerStepUp": {
      "step1Complete": true,
      "step2Complete": false,
      "step3Complete": false
    },
    "essence": 23400,
    "heroShards": {
      "valdrik": 18,
      "kael": 50,
      "lyria": 6
    }
  }
}
```

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Pull rate | flat 0.6% Legendary / 7.2% Epic / 92.2% Rare on every pull |
| Hard pity guarantee | `pullCount == 50 → forced Legendary; pullCount resets to 0 on any Legendary pull` |
| Wishlist pull (Standard hard pity) | random uniform among up to 3 wishlist heroes |
| Cross-conversion cost | `50 source shards → 25 target shards` (2:1 ratio) |
| Essence from 7th+ duplicate | `100 × 1.1^(copy - 7)`, cap 200 (per GDD 03 § 3.4) |

## 5. Edge Cases

- **Pity carry-over on banner expiry** — Limited pity carries to NEXT Limited banner. Standard pity is permanent (never resets).
- **Wishlist edit during a banner run** — allowed; takes effect on the next hard-pity Legendary.
- **Wishlist hero pulled normally before hard pity** — counts as a normal Legendary pull. Pity resets. Wishlist will trigger on next hard pity unless that hero already maxed.
- **Wishlist hero hits Awakening 6** — they are auto-removed from Wishlist and a notice appears asking the player to pick another.
- **Free daily pull during step-up banner** — both can trigger same day. Free pull goes on Standard banner; step-up pull is independent.
- **Step-up pull while pity is high** — the step-up rewards (forced Epic/Legendary) override the pity-counter behavior for that pull only.

## 6. Dependencies

- `03-stats-and-progression.md` — Hero Essence, Awakening, Element Crystals
- `04-equipment.md` — Reroll Stones from Dupe Shop
- `14-monetization.md` — Crystal purchases, Beginner Pack
- `16-tutorial-onboarding.md` — Day-1 free pulls, Step-Up funnel
- `17-save-system.md` — banner state persisted across sessions
- `20-ui-menus-tabs.md` — Gacha screen layout, Pity Tracker

## 7. Tuning Knobs

- Hard pity threshold (currently 50; no soft pity)
- Standard Selector unlock count (currently 210)
- Wishlist size (currently 3)
- Free daily pull cadence (currently 24h)
- Hero Shard ratio (1 dupe = 5 shards; 50 = 1 copy)
- Cross-conversion ratio (currently 2:1)
- Beginner Step-Up step costs and rewards
- Dupe Shop costs and weekly limits

## 8. Acceptance Criteria

1. ✅ <mark>Pulling 50 times on Limited without hitting Legendary guarantees a Legendary on pull 50.</mark>
2. ✅ <mark>The Standard hard pity Legendary is one of the player's 3 wishlisted heroes if the wishlist is set.</mark>
3. ✅ <mark>**No soft pity:** Legendary rate stays at flat 0.6% on every pull until 50. Pull 50 is the only guaranteed Legendary.</mark>
3. ✅ Pity carries over to the next Limited banner.
4. ✅ <mark>Free daily pull awards exactly 1 Standard pull every 24 hours.</mark>
5. ✅ <mark>Beginner Step-Up Banner is hidden for accounts >14 days old.</mark>
6. ✅ <mark>Duplicate at Awakening 6 grants both Hero Essence and 5 Hero Shards.</mark>
7. ✅ 50 Hero Shards convert to 1 hero copy.
8. ✅ Crystal → Gem conversion is irreversible.
9. ✅ Wishlist cannot include max-Awakening heroes.
