# GDD 20 — UI / Menus / Tabs

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>This GDD defines the **full navigation tree** for both Compact and Expanded modes. Adds 18 new tabs/screens to the source PDF's 9. Includes Mail/Inbox, Achievements, Codex, Hero Trials, Boss Rush, Stage Select map, settings sub-tabs, and Help/FAQ.</mark>

## 2. Player Fantasy

> *I can find anything in two clicks. Nothing is buried. New content surfaces with a clear badge.*

## 3. Detailed Rules

### 3.1 Compact Mode UI

Already documented in `gdd/15-desktop-window-ux.md`. Minimal — combat view + a single expand button.

### 3.2 Expanded Mode — Top Navigation

<mark>

Persistent top tab bar (left to right):

| Tab | Icon | Subtabs / Notes |
|-----|------|------------------|
| Home / Dashboard | 🏠 | Daily check-in, missions summary, news |
| Stage Select | 🗺 | Chapter map, difficulty toggle, scout |
| Heroes | 👥 | Roster, hero detail, fusion, awakening, skill upgrade |
| Inventory | 📦 | Gear, materials, eggs, codex |
| Gacha | 💎 | Limited, Standard, Step-Up; pity tracker; wishlist |
| Tower | 🗼 | 100-floor map, scout, shop |
| Expedition | ⛵ | Active expeditions, mission board |
| Hero Trials | ⚔ | Weekly featured hero, 3-tier trials |
| Boss Rush | 👹 | Weekly gauntlet, difficulty toggle |
| Battle Pass | 🎯 | Free / Premium tracks, claim |
| Shop | 🛒 | Crystal packs, Monthly Card, Beginner Pack, Dupe Shop |
| Achievements | 🏆 | List, completion %, claim |
| Mail | 📧 | Pending claims, expiry warnings |
| Settings | ⚙ | 9 sub-tabs (per `gdd/15-desktop-window-ux.md`) |

</mark>

### 3.3 Home / Dashboard (NEW)

<mark>

Landing screen after tutorial. Shows:
- Daily mission progress bar (with one-tap "open mission list")
- Login bonus indicator (claim button if available)
- Featured chapter of the week banner
- News carousel (patch notes, events — post-launch)
- Quick-actions: Resume Idle, Pull Banner, Open Tower
- Active expedition timer summary
- Mailbox unread count badge

</mark>

### 3.4 Stage Select Map (NEW)

<mark>

- Visual chapter map (Acts 1 / 2 / 3 with chapter nodes)
- Tap chapter → expanded view of 10 stages
- Difficulty toggle (Normal / Hard / Nightmare / Hell)
- 3-star indicator per stage
- "Idle here" button per cleared stage
- "Scout" button on boss stages
- Featured Chapter highlighted

</mark>

### 3.5 Heroes Hub (NEW structure)

<mark>

Three sub-tabs:

**Roster (browse)**
- Grid of owned heroes
- Filter / sort (per `gdd/08-inventory-and-storage.md`)
- Lock / favorite icons
- "Recently obtained" badge

**Hero Detail (per hero)**
- Splash art, card, all stats
- Equipment slots (tap to manage)
- Skill levels (with Skill Stone investments)
- Auto-AI overrides
- Awakening status, level, star tier
- Promotion progress (next milestone)
- Comparison vs another owned hero

**Hero Gallery (codex view, all 16)**
- All 15 5★ heroes — owned and unowned (silhouetted); future-banner heroes show "Coming Soon" date estimate; 4★ heroes (when released) displayed alongside
- Filter by element / class / banner pool
- Used for wishlist research

</mark>

### 3.6 Inventory Hub (NEW structure)

<mark>

Three sub-tabs:

**Equipment**
- Filter by slot / set / rarity / equipped status
- Comparison view
- Bulk select for salvage / sell
- Forge (enhance, reroll sub-stat)
- Set Bonus inspector (which heroes have active set bonuses)

**Materials**
- All consumable items
- Grouped by category (EXP, Promotion, Skill, Sacred, Currency, Tickets)
- Each shows current count + sources for re-acquisition

**Codex (NEW)**
- Hero Gallery link
- Bestiary (enemies encountered)
- Item Codex (all gear types + sets)
- Set Bonus catalog

</mark>

### 3.7 Gacha Hub

<mark>

