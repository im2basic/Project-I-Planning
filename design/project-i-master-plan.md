# Project I — Master Design Plan

> **Status:** Pre-production planning → **vertical slice in code** (all core systems implemented & unit-tested; see § 4A), June 2026
> **Engine:** Unity (target Windows PC; macOS post-launch)
> **Genre:** Idle Gacha Turn-Based Hero Collector RPG
> **Window paradigm:** Desktop / Taskbar (TBH-inspired)
> **Source PDF:** `/Users/tata/Downloads/Project I.pdf` (208 pages)
>
> Yellow `<mark>` highlights mark every addition, change, or clarification vs. the source PDF. See [`CHANGELOG-from-source-PDF.md`](./CHANGELOG-from-source-PDF.md) for the full index.

---

## 1. Vision

Project I is a **desktop idle gacha** that sits in the corner of your screen while you work, fighting battles, hatching eggs, collecting loot — and that you can open whenever you want to deep-dive into team-building, gear crafting, and gacha pulls. The combat is **auto-paced turn-based**: heroes act in Speed order using cooldown-gated skills. <mark>Auto mode is the default; manual mode is an opt-in toggle for players who want to lean into hard content.</mark>

The closest reference is TBH: Task Bar Hero (desktop format) crossed with Epic Seven (combat depth) crossed with AFK Arena (idle progression). It is **single-player only** — no PvP, no guilds, no co-op.

<mark>**Free-to-play with standard gacha monetization:** Battle Pass, Monthly Card, Limited Banner bundles, Beginner Pack, Crystal packs, Dupe Shop. No pay-to-win, no power-creep treadmills, no energy gates.</mark>

## 2. Core Pillars

| Pillar | Description |
|--------|-------------|
| **Idle First** | The game makes meaningful progress while you're not playing. Active play accelerates, never replaces, idle. |
| **Desktop-Native** | Compact, peripheral, always-visible window is the identity. Expanded mode is only for management. |
| **Deep Collection** | 15 5★ launch heroes + 15 4★ planned × 5 progression axes (Level, Star, Awakening, Skills, Gear) = years of growth. |
| **Fair Gacha** | Visible pity, Wishlist, free daily pull, generous tutorial rewards, Hero Shards as anti-bricked-pull insurance. |
| **No Predatory Hooks** | No stamina, no power creep, no FOMO-laced cash purchases. Real value, transparent pricing. |
| **Accessibility-Mindful** | Color blind, high contrast, text scaling, reduce motion shipped at launch. Screen reader phase 2. |

## 3. Top-Level System Map

```
┌─────────────────────────────────────────────────────────────┐
│                       PROJECT I                              │
│                                                              │
│  ┌────────┐    ┌────────┐    ┌────────┐    ┌────────┐       │
│  │ Combat │←→  │  Idle  │←→  │ Gacha  │←→  │ Heroes │       │
│  │ (01)   │    │   +    │    │   +    │    │   +    │       │
│  │        │    │ Shrine │    │ Curr.  │    │ Equip  │       │
│  │        │    │  (06)  │    │ (05)   │    │ (03,04)│       │
│  └────────┘    └────────┘    └────────┘    └────────┘       │
│       ↓             ↓             ↓             ↓            │
│  ┌────────┐    ┌────────┐    ┌────────┐    ┌────────┐       │
│  │Campaign│    │ Eggs + │    │   BP   │    │ Tower  │       │
│  │  (09)  │    │ Fusion │    │ (13)   │    │  (10)  │       │
│  │        │    │  (07)  │    │        │    │        │       │
│  └────────┘    └────────┘    └────────┘    └────────┘       │
│                                                              │
│  ┌──────────────┐    ┌──────────────┐                       │
│  │  Expedition  │    │  Daily/Wk/   │                       │
│  │  World Map   │    │  Hero Trial/ │                       │
│  │     (11)     │    │  Boss Rush   │                       │
│  │              │    │     (12)     │                       │
│  └──────────────┘    └──────────────┘                       │
│                                                              │
│  Cross-cutting: UI (20), Desktop Window (15), Tutorial (16) │
│                Save (17), Audio (18), Localization (19),     │
│                Monetization (14), Live-ops (21)              │
└─────────────────────────────────────────────────────────────┘
```

## 4. Documents Index

### Core gameplay systems

