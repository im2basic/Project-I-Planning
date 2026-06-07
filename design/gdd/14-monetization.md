# GDD 14 — Monetization

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>Standard gacha monetization. F2P-friendly progression with paid skip / convenience / chase mechanics. **All monetization is optional** — no progression is gated permanently behind paywall.</mark>

## 2. Player Fantasy

> *I can earn everything for free if I play enough. But $5 a month makes the grind kinder, and one-time $20-$30 packs let me chase a hero I really want without going broke.*

## 3. Detailed Rules

### 3.1 Pricing Tiers

<mark>

| Item | Price | Description |
|------|-------|-------------|
| Pebble Crystal Pack | $0.99 | 100 Crystals |
| Small Crystal Pack | $4.99 | 550 Crystals (10% bonus) |
| Medium Crystal Pack | $9.99 | 1,150 Crystals (15% bonus) |
| Large Crystal Pack | $19.99 | 2,400 Crystals (20% bonus) |
| Mega Crystal Pack | $49.99 | 6,300 Crystals (25% bonus) |
| Ultra Crystal Pack | $99.99 | 13,500 Crystals (35% bonus) |

</mark>

### 3.2 Monthly Card

<mark>

**Price:** $4.99 / month

**Day-of purchase:** 600 Crystals immediately

**Daily for 30 days:** 100 Crystals daily login bonus (3,000 total over 30 days = 3,600 Crystals total value).

**Plus extras:**
- +1 expedition slot active for 30 days
- +2 daily summon ticket purchases at half-price
- Monthly badge

**Player perception:** $5/month for ~$25 of value over the month. Very high LTV stickiness.

</mark>

### 3.3 Beginner Pack

<mark>

**Available:** account ≤ 14 days old. One-time purchase.

**Price:** $4.99

**Contents:**
- 600 Crystals
- 5 Limited Banner Tickets
- 1 Standard 5★ select pick (from curated 6-hero list)
- 1 BP Premium Track activation (current season only)
- 5 Reroll Stones

**Value:** ~$40 of in-game content for $4.99. Strong conversion lever for new players.

</mark>

### 3.4 Limited Banner Bundles

<mark>

For each Limited Banner, a featured bundle is available:

**Featured Hero Starter Bundle ($14.99):**
- 800 Crystals
- 10 Limited Banner Tickets
- 50 Skill Stones
- 1 Reroll Stone

**Featured Hero Power Bundle ($29.99):**
- 1,800 Crystals
- 30 Limited Banner Tickets
- 1 Apex Catalyst
- 10 Reroll Stones
- 1 Pristine Element Crystal

</mark>

### 3.5 Dupe Shop

Already documented in `gdd/05-gacha-and-currencies.md` § 3.9.

### 3.6 Storage Expansion (recap)

Crystals-based per `gdd/08-inventory-and-storage.md`. NOT a primary monetization driver.

### 3.7 Cosmetics (no-pay-to-win)

<mark>

Cosmetics are PURE vanity — no stat impact:

| Type | Source | Description |
|------|--------|-------------|
| Avatar frames | BP, Tower, Achievements, paid bundles | Around player avatar |
| Profile titles | Achievements, BP, events | Display in profile |
| Hero costumes (post-launch) | Premium shop, events | Alternate hero skins; cosmetic only |
| Compact window themes | Premium shop ($1.99 each) | Different visual frames for the desktop window |
| Animated emotes | Events, BP, Dupe Shop | UI flair |

</mark>

### 3.8 ARPU Targets (industry-standard reference)

<mark>

| Metric | Target |
|--------|--------|
| D1 conversion rate (any spend) | 2-3% |
| D7 conversion rate | 4-5% |
| D30 conversion rate | 6-8% |
| Average ARPU (lifetime, paying) | $30-60 |
| Average ARPU (whale, top 5%) | $300+ |
| Median ARPU (all paying) | $15-25 |
| % of revenue from BP + Monthly | ~40% (steady, predictable revenue) |
| % from Limited Banner bundles | ~35% (spiky, event-driven) |
| % from Crystal packs | ~20% |
| % from cosmetics + misc | ~5% |

Targets based on Epic Seven / AFK Arena benchmarks. Project I's PC-only audience may skew older / higher ARPU.

</mark>

### 3.9 Anti-Predatory Principles

<mark>

Project I will NOT use:
- **Energy / stamina gates** — no waiting walls
- **Power creep treadmills** — old heroes remain viable
- **Misleading bundle math** — actual rewards always exceed sticker price
- **Sub-100% guaranteed pity** — pity is real
- **FOMO-driven daily timers on monetization** — only on content (events, BP)
- **Loot boxes with cash purchase** — gacha is gem-currency, not direct cash
- **Mystery boxes** — no "mystery" purchases
- **Pay-to-skip gear grinds** — sub-stat rerolls cost RNG-currency, not cash

These constraints define the "fair gacha" brand for Project I.

</mark>

### 3.10 Refund Policy

<mark>

- **Steam:** standard 2h / 14-day Steam refund policy applies.
- **In-game currency / gacha pulls:** non-refundable once consumed.
- **Cosmetics:** non-refundable.
- **Battle Pass:** refundable within 24h of purchase IF no premium rewards have been claimed.

Customer support response time target: 48h for billing issues, 7 days for non-billing.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Crystal-to-Gem conversion | 1 Crystal = 1 Gem (one-way) |
| Daily Monthly Card payout | 100 Crystals × 30 days |
| Bundle "value" calculation | Sum of in-game-equivalent prices ÷ bundle price |
| BP daily milestone XP | per `gdd/13-battle-pass.md` |

## 5. Edge Cases

- **Crystals purchased + then game shuts down:** Steam handles refund; in-game Crystals are restored if refund issued.
- **Monthly Card 30-day countdown:** counts real-world days, not active play days. If player doesn't login for 5 days, they lose 5 of 30 daily Crystals.
- **Limited Banner bundles after banner ends:** the Limited Tickets persist but cannot be used (no active Limited banner). They remain in inventory for the next Limited banner.
- **Beginner Pack purchased on account day 14:** allowed (up to and including day 14).
- **Refund of BP after rewards claimed:** denied. UI surfaces this clearly before purchase.

## 6. Dependencies

- `05-gacha-and-currencies.md` — Crystal / Gem economy
- `13-battle-pass.md` — BP pricing
- `21-liveops-and-telemetry.md` — IAP receipt validation
- `17-save-system.md` — purchase history persistence
- `20-ui-menus-tabs.md` — Shop screen

## 7. Tuning Knobs

- All prices (3.1–3.4)
- Daily monthly card payout (3.2)
- Bundle contents (3.4)
- Cosmetic prices (3.7)
- ARPU targets (3.8) — analytics calibration

## 8. Acceptance Criteria

1. ✅ Crystal packs deliver the documented quantities.
2. ✅ <mark>Monthly Card delivers 100 Crystals/day for 30 days post-purchase.</mark>
3. ✅ <mark>Beginner Pack is hidden after 14 days OR after purchase.</mark>
4. ✅ Limited Banner Bundles are available only while a Limited banner is active.
5. ✅ <mark>All purchases route through Steam IAP and validate receipts (see `21-liveops-and-telemetry.md`).</mark>
6. ✅ Refund flows match documented policy.
7. ✅ <mark>No content is permanently gated behind paywall (every Premium item is eventually available via free progression or future Standard banner).</mark>