Three banner tabs + pity tracker + wishlist:

**Limited Banner**
- Featured hero splash
- Banner duration countdown
- Pity progress (X/30 soft, X/50 hard, X/30 carryover indicator)
- Rates display, single / 10-pull buttons

**Standard Banner**
- Carousel of all Standard heroes
- Pity progress (X/30 soft, X/50 hard, X/210 Selector)
- Wishlist editor (3 picks, 24h lock)
- Single / 10-pull / Free Daily Pull buttons

**Step-Up Banner** (only visible to accounts ≤ 14 days)
- 3-step progression
- Step rewards shown
- Cost per step

</mark>

### 3.8 Mail / Inbox (NEW)

<mark>

- All pending claimables (gacha overflow, expedition rewards, BP rewards, achievement rewards, compensation gifts)
- Each entry shows: source, expiry countdown, items contained, claim button
- "Claim All" button at top (with confirm if any items would overflow inventory)
- 30-day expiration with 7-day-warning UI
- "View claimed history" tab — last 90 days

</mark>

### 3.9 Achievements (NEW)

<mark>

- Categorized tabs (Collection / Combat / Progression / Tower / Boss Rush / Gacha / Codex / Secret)
- Progress bars per achievement
- Hidden achievements show as "???" until triggered
- Claim button when completed
- Profile-title-of-the-month showcased on player profile

</mark>

### 3.10 Settings (per `gdd/15-desktop-window-ux.md`)

Already documented. 9 sub-tabs.

### 3.11 Help / FAQ (NEW)

<mark>

- Categorized articles (How to Play / Account / Purchases / Technical / Combat / Gacha)
- Search box
- "Contact Support" — opens email template or in-game ticket form (post-launch)
- Patch notes browser
- Game version / build info quick-display

</mark>

### 3.12 New Content Badges

<mark>

Red dot badges on tabs when:
- Mail has unclaimed rewards
- Daily/weekly missions completed but not claimed
- BP tiers unlocked but not claimed
- New banners go live (24h fade)
- Achievement completed
- Tower / Boss Rush has un-claimed milestones

Players love the "all dots cleared" satisfaction loop. Don't overdo it — show only meaningful badges.

</mark>

### 3.13 Team Builder

<mark>

In Hero menu, **"Team Presets"** sub-tab:
- 5 named team slots
- Drag-drop heroes into slot configurations
- Save preset
- One-tap activate
- "Recommended team for next stage" button (auto-builds based on next stage's element + class needs)

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Badge unread count | sum of unclaimed items / unread missions |
| New content badge expiry | 24h after first sighting OR until interacted |
| Recommended team | compute team power × element-fit × class-coverage |

## 5. Edge Cases

- **Badge persistence after claim:** badge clears immediately upon claim. UI is reactive.
- **Mail expiring during play session:** notification on first session after expiry; expired items deleted at session start.
- **Settings open mid-combat:** combat pauses (in expanded mode; compact mode continues running).
- **Tab not yet unlocked:** grayed out with "Unlocks at chapter X" tooltip.

## 6. Dependencies

- `08-inventory-and-storage.md` — filter/sort/search across screens
- `12-daily-weekly-loops.md` — daily/weekly UI surface, achievements
- `13-battle-pass.md` — BP screen
- `15-desktop-window-ux.md` — Settings sub-tabs
- `17-save-system.md` — UI state persistence (last visited tab)

## 7. Tuning Knobs

- New content badge expiry (24h)
- Mail expiry warning threshold (7 days)
- Settings tab order
- Badge thresholds (e.g., show badge on Mail when ≥ 1 unclaimed item)

## 8. Acceptance Criteria

1. ✅ <mark>All 14 top-level tabs are reachable from Home.</mark>
2. ✅ <mark>Mail/Inbox shows pending claims with countdown.</mark>
3. ✅ <mark>Badges appear on tabs with new content, clear after interaction.</mark>
4. ✅ <mark>Stage Select Map shows 3-star indicators.</mark>
5. ✅ Gacha screen shows pity tracker + wishlist.
6. ✅ <mark>Hero Detail shows skill levels, equipment, awakening progression.</mark>
7. ✅ <mark>5 Team Presets save and switch in one tap.</mark>
8. ✅ <mark>Help / FAQ is reachable from Settings.</mark>