| # | Doc | Topic |
|---|-----|-------|
| 01 | [Combat](./gdd/01-combat.md) | Turn order, damage formula, auto-AI, formation, KO, buffs, retry, difficulty, enrage |
| 02 | [Elements & Classes](./gdd/02-elements-and-classes.md) | 3-element triangle, 5 classes, weapon archetypes |
| 03 | [Stats & Progression](./gdd/03-stats-and-progression.md) | 7 core stats, Level, Star, Awakening, Skill Level, Promotion materials |
| 04 | [Equipment](./gdd/04-equipment.md) | Slots, sub-stats, set bonuses, enhancement, salvage, reroll |
| 05 | [Gacha & Currencies](./gdd/05-gacha-and-currencies.md) | Banners, pity, currencies, wishlist, free daily pull, Step-Up |
| 06 | [Idle & Shrine](./gdd/06-idle-and-shrine.md) | Idle rewards, offline simulation, Shrine, idle stage picker, ROI |
| 07 | [Eggs & Fusion](./gdd/07-eggs-and-fusion.md) | Egg tiers, Hatchery, fusion ladder |
| 08 | [Inventory & Storage](./gdd/08-inventory-and-storage.md) | Character + item storage, lock/favorite, filters, bulk select |

### Content & endgame

| # | Doc | Topic |
|---|-----|-------|
| 09 | [Campaign Structure](./gdd/09-campaign-structure.md) | 3 Acts × 4 Chapters × 10 Stages × 4 Difficulties, 3-star, first-clear rewards, featured chapter |
| 10 | [Tower of Trials](./gdd/10-tower-of-trials.md) | 100-floor monthly mode with hero locks and modifiers |
| 11 | [World Map / Expedition](./gdd/11-world-map-expedition.md) | 4 dispatch slots, mission rotation, crew bonuses |
| 12 | [Daily / Weekly / Hero Trials / Boss Rush / Achievements](./gdd/12-daily-weekly-loops.md) | Recurring content, login bonus, ~150 achievements |

### Monetization & meta

| # | Doc | Topic |
|---|-----|-------|
| 13 | [Battle Pass](./gdd/13-battle-pass.md) | 50 tiers, 60-day cycle, Free + Premium + Premium-Plus, BP-exclusive hero |
| 14 | [Monetization](./gdd/14-monetization.md) | Crystal packs, Monthly Card, Beginner Pack, Bundles, Dupe Shop, ARPU targets |

### Platform / production

| # | Doc | Topic |
|---|-----|-------|
| 15 | [Desktop Window UX](./gdd/15-desktop-window-ux.md) | Compact/Expanded/Tray, hotkeys, 9 settings sub-tabs, accessibility, multi-monitor |
| 16 | [Tutorial / Onboarding](./gdd/16-tutorial-onboarding.md) | 9-stage flow, guaranteed Legendary, reroll-friendly, day-by-day onboarding |
| 17 | [Save System](./gdd/17-save-system.md) | Local + Steam Cloud, deterministic idle, tamper-resistance |
| 18 | [Audio Direction](./gdd/18-audio-direction.md) | SFX taxonomy, music cues, mixing bus, no VO v1 |
| 19 | [Localization Plan](./gdd/19-localization-plan.md) | String tables, EN v1, CJK + EU expansion architecture |
| 20 | [UI / Menus / Tabs](./gdd/20-ui-menus-tabs.md) | 14 top-level tabs, Mail/Inbox, Codex, Achievements |
| 21 | [Live-ops / Telemetry / Security](./gdd/21-liveops-and-telemetry.md) | Hot-config, event calendar, telemetry, anti-cheat, IAP receipts |
| 22 | [Boss Design](./gdd/22-boss-design.md) | **PLACEHOLDER** — 12 chapter boss stubs, design constraints, common patterns |
| 23 | [Art Direction](./gdd/23-art-direction.md) | **PLACEHOLDER** — areas needing definition, asset budget, open questions |
| 24 | [Day-1 Launch Content](./gdd/24-day-1-launch-content.md) | Complete lockdown of everything shipping Day 1 |
| 25 | [Enemy AI](./gdd/25-enemy-ai.md) | 5-tier AI scaling system (Mindless → Optimal) by enemy level + boss override |

### Production & business

| Doc | Topic |
|-----|-------|
| [Production & Business Plan](./production-and-business.md) | Engineering ADRs, legal, marketing, QA, support, analytics, team, timeline, risks, budget |
| [Unity Setup Guide](./unity-setup-guide.md) | Step-by-step setup for Unity + Git + cross-machine workflow |

### Supporting documents

- [`CHANGELOG-from-source-PDF.md`](./CHANGELOG-from-source-PDF.md) — All 50+ changes vs the source PDF
- [`BACKLOG.md`](./BACKLOG.md) — 29 deferred features parked for future consideration
- `heroes/` — Per-hero detailed sheets (pending audit answers — see § 9)

