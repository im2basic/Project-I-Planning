# Project I — Changelog vs. Source PDF

> **Purpose:** Single-page index of every change, addition, and clarification this master plan makes vs. the original `Project I.pdf` (208 pages, 6,795 lines of text).
>
> **How to read:** every entry in [the master plan](./project-i-master-plan.md) that came from this list is wrapped in `<mark>...</mark>` tags so it renders as a yellow highlight in the rendered PDF. If you see a yellow block, it's described here.

---

## ✅ Decisions locked by user (from planning session)

| # | Topic | Decision | Source |
|---|-------|----------|--------|
| D-01 | Combat style | Auto turn-based by default; manual mode is an opt-in toggle in expanded view. Speed determines turn order. Cooldowns in turns. | Q&A |
| D-02 | Elements | 3-element triangle locked: 🔥 Fire / 💧 Water / 🌪 Wind. Glacier reclassified from Ice → Water. Frost/Freeze remain as Water-flavored status effects. | Q&A |
| D-03 | Endgame | Tower of Trials + World Map / Expedition + Hero Trials + Boss Rush. Character merge & gear grinding are the core power-growth loops. Events post-launch only. | Q&A |
| D-04 | Narrative | No story for v1. Bare flavor only on hero sheets. | Q&A |
| D-05 | Equipment depth | Mid-depth: main stat + 2-3 random sub-stats + 2/4-piece set bonuses. | Q&A |
| D-06 | Monetization | Standard gacha: Battle Pass + Monthly Card + Beginner Pack + Limited Banner bundles + Dupe Shop. Pity 50/210. | Q&A |
| D-07 | PvP / Guilds | Out of scope. Single-player design locked. | Q&A |
| D-08 | KO behavior | If the entire party dies, the stage auto-repeats with rewards reduced (no first-clear bonus, ~50% loot). Mid-stage hero KO: dead until end of stage; revived between battles. | Q&A |
| D-09 | Auto vs. Manual | Auto is the default for all combat. Manual is a per-stage toggle. Compact mode = always auto. | Q&A |
| D-10 | Sweep / Skip tickets | NOT in v1. Idle is the only "skip" mechanism. | Q&A |
| D-11 | Steam Market trading | NOT in scope. Project I is gacha-monetized, not loot-trade. | Q&A |
| D-12 | Pets / Companions | NOT in v1. Kept in `BACKLOG.md` for post-launch consideration. | Q&A |
| D-13 | Launch roster | **15 5★ heroes total**: 9 Standard pool + 1 launch Limited banner (Auron) + 5 future Limited banners (Akari, Ragnar, Seraphina, Mei Lin, Ayame). Plus 15 4★ heroes (designs forthcoming). | Q&A |
| D-14 | Render format | Master plan rendered to PDF via pandoc + weasyprint; all new content highlighted via HTML `<mark>` tags. | Q&A |

---

## 🔴 Inconsistencies in source PDF — fixes applied or pending user answer

