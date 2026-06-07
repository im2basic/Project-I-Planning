# Project I — Implementation Status

> Maps each GDD to its current build state in the Unity project. Updated as systems ship.
> Legend: ✅ implemented & tested · 🟡 partial · ⬜ not started.
> Verification: pure-C# logic in `ProjectI.Core` is unit-tested headlessly (`dotnet test`) **and**
> confirmed compiling/running in the Unity 6 editor. **160 automated tests passing.**

_Last updated: 2026-06-07_

## Core gameplay systems

| GDD | System | Status | Notes |
|-----|--------|--------|-------|
| 01 | Combat | ✅ | Action-gauge sim, full damage formula, status effects + §3.12 stacking, counters, enrage, auto-AI, action log/replay frames, per-hero passives, boss phase/revive, all 7 Tower floor modifiers |
| 02 | Elements & Classes | ✅ | Element triangle (difficulty-scaled), 5 classes, 7-stat `StatBlock` |
| 03 | Stats & Progression | ✅ | Level/star/awaken/skill math; `HeroProgressionService` (level-up, skill rank, 6★ promotion) |
| 04 | Equipment | ✅ | Resolver (sets/sub-stats), loot generation, enhancement (+15, never destroys), salvage, item power |
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
| 12 | Daily/Weekly/Trials/Boss Rush/Achievements | ✅ | `MissionTracker`, login bonus, hero-trial rotation, achievements, `BossRushRunner`. (Codex/Bestiary ⬜) |
| 25 | Enemy AI | ✅ | 5-tier AI (Mindless→Optimal) + boss/difficulty overrides, deviation |
| 22 | Boss Design | 🟡 | Phase-shift + revive **engine** done; per-boss content/kits ⬜ |

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
| 16 | Tutorial / Onboarding | ⬜ | Not started |
| 18 | Audio | ⬜ | Not started |
| 19 | Localization | ⬜ | Not started |
| 20 | UI / Menus / Tabs | 🟡 | 11 placeholder scenes navigable from MainHub; final UI Toolkit screens + interactivity ⬜ |
| 21 | Live-ops / Telemetry / Security | 🟡 | Save anti-tamper (checksum/XOR) done; telemetry, config server, IAP receipt validation ⬜ |
| 23 | Art Direction | ⬜ | Placeholder colored-square visuals only; final art ⬜ |
| 24 | Day-1 Launch Content | 🟡 | 15 filler hero `HeroDefinitionSO` assets; final balance/content from `heroes/*` ⬜ |

## Presentation layer (Unity scenes)

✅ Navigable shell: `SaveService` (persistent), `WindowModeController`, `MainHub` + **10 screen scenes**
(Combat, Gacha, Roster, Campaign, Tower, Expedition, Shop, Battle Pass, Hatchery, Settings) — all placeholder
visuals, screenshot-verified. Per-screen interactivity (clicking to mutate the live save) is the next step.

## Architecture

Pure-C# `ProjectI.Core` (no engine deps) + `ProjectI.Data` (ScriptableObjects) + `ProjectI.Gameplay`
(MonoBehaviours/scenes) + `ProjectI.Editor` (tools). Governed by ADR-0001..0003. All gameplay values data-driven.
Source repo: separate from this planning repo; ~31 feature branches on GitHub.