## 4A. Implementation Status (code build)

> Live build state of the Unity project. Full per-GDD detail in [`IMPLEMENTATION-STATUS.md`](./IMPLEMENTATION-STATUS.md).
> **236 automated tests passing** (headless `dotnet test`), Unity 6 editor compiles clean, all scenes screenshot-verified.
> Legend: ✅ code-complete & tested · 🟡 partial (code done, needs assets/services) · ⬜ not started.

| GDD | System | Build |
|-----|--------|-------|
| 01 | Combat (sim, damage, status, counters, enrage, passives, boss phases, tower modifiers) | ✅ |
| 02 | Elements & Classes | ✅ |
| 03 | Stats & Progression | ✅ |
| 04 | Equipment (resolver, loot, enhance, salvage; **all 6 set bonuses incl. 4pc specials in combat**) | ✅ |
| 05 | Gacha & Currencies | ✅ |
| 06 | Idle & Shrine | ✅ |
| 07 | Eggs & Fusion | ✅ |
| 08 | Inventory & Storage | ✅ |
| 09 | Campaign (`StageRunner` + `StageLibrary` 120 stages × 4 diff + bosses + `CampaignRewards` loot) | ✅ |
| 10 | Tower of Trials | ✅ |
| 11 | World Map / Expedition | ✅ |
| 12 | Daily/Weekly/Trials/Boss Rush/Achievements + Mail/Inbox + Codex + **mission & achievement catalogs** | ✅ |
| 13 | Battle Pass | ✅ |
| 14 | Monetization (packs, Monthly Card, Beginner Pack) | 🟡 IAP receipt validation needs backend |
| 15 | Desktop Window UX (Compact/Expanded + **`GameSettings`: 9 sub-tabs, 40+ options**) | 🟡 tray + settings UI screens pending |
| 16 | **Tutorial / Onboarding** (9-stage, guaranteed starter team) | ✅ |
| 17 | Save System (JSON + checksum/XOR + disk) | ✅ |
| 18 | Audio | ⬜ needs assets |
| 19 | Localization (`LocalizationService`: fallback, vars, ICU-lite plurals, RTL, QA) | ✅ |
| 20 | UI / Menus / Tabs (13 placeholder scenes) | 🟡 final UI Toolkit pending |
| 21 | Live-ops / Telemetry / Security (save anti-tamper + **`TelemetryService`** done) | 🟡 config/IAP need backend |
| 22 | Boss Design (phase/revive engine + **12 filler chapter bosses**) | 🟡 final per-boss kits user-owned |
| 23 | Art Direction | ⬜ needs assets |
| 24 | Day-1 Content (**all 15 heroes carry real per-sheet stats/skills/passives**) | 🟡 final tuning + art |
| 25 | Enemy AI (5-tier) | ✅ |

**Presentation:** persistent save, Compact/Expanded TBH window, `MainHub` + 13 navigable scenes (Combat, Gacha, Roster, Campaign, Tower, Expedition, Shop, Battle Pass, Hatchery, Settings, Hero/Equip, Mail/Codex, Tutorial), all placeholder visuals.

**All discrete code-able-without-assets logic & content is now done.** Remaining is asset/backend/UI-presentation-gated: final art/animation, audio, UI-Toolkit screens (data models exist), telemetry/config backend, IAP receipt validation, store/cert, the ~150-achievement / final-boss-kit design expansion (user-owned), plus a live balance tuning pass. CI runs the headless suite on every push (`feat/ci` pending a PAT `workflow`-scope update to push).

## 5. Roster Summary

<mark>**Total launch 5★ roster: 15 heroes.** Plus 15 4★ heroes (designs TBD — user is producing these separately).

| Element | Tank | Assassin | Archer | Mage | Support |
|---------|------|----------|--------|------|---------|
| 🔥 Fire | Valdrik ✅ | Kaida ✅ | Ragnar 🆕 | Emberia ✅ | Akari 🆕 |
| 💧 Water | Glacier ✅ | Seraphina 🆕 | Auron 🚀 | Neria ✅ | Marina ✅ |
| 🌪 Wind | Mei Lin 🆕 | Kael ✅ | Lyria ✅ | Ayame 🆕 | Sylphie ✅ |

**Legend:** ✅ Standard banner (in pool from day 1); 🚀 Launch Limited Banner (Auron — first paid banner, live at launch); 🆕 Future Limited Banners (released over post-launch banner schedule).

**Available at launch (10 heroes):**
- **Standard banner pool (9):** Valdrik, Emberia, Kaida, Glacier, Marina, Neria, Sylphie, Lyria, Kael
- **Launch Limited Banner (1):** Auron