| # | Issue | Status | Resolution |
|---|-------|--------|------------|
| F-01 | "Ice" element on Glacier — only 3 elements exist (Fire/Water/Wind) | ✅ Fixed | Glacier → 💧 Water. Frostbite / Freeze become Water-flavored status effects. |
| F-02 | Source-PDF draft-name confusion in the Fire Assassin sheet | ✅ Resolved | Fire Assassin canonical name is **Kaida**. All draft-name traces removed. |
| F-03 | Source-PDF spelling typo for Water Mage | ✅ Resolved | Water Mage canonical name is **Neria** (the alt spelling was a draft typo, not a rename). |
| F-04 | Class weapon list contradicts actual hero weapons (Tank=Shield is broken; many hero weapons don't match class spec) | ✅ Fixed | Reframed as "weapon archetypes" — each class has a *family* of allowed weapons. Existing hero designs preserved. |
| F-05 | "No Mana, No Energy" but Energy is referenced as a stat (necklace) and as an effect (Marina's Ultimate) | ✅ Fixed | All Energy references deleted. Marina's Ultimate "restores Energy" effect simply removed (no replacement) — her ult is now pure team heal + cleanse + Healing Received buff. |
| F-06 | Cooldown Reduction as an equipment stat conflicts with integer turn cooldowns | ✅ Fixed | CDR stat removed. Replaced on Magic Armor + Necklaces with Effect Hit % (Mages) / Healing Done % (Supports). |
| F-07 | Secondary stats (Magic Power, Healing Power, Damage Reduction, Shield Strength) not in core stat list | ✅ Fixed | Folded into core 7 stats. Magic Power → ATK; Healing Power → ATK × per-skill heal multiplier; Damage Reduction → DEF; Shield Strength → HP-derived. |
| F-08 | 9-hero roster vs. 15-hero detailed sheets in PDF | ✅ Fixed | Launch roster locked at **15 5★ heroes** total: 9 Standard pool + 1 launch Limited (Auron) + 5 future Limited banners (Akari, Ragnar, Seraphina, Mei Lin, Ayame). Plus 15 4★ heroes (designs TBD). |
| F-09 | `(???)` and `(BANNER 2)` markers on certain heroes (Ayame, Akari, Ragnar, Seraphina, Mei Lin, Auron) | ✅ Fixed | Lock confirmed: Auron = launch Limited banner; Akari/Ragnar/Seraphina/Mei Lin/Ayame = future Limited banners (designs preserved as WIP placeholders). |
| F-10 | APPEARANCE sections only present on 4 of 15 character sheets | ✅ Standard | APPEARANCE section becomes part of standard character sheet template; will be backfilled for the missing 11 when sheets are next revised. |
| F-11 | Chibi skill animation count ambiguity — is Skill 1 + Skill 2 = 1 sheet or 2? | ✅ Fixed | One chibi animation sheet per skill: Idle / Attack / Skill 1 / Skill 2 / Ultimate / Death = 6 sheets per hero. |
| F-12 | "Guild content" referenced as source of Sacred Stones, but Guilds are out of scope | ✅ Fixed | Sacred Stones source moved to Weekly Boss Rush (NEW endgame mode) + Tower of Trials milestone rewards. |
| F-13 | Auron + Glacier are visually "ice" but element-tagged as Water | ✅ Acknowledged | Kept as Water with ice-themed visual identity. Status effects use Frostbite/Freeze under the Water element banner. |

---

## 🟡 Referenced but undefined in source PDF — defined here

| # | Item | Defined In |
|---|------|------------|
| U-01 | Skill upgrade system | `gdd/03-stats-and-progression.md` |
| U-02 | Hero Essence currency + Essence Shop | `gdd/05-gacha-and-currencies.md` (Dupe Shop) |
| U-03 | Duplicate Tokens (folded into Hero Essence — single dupe currency) | `gdd/05-gacha-and-currencies.md` |
| U-04 | Sacred Stones (Shrine upgrade material) — tier ladder | `gdd/06-idle-and-shrine.md` |
| U-05 | Promotion Materials — full ladder | `gdd/03-stats-and-progression.md` |
| U-06 | Element Crystals (Fire / Water / Wind) | `gdd/03-stats-and-progression.md` |
| U-07 | Achievements list + reward tiers | `gdd/12-daily-weekly-loops.md` |
| U-08 | Battle Pass full design | `gdd/13-battle-pass.md` |
| U-09 | Daily / Weekly missions | `gdd/12-daily-weekly-loops.md` |
| U-10 | Events architecture (for post-launch) | `gdd/21-liveops-and-telemetry.md` |
| U-11 | Damage formula (full math) | `gdd/01-combat.md` |
| U-12 | Enemy / boss roster + design rules | `gdd/09-campaign-structure.md` |
| U-13 | Campaign chapter/act/world structure | `gdd/09-campaign-structure.md` |
| U-14 | Tutorial / onboarding flow | `gdd/16-tutorial-onboarding.md` |
| U-15 | Save system spec | `gdd/17-save-system.md` |

---

## 🟢 New systems added (each gets its own GDD sub-doc, all highlighted)

| # | System | GDD Sub-doc |
|---|--------|-------------|
| N-01 | Combat speed multiplier (1x/2x/3x/4x) | `gdd/01-combat.md` |
| N-02 | Auto-AI spec (skill priority, targeting) | `gdd/01-combat.md` |
| N-03 | Idle stage selection UI + drop preview | `gdd/06-idle-and-shrine.md` |
| N-04 | First-clear vs. repeat rewards | `gdd/09-campaign-structure.md` |
| N-05 | 3-star rating system per stage | `gdd/09-campaign-structure.md` |
| N-06 | Formation / positioning (Front Row / Back Row) | `gdd/01-combat.md` |
| N-07 | KO + party-wipe behavior | `gdd/01-combat.md` |
| N-08 | Buff / debuff stacking rules | `gdd/01-combat.md` |
| N-09 | Turn order timeline UI | `gdd/01-combat.md`, `gdd/20-ui-menus-tabs.md` |
| N-10 | Boss preview / scout | `gdd/01-combat.md` |
| N-11 | Manual retry + auto-repeat on wipe | `gdd/01-combat.md` |
| N-12 | Auto-loot pickup in compact mode | `gdd/15-desktop-window-ux.md` |
| N-13 | Counter-attack mechanic | `gdd/01-combat.md` |
| N-14 | Speed tie-breaker rules | `gdd/01-combat.md` |
| N-15 | Boss enrage timer (30 turns default) | `gdd/01-combat.md` |
| N-16 | Difficulty modifier rules (Normal/Hard/Nightmare/Hell) | `gdd/09-campaign-structure.md` |
| N-17 | Damage formula | `gdd/01-combat.md` |
| N-18 | Skill upgrade system (skill stones from stages) | `gdd/03-stats-and-progression.md` |
| N-19 | Equipment sub-stats (2-3 rolled subs) | `gdd/04-equipment.md` |
| N-20 | Equipment set bonuses (6 sets: Berserker / Bastion / Swiftwind / Mystic / Vampire / Lifegiver) | `gdd/04-equipment.md` |
| N-21 | Equipment salvage + sub-stat reroll | `gdd/04-equipment.md` |
| N-22 | Tower of Trials (100 floors, monthly reset) | `gdd/10-tower-of-trials.md` |
| N-23 | World Map / Expedition (4 parties, 4 timer tiers) | `gdd/11-world-map-expedition.md` |
| N-24 | Daily / Weekly missions + 7-day login bonus | `gdd/12-daily-weekly-loops.md` |
| N-25 | Hero Trials (weekly rotating single-hero stages) | `gdd/12-daily-weekly-loops.md` |
| N-26 | Boss Rush (weekly chapter-bosses gauntlet) | `gdd/12-daily-weekly-loops.md` |
| N-27 | Battle Pass (50 tiers, 60-day cycle, free + premium + premium-plus) | `gdd/13-battle-pass.md` |
| N-28 | Monetization plan + ARPU targets | `gdd/14-monetization.md` |
| N-29 | Tutorial / onboarding (9-stage flow, reroll-friendly) | `gdd/16-tutorial-onboarding.md` |
| N-30 | Save system (local JSON + cloud sync hook, tamper-resistant) | `gdd/17-save-system.md` |
| N-31 | Audio direction (mixing bus, SFX/music taxonomy) | `gdd/18-audio-direction.md` |
| N-32 | Localization plan (string tables, EN v1, CJK/EU expansion) | `gdd/19-localization-plan.md` |
| N-33 | Wishlist system (Standard 5★ guaranteed rotation) | `gdd/05-gacha-and-currencies.md` |
| N-34 | Free daily pull on at least one banner | `gdd/05-gacha-and-currencies.md` |
| N-35 | Pity-tracker UI in gacha screen | `gdd/05-gacha-and-currencies.md` |
| N-36 | Beginner step-up banner (replaces flat 20% discount) | `gdd/05-gacha-and-currencies.md` |
| N-37 | Reroll-friendly tutorial pacing | `gdd/16-tutorial-onboarding.md` |
| N-38 | Mail / Inbox system | `gdd/20-ui-menus-tabs.md` |
| N-39 | Achievements + Codex + Bestiary + Hero Gallery | `gdd/12-daily-weekly-loops.md`, `gdd/20-ui-menus-tabs.md` |
| N-40 | Full settings menu (40+ options, sub-tabbed) | `gdd/15-desktop-window-ux.md`, `gdd/20-ui-menus-tabs.md` |
| N-41 | Accessibility suite (color blind, high contrast, reduce shake, text scaling) | `gdd/15-desktop-window-ux.md` |
| N-42 | Audio sliders (Master/Music/SFX/Voice/UI) | `gdd/15-desktop-window-ux.md` |
| N-43 | Hotkey rebinding | `gdd/15-desktop-window-ux.md` |
| N-44 | Pause-when-unfocused, battery-saver, display scale, etc. | `gdd/15-desktop-window-ux.md` |
| N-45 | Confirm-on-spend toggle for premium currency | `gdd/15-desktop-window-ux.md` |
| N-46 | Hot-config (server-driven balance) | `gdd/21-liveops-and-telemetry.md` |
| N-47 | Telemetry / analytics events | `gdd/21-liveops-and-telemetry.md` |
| N-48 | Anti-cheat basics + IAP receipt validation | `gdd/21-liveops-and-telemetry.md` |
| N-49 | Event calendar + maintenance broadcast plumbing | `gdd/21-liveops-and-telemetry.md` |
| N-50 | Team presets (3-5 saved team configs) | `gdd/01-combat.md`, `gdd/20-ui-menus-tabs.md` |
| N-51 | Recommended team builder | `gdd/20-ui-menus-tabs.md` |
| N-52 | Quick-equip / bulk-select / lock-favorite | `gdd/04-equipment.md`, `gdd/08-inventory-and-storage.md` |
| N-53 | Hero shard / fragment system (dupes give shards toward chosen hero) | `gdd/05-gacha-and-currencies.md` |
| N-54 | Replay last battle / damage log | `gdd/01-combat.md` |
| N-55 | Auto-pause on PC sleep + cloud save conflict resolution | `gdd/17-save-system.md` |

---

## 📋 Removed / explicitly deferred to backlog

| # | Item | Reason |
|---|------|--------|
| R-01 | Pets / companion system | User decision — not v1 |
| R-02 | Steam Market trading | User decision — not in scope |
| R-03 | PvP / Arena | User decision — not in scope |
| R-04 | Guilds | User decision — not in scope |
| R-05 | Sweep / Skip tickets | User decision — idle is the only skip |
| R-06 | Hero skins / costumes | Deferred to post-launch (BACKLOG) |
| R-07 | Hero affinity / friendship | Deferred to post-launch (BACKLOG) |
| R-08 | Hero synergy team-comp bonuses | Deferred to post-launch (BACKLOG) |
| R-09 | DPS meter / damage history toggle | Deferred to post-launch (BACKLOG) |
| R-10 | Story / narrative campaign | User decision — no story for v1 |
| R-11 | Friends list / referral | Single-player locked |
| R-12 | Full screen reader support | Deferred to v2 accessibility pass |

---

## 🗂️ Document index

After this changelog, all design content lives in:

- **`design/project-i-master-plan.md`** — top-level overview and links
- **`design/gdd/`** — 21 GDD sub-docs
- **`design/heroes/`** — 16 hero sheets (9 ready + 7 placeholders)
- **`design/BACKLOG.md`** — deferred features for post-launch consideration
- **`design/Project-I-Master-Plan.pdf`** — rendered PDF with highlights
