# Project I — Implementation Status

> Maps each GDD to its current build state in the Unity project. Updated as systems ship.
> Legend: ✅ implemented & tested · 🟡 partial · ⬜ not started.
> Verification: pure-C# logic in `ProjectI.Core` is unit-tested headlessly (`dotnet test`) **and**
> confirmed compiling/running in the Unity 6 editor. **212 automated tests passing.**
> CI: GitHub Actions runs the headless suite on every push (`.github/workflows/tests.yml`).

_Last updated: 2026-06-07_

## Core gameplay systems

| GDD | System | Status | Notes |
|-----|--------|--------|-------|
| 01 | Combat | ✅ | Action-gauge sim, full damage formula, status effects + §3.12 stacking, counters, enrage, auto-AI, action log/replay frames, per-hero passives, boss phase/revive, all 7 Tower floor modifiers |
| 02 | Elements & Classes | ✅ | Element triangle (difficulty-scaled), 5 classes, 7-stat `StatBlock` |
| 03 | Stats & Progression | ✅ | Level/star/awaken/skill math; `HeroProgressionService` (level-up, skill rank, 6★ promotion) |
| 04 | Equipment | ✅ | Resolver (sets/sub-stats), loot generation, enhancement (+15, never destroys), salvage, item power; all 6 set bonuses incl. Swiftwind 4pc (haste→gauge) & Lifegiver 4pc (cleanse + low-HP heal) wired into combat |
| 05 | Gacha & Currencies | ✅ | Roll algo, hard pity 50, wishlist, selector; `Wallet`/`PullService`/`CollectionService` |
| 06 | Idle & Shrine | ✅ | Offline accrual (12h cap, 0.75), `ShrineState`, `IdleSession` (timestamp-driven) |
| 07 | Eggs & Fusion | ✅ | Weighted hatch, instant-hatch cost, fusion ladder (5★→6★ needs Apex) |
| 08 | Inventory & Storage | ✅ | `ItemInventory` (capacity, lock-aware bulk salvage + preview, sort/filter) |

## Content & endgame

| GDD | System | Status | Notes |
|-----|--------|--------|-------|
| 09 | Campaign Structure | ✅ | `StageRunner` (multi-wave, HP/cooldown carry-over, 3-star, difficulty gates) |
| 10 | Tower of Trials | ✅ | Hero-lock state machine, coin shop + limits, monthly reset; floor modifiers wired into combat |
| 11 | World Map / Expedition | ✅ | Dispatch slots, crew bonuses, validation, quick-send, 6h refresh |
| 12 | Daily/Weekly/Trials/Boss Rush/Achievements | ✅ | `MissionTracker`, login bonus, hero-trial rotation, achievements, `BossRushRunner`. **Mail/Inbox + Codex/Bestiary now done** |
| 25 | Enemy AI | ✅ | 5-tier AI (Mindless→Optimal) + boss/difficulty overrides, deviation |
| 22 | Boss Design | 🟡 | Phase-shift + revive **engine** done; `BossDefinitionData`/`BossFactory` + **12 filler chapter bosses** (`BossLibrary`, pattern-library kits) — final per-boss designs user-owned |

## Monetization & meta

| GDD | System | Status | Notes |
|-----|--------|--------|-------|
| 13 | Battle Pass | ✅ | XP/tiers (cap 50), Free/Premium tracks, retroactive unlock, tier skips, season reset |
| 14 | Monetization | 🟡 | Crystal packs, Monthly Card, Beginner Pack. Receipt validation = server (GDD 21) ⬜ |
| 17 | Save System | ✅ | Model + JSON codec + SHA-256/XOR integrity + `SaveService` disk persistence |

## Platform / production / presentation

| GDD | System | Status | Notes |
|-----|--------|--------|-------|
| 15 | Desktop Window UX | 🟡 | `WindowModeController` Compact (always-on-top widget) / Expanded; full tray + 9 settings sub-tabs ⬜ |
| 16 | Tutorial / Onboarding | ✅ | `TutorialFlow`: 9-stage sequence, no-skip-before-stage-3, guaranteed Stage-5 starter team (Lyria 5★ + Sylphie/Valdrik 3★), day-1 gems, dismissible hints, Crystal-preserving reset; `TutorialSandbox` scene |
| 18 | Audio | ⬜ | Not started |
| 19 | Localization | ✅ | `LocalizationService`: key→locale→English→key fallback, `{var}` substitution, ICU-lite plurals, RTL flag, MissingKeys QA; 10 locales wired (EN shipping) |
| 20 | UI / Menus / Tabs | 🟡 | 13 placeholder scenes navigable from MainHub (+ Mail/Codex, Tutorial); final UI Toolkit screens + interactivity ⬜ |
| 21 | Live-ops / Telemetry / Security | 🟡 | Save anti-tamper (checksum/XOR) + **`TelemetryService`** (batched events, opt-out, retry, GDD §3.4 taxonomy) done; config server + IAP receipt validation need backend |
| 23 | Art Direction | ⬜ | Placeholder colored-square visuals only; final art ⬜ |
| 24 | Day-1 Launch Content | 🟡 | All 15 hero `HeroDefinitionSO` assets carry **real per-sheet stats/skills/passives** (grades via `HeroStatGrades`, applied by `RosterHeroGenerator`); final tuning pass + art ⬜ |

## Presentation layer (Unity scenes)

✅ Navigable shell: `SaveService` (persistent save), `WindowModeController` (Compact/Expanded TBH window),
`MainHub` + **13 screen scenes** (incl. Mail/Codex + Tutorial), placeholder visuals, all screenshot-verified.

✅ **Playable** — every gameplay screen mutates the persistent save:
- **Gacha** PULL x10 (tickets→heroes→pity) · **Roster** +5 LV (gold/EXP→levels) · **Campaign** FIGHT
  (real `StageRunner` battle → chapter progress) · **Tower** CLIMB (battle → floor + coin) ·
  **Hatchery** HATCH/FUSE (fodder ladder) · **Shop** buy/convert/tickets · **Expedition** dispatch/claim.
- Combat scene plays back a battle frame-by-frame. Settings shows live accessibility options.

⬜ Remaining **code-able** (no assets, content/UI authoring): campaign stage content (12 ch × 10 stages
× 4 difficulties as data + loot tables), ~150 achievement definitions, daily/weekly mission set, and the
40+ settings options across 9 sub-tabs.

⬜ Remaining **asset/backend-gated**: final art & animation, audio, UI-Toolkit polish, telemetry/config
backend + Steam IAP receipt validation + store/cert, and a live balance tuning pass (per-hero base values
are wired from the sheets; numbers still want playtesting).

## Architecture

Pure-C# `ProjectI.Core` (no engine deps) + `ProjectI.Data` (ScriptableObjects) + `ProjectI.Gameplay`
(MonoBehaviours/scenes) + `ProjectI.Editor` (tools). Governed by ADR-0001..0003. All gameplay values data-driven.
Source repo: separate from this planning repo; ~40 feature branches on GitHub. New since the last update:
Localization (`ProjectI.Localization`), Telemetry (`ProjectI.Telemetry`), Boss content (`ProjectI.Bosses`).
**Note:** the `feat/ci` branch (GitHub Actions workflow) needs a PAT with `workflow` scope to push —
pending a token-scope update.