**Future Limited Banner releases (5):** Akari, Ragnar, Seraphina, Mei Lin, Ayame (release schedule defined post-launch)

This means F2P players via the 210-pull Standard Selector have 9 heroes available, Wishlist works on those 9, and Auron is the chase target for the first banner window. Subsequent Limited banners introduce one new hero at a time.

**4★ roster:** 15 heroes planned but not yet designed. They will likely form the bulk of the Hatchery / Egg / promotion-fodder gameplay AND be obtainable as Epic-tier gacha drops. See `design/heroes/4-stars-TBD.md`.</mark>

## 6. Core Gameplay Loops

### Daily Loop (~30 min)
```
Login
   ↓
Claim Shrine
   ↓
Claim idle rewards
   ↓
Run daily missions (8 of them)
   ↓
Dispatch 4 expeditions
   ↓
1 Tower floor run
   ↓
1-2 Hero Trial / Boss Rush attempts (if weekly modes active)
   ↓
Set idle target, tab away
```

### Weekly Loop (~3 hours total across the week)
```
Monday: weekly missions reset, login bonus continues
   ↓
Mid-week: featured chapter of the week (event-like 50% gold boost)
   ↓
Across week: complete weekly missions, climb tower, advance BP tiers
   ↓
End of week: claim weekly mission rewards, plan next week
```

### Seasonal Loop (~60 days)
```
Day 1: BP season starts
   ↓
~30 days: BP tier-up via daily/weekly engagement
   ↓
~45 days: Tower monthly reset (twice per BP season)
   ↓
Day 60: BP ends, claim grace period, new season begins
```

### Lifetime Loop (~6+ months)
```
Reach max account level
   ↓
Awaken favorite heroes to 6
   ↓
Promote heroes to 6★ via fodder + Apex Catalysts
   ↓
Max skill levels (10) on multiple heroes
   ↓
Tower floor 100 climb
   ↓
Boss Rush full clear on Nightmare
   ↓
Collect all Hero Shards / build dream roster
```

## 7. Key Numbers (cheat-sheet)

| Concept | Value |
|---------|-------|
| Launch 5★ heroes | 15 (10 available at launch + 5 future limited banners) |
| Launch 4★ heroes | 15 (designs TBD) |
| Launch elements | 3 (Fire / Water / Wind) |
| Launch classes | 5 (Tank / Assassin / Archer / Mage / Support) |
| Stats per hero | 7 (HP / ATK / DEF / SPD / CR / CD / ACC) |
| Equipment slots per hero | 7 (Weapon, Helmet, Chest, Gloves, Boots, Ring, Necklace) |
| Equipment sets | 6 launch (Berserker, Bastion, Swiftwind, Mystic, Vampire, Lifegiver) |
| Max hero level | 60 |
| Max star tier | 6★ (5★ → 6★ requires Apex Catalyst) |
| Awakening levels | 0-6 |
| Skill ranks per skill | 1-10 |
| Campaign chapters | 12 (3 Acts × 4 each) |
| Stages per chapter | 10 |
| Difficulty tiers | 4 (Normal / Hard / Nightmare / Hell) |
| Total stage instances | 480 |
| Tower of Trials floors | 100 (monthly reset) |
| Expedition slots | up to 4 |
| Battle Pass tiers | 50 (60-day season) |
| Gacha rates | Legendary 0.6% / Epic 7.2% / Rare 92.2% |
| Pity (all banners) | hard 50 only — guaranteed Legendary at pull 50; no soft pity |
| Standard Selector unlock | 210 pulls |
| Idle storage cap | 12 hours |
| Offline accumulation rate | 75% of active |
| Wishlist size | 3 Standard heroes |
| Achievement count at launch | ~150 |

## 8. Resolved Audit Items (all green)

All source-PDF inconsistencies have been resolved with user input. See `CHANGELOG-from-source-PDF.md` for full detail.

| # | Issue | Resolution |
|---|-------|------------|
| F-01 | Ice element on Glacier | Glacier = Water ✅ |
| F-02 | Fire Assassin draft-name confusion | Canonical: **Kaida** ✅ |
| F-03 | Water Mage spelling typo | Canonical: **Neria** ✅ |
| F-04 | Class weapon list | Reframed as "weapon archetypes" ✅ |
| F-05 | Energy stat conflict | Energy deleted entirely ✅ |
| F-06 | CDR vs. turn cooldowns | CDR deleted; replaced by Effect Hit / Healing Done % ✅ |
| F-07 | Secondary stats | Folded into 7 core stats ✅ |
| F-08 | Roster size | 15 5★ at launch + 15 4★ TBD ✅ |
| F-09 | (???) markers | Banner roles locked (Section 5) ✅ |

