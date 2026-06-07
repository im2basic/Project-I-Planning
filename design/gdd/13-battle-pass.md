# GDD 13 — Battle Pass

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>The Battle Pass is a 50-tier seasonal progression track. **Free Track** for everyone, **Premium Track** unlocked by paying ($9.99), **Premium-Plus** for whales ($19.99 — includes +10 tier skips + exclusive cosmetics). 60-day season. Tiers earned via campaign play, dailies, weeklies, gacha pulls, achievements.</mark>

## 2. Player Fantasy

> *Every battle, every pull, every dailies completion makes my Battle Pass meter creep up. By season's end, I've earned a hero I'd otherwise have to pull for — and I never felt forced.*

## 3. Detailed Rules

### 3.1 Season Cycle

<mark>

| Element | Value |
|---------|-------|
| Season length | 60 days |
| Total tiers | 50 |
| Free Track | Always available |
| Premium Track | $9.99 unlock |
| Premium-Plus | $19.99 (+10 tier skips + exclusive title/avatar) |
| Mid-season tier purchase | $0.99 per tier (caps at 5 purchases per season) |
| End-of-season grace | 7 days to claim missed rewards |

</mark>

### 3.2 BP XP Sources

| Source | XP |
|--------|----|
| Daily mission completion (per category) | 50 each |
| Daily 575-point milestone | +200 |
| Weekly mission complete | 500 each |
| Chapter boss first-clear | 1,000 |
| Tower floor 25 clear | 500 |
| Tower floor 50 clear | 1,000 |
| Hero Trial Gold clear | 750 |
| Boss Rush full clear | 1,500 |
| Achievement unlock | 250 each |
| Gacha pull | 5 XP per pull |

<mark>**Tier XP cost:** flat **1,500 XP per tier** (so 50 tiers × 1,500 = **75,000 XP per season**). Tuned so committed daily players hit tier 50 around day 45-55 of a 60-day season — leaves comfortable margin without trivializing the climb. Casual players reach ~tier 35-40, still getting most of the Free Track value.</mark>

### 3.3 Free Track Rewards (sample)

| Tier | Reward |
|------|--------|
| 1 | 100 Gems |
| 5 | 1 Common Egg |
| 10 | 1 Standard Summon Ticket |
| 15 | 50 Skill Stones |
| 20 | 1 Sacred Stone |
| 25 | 40 Free Inventory Slots |
| 30 | 1 Standard Summon Ticket |
| 35 | 100 Gems |
| 40 | 1 Rare Egg |
| 45 | 200 Gems |
| 50 | 1 free Standard 5★ Hero pick from the **Curated 6** (see `gdd/12-daily-weekly-loops.md` § 3.3 — same list as Day 7 login bonus) |

### 3.4 Premium Track Rewards (sample, in addition to free track)

| Tier | Reward |
|------|--------|
| 1 | 200 Crystals + Premium Badge |
| 5 | 1 Limited Summon Ticket |
| 10 | 1 Pristine Element Crystal |
| 15 | 1 Reroll Stone × 5 |
| 20 | 200 Crystals |
| 25 | 1 Apex Catalyst |
| 30 | 1 Limited Summon Ticket |
| 35 | 1 Mythic gear ticket |
| 40 | <mark>**BP-exclusive Cosmetic Skin (TBD)** — applies to one Standard hero per season. Season 1 hero / design is TBD. Returns as a paid-shop cosmetic 1 season later for players who missed it.</mark> |
| 45 | 5 Limited Summon Tickets |
| 50 | 1 BP-exclusive cosmetic (Avatar + Animated Frame) + 500 Crystals |

<mark>Premium Track recoup: ~$9.99 of value delivered in Crystals + Limited Tickets, plus the BP-exclusive hero and cosmetic. Strong value proposition.</mark>

### 3.5 Premium-Plus Bonuses

<mark>

- Unlocks Premium Track + grants +10 instant tier skips
- Exclusive title displayed in profile + chat (post-launch)
- Exclusive animated avatar frame
- Exclusive emote pack
- One-time bonus: 1 free Pristine Element Crystal at season start + 500 Crystals

</mark>

### 3.6 BP-Exclusive Skin (replaces "BP Hero" design)

<mark>

Each season's BP includes a unique **BP-exclusive Cosmetic Skin** at Premium Tier 40. This skin:
- Applies to one specific Standard hero (which hero rotates per season — Season 1 TBD)
- Is purely cosmetic — no stat impact
- Available ONLY through that season's Premium BP at launch
- Returns as a paid-shop cosmetic ONE season later for players who missed it (so the BP holder retains exclusivity for ~60 days)

This pattern (cosmetic-only BP exclusive) is safer than a BP-exclusive hero — F2P players are not locked out of meta-power, and the cosmetic feels valuable. Worse player perception risk of "pay to win" → zero.

**Season 1 skin: TBD** — to be designed before launch.

</mark>

### 3.7 BP UI

<mark>

- Horizontal scrolling row showing all 50 tiers
- Current tier highlighted; XP progress bar to next tier
- Toggle: Free Track / Premium Track / Premium-Plus
- Lock icons on Premium rewards if not purchased
- "Buy Premium" CTA always visible
- Tier-skip buy button per tier
- "Claim all" button if multiple rewards uncollected

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| BP XP needed per tier | flat **1,500** (75,000 total per 50-tier season) |
| Tier skip cost | $0.99 per tier, max 5 purchases |
| End-of-season grace | 7 days |
| BP-exclusive hero re-release | next season's Standard pool addition |

## 5. Edge Cases

- **Mid-season Premium upgrade:** player who buys Premium at tier 30 retroactively unlocks all tier 1-30 Premium rewards.
- **Premium purchased on last day:** all unlockable rewards delivered to mailbox immediately for claim within grace period.
- **Tier skip purchase when at tier 50:** rejected with refund (or simply disabled in UI).
- **BP XP earned past tier 50:** capped (no carryover into next season).
- **BP hero already owned via re-release:** no duplicate; conversion to Hero Essence + 5 Hero Shards (per `gdd/05-gacha-and-currencies.md`).

## 6. Dependencies

- `05-gacha-and-currencies.md` — Crystals, Limited Tickets, BP-exclusive hero
- `12-daily-weekly-loops.md` — XP sources from missions
- `14-monetization.md` — pricing
- `17-save-system.md` — BP state persistence across seasons
- `20-ui-menus-tabs.md` — BP screen

## 7. Tuning Knobs

- Season length (60 days)
- Tier count (50)
- Premium price ($9.99)
- Premium-Plus price ($19.99)
- Tier-skip price ($0.99, max 5)
- XP per source / XP per tier
- Reward content per tier

## 8. Acceptance Criteria

1. ✅ <mark>50-tier BP completes in ~45-55 days of daily play (75% engagement) within the 60-day season.</mark>
2. ✅ Premium track rewards backfill correctly when purchased mid-season.
3. ✅ Free-track Tier 50 grants 1 Standard 5★ choice.
4. ✅ <mark>BP-exclusive skin is available ONLY via Premium Tier 40.</mark>
5. ✅ <mark>Following season makes the prior BP skin available in the paid cosmetics shop.</mark>
6. ✅ <mark>Grace period of 7 days post-season allows reward claim.</mark>