## 9. Hero Sheets

Per-hero detailed sheets live in `design/heroes/*.md`. All 15 5★ sheets are authored **and their stat
grades / skills / passives are now wired into the in-game `HeroDefinitionSO` assets** (see § 4A, GDD 24).

Recommended sheet template (per hero):
- Header: name, element, class, role, weapon, rarity, banner pool
- Appearance description
- Stat grades (HP/ATK/DEF/SPD/CR/CD/ACC)
- Passive (name, mechanics, max stacks)
- Basic attack (name, cooldown, effects)
- Skill 1 (name, cooldown, multiplier, effects)
- Skill 2 (name, cooldown, multiplier, effects)
- Ultimate (name, cooldown, multiplier, effects)
- Character identity (strengths/weaknesses)
- Chibi animations (idle / attack / skill 1 / skill 2 / ultimate / death)
- Team role
- Recommended partners
- Auto-AI defaults (recommended Ultimate trigger conditions)

## 10. Roadmap (high-level only)

| Phase | Timing | Goal |
|-------|--------|------|
| **Planning** (current) | Now | Approve master plan + GDDs + hero sheets |
| **Pre-Production** | T+1mo to T+3mo | Engine setup, ADRs, architecture, vertical slice |
| **Production** | T+3mo to T+9mo | Implement all 21 GDDs, 10 launch-available heroes (9 Standard + Auron), all 12 chapters |
| **Polish** | T+9mo to T+11mo | QA, balance, bugs, performance |
| **Soft Launch** | T+11mo | Limited region launch (Steam early access?) |
| **Global Launch** | T+12mo | Worldwide launch |
| **Post-Launch** | T+12mo+ | Events, seasonal BPs, new heroes, backlog items |

(Detailed sprint planning lives in `production/sprints/` — not yet written.)

## 11. Risks & Open Questions

| Risk | Mitigation |
|------|------------|
| **Desktop window paradigm is unfamiliar** | TBH proved the format. Compact mode is the differentiator. |
| **Gacha + idle combination is competitive market** | Stand on unique window paradigm + fair monetization. |
| **Cheating on save files** | Tamper detection, server validation for cash-touching events. |
| **10 launch-available heroes might feel light** | Add the 5 designed-but-deferred heroes (Akari, Ragnar, Seraphina, Mei Lin, Ayame) on a planned Limited Banner cadence. Plus 15 4★ heroes. Plus BP-exclusive heroes per season (every 60 days). |
| **Steam Cloud sync conflicts** | Conflict resolution UI in `gdd/17-save-system.md`. |
| **Launch without Steam Market** | Decision made — gacha-only monetization. Communicate clearly. |
| **Tower of Trials hero-lock might frustrate small rosters** | Rest Floors every 10 floors mitigate this. Tower Coin shop rewards even casual players. |

## 12. What's NOT in v1

(Per user direction and design decisions. Full list in `BACKLOG.md`.)

- ❌ Story / narrative campaign
- ❌ Voice acting
- ❌ PvP / Arena
- ❌ Guilds
- ❌ Pets / companions
- ❌ Steam Market trading
- ❌ Sweep / skip tickets
- ❌ Hero skins / costumes
- ❌ Mobile / console ports
- ❌ Cross-game crossovers
- ❌ Full screen reader support (v2)
- ❌ Live events (post-launch only)
- ❌ Friends / social features

## 13. What ARE the differentiators

| Differentiator | Why it matters |
|----------------|----------------|
| **Desktop window paradigm** | One of the very few PC-native idle gachas. TBH proved demand; market has room. |
| **Fair monetization** | No energy gates, transparent pity, Wishlist, free daily pull, Hero Shards. Most modern gachas don't go this far. |
| **Auto-AI quality** | Per-hero auto-skill overrides + bias slider. Players don't need to babysit combat. |
| **Idle stage selection + ROI display** | Most idle games hide the math. Project I surfaces it. |
| **3-star clear + Hero Trials** | Replay value per stage, even after the campaign is "done". |
| **Hero Shards** | Targeted progression. Even unlucky pulls accumulate toward a specific hero. |
| **Configurable settings (40+ options, 9 sub-tabs)** | PC players expect depth. Mobile-port settings menus disappoint. |
| **Accessibility from day 1** | Color blind, high contrast, motion reduction, text scaling. Most gacha games skip these. |

---

This master plan is the authoritative source of truth for v1. All implementation work should reference it.
