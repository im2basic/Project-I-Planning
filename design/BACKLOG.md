# Project I — Backlog (Deferred Features)

> Features kept on file for post-launch consideration. NOT in v1 scope. NOT abandoned — preserved so they can be revisited at the right time.

---

## Player-Facing Systems

### B-01 — Pet / Companion System
- **TBH-like pet that follows the party.** Inactive in v1 (user decision). Could be reintroduced as a cosmetic-only "follower" or as a stat-bonus auxiliary. If reintroduced, design carefully to avoid power-creep.
- **Effort:** Medium (new entity, new UI, new gacha-adjacent pool)
- **Earliest candidate window:** Post-launch +3 months

### B-02 — Hero Skins / Costumes
- Alternate visual identities for existing heroes. Pure cosmetic, no stat impact. Monetization-friendly.
- **Effort:** Per-hero costume = ~2 weeks of art + integration
- **Earliest candidate window:** Post-launch +1 month (first event season)

### B-03 — Hero Affinity / Friendship
- Heroes used in battle gain "affinity" with the player. At thresholds, small flavor lines unlock and small stat bonuses apply.
- **Effort:** Medium (affinity tracking, dialogue strings, UI surface)
- **Earliest candidate window:** Post-launch +3 months

### B-04 — Hero Synergy Bonuses
- Specific team compositions grant party-wide buffs (e.g., "All-Wind team: +10% Speed", "Lyria + Sylphie + Mei Lin: +15% Crit").
- **Effort:** Low-Medium (data table + buff plumbing)
- **Earliest candidate window:** Post-launch +2 months
- **Caveat:** Risk of pigeonholing meta; needs careful tuning to avoid "always bring these 3" syndrome

### B-05 — Hero Trial Mastery → Talent Tree
- Beyond Gold-tier Hero Trials, future-state could unlock a per-hero talent tree (small per-hero choices like "+5% CritDamage on Skill 2" or "Skill 1 hits 2 enemies").
- **Effort:** Large (UI, balance, save schema)
- **Earliest candidate window:** Post-launch +6 months

### B-06 — DPS Meter / Combat Log (toggleable)
- Detailed per-hero damage tracking and historical combat log. Toggleable in settings.
- **Effort:** Low-Medium (logging is already there per `gdd/01-combat.md`; just surface in UI)
- **Earliest candidate window:** Post-launch +1 month (QoL update)

### B-07 — Replay Video / Step-Through Playback
- Full battle replay with scrubbable timeline. Currently only the damage log is in v1.
- **Effort:** Large (replay storage, deserialization, playback)
- **Earliest candidate window:** Post-launch +6+ months

---

## Social & Community

### B-08 — Friends List & Referral
- Player friends, referral rewards, friend "high-five" daily bonus.
- **Effort:** Medium (single-player → social changes architecture)
- **Note:** User said single-player only design locked. Revisit only if user changes mind.

### B-09 — Co-op Boss Battles
- Multi-player raid-style boss fights. Architecturally requires real-time multiplayer.
- **Effort:** Very Large (multiplayer netcode, matchmaking, real-time sync)
- **Note:** Out of scope per user direction.

### B-10 — Guild System
- Guilds, guild chat, guild boss raids, guild shop.
- **Effort:** Very Large
- **Note:** Out of scope per user direction.

### B-11 — PvP Arena
- Async ladder PvP. Out of scope per user.

---

## Accessibility (Phase 2)

### B-12 — Full Screen Reader Support
- v1 includes hooks; v2 adds full NVDA / JAWS / VoiceOver navigation through all menus, combat, gacha. Includes ARIA-equivalent labels on all UI.
- **Effort:** Medium-Large (audit pass + a lot of integration)
- **Earliest candidate window:** Post-launch +3-6 months

### B-13 — Hold-to-Skip Animations
- For accessibility (motion sensitivity) and for fast play, allow hold-to-skip on all gacha pulls, ultimate animations.
- **Effort:** Low
- **Earliest candidate window:** Post-launch +1 month

### B-14 — Localization VO Recording
- Voice acting for major Asian markets (JP, KR, CN). Currently no VO at all.
- **Effort:** Very Large (recording, lip-sync, files)
- **Earliest candidate window:** Post-launch +6+ months, market-driven

---

## QoL & Convenience

### B-15 — Sweep / Skip Tickets
- Instant-clear cleared stages 10x at once. User explicitly excluded from v1.
- **Effort:** Low
- **Note:** Revisit only if user changes mind.

### B-16 — Cross-Platform Save Sync (beyond Steam)
- EGS, GOG, mobile cross-save. Steam Cloud is v1.
- **Effort:** Medium per platform
- **Earliest candidate window:** When a new platform launch is planned.

### B-17 — Steam Market Trading (TBH-style)
- Sell in-game items on the Steam Market. Explicitly excluded by user.
- **Effort:** Large (server-side, anti-cheat, IRS-related complications)
- **Note:** Permanently parked unless monetization strategy changes radically.

### B-18 — Hero Equipment Sets (More than 6)
- Launch ships with 6 sets. Future expansions can introduce new sets (e.g., Phoenix Set, Tide Set, Tempest Set).
- **Effort:** Low (data-driven once architecture is in)
- **Earliest candidate window:** Post-launch +1 month (first BP season)

### B-19 — Custom Compact-Mode Skin Pack
- Multiple compact-mode visual frames (TBH-style themes). Already proposed as Premium Shop item in monetization GDD.
- **Effort:** Low (graphics only)
- **Earliest candidate window:** Post-launch +1 month

### B-20 — Mobile Port
- Touchscreen UI, mobile-specific battery / data considerations.
- **Effort:** Very Large
- **Note:** PC-first decision locked. Revisit only after PC succeeds.

### B-21 — Console Port (Steam Deck verified, then console)
- Steam Deck "Verified" badge is achievable quickly (controller support + 720p compact mode). Full console ports (PS5 / Xbox / Switch) are large.
- **Effort:** Steam Deck = small; console = Large
- **Earliest candidate window:** Steam Deck within 2-4 months; console post-launch +12 months

---

## Live-Ops & Events (post-launch content)

### B-22 — Seasonal Events (limited stages)
- Limited-time stages with unique rewards, mini-bosses, banners.
- **Effort:** Per-event = 2-4 weeks design + content
- **Earliest candidate window:** Post-launch +1 month (first event season)

### B-23 — Crossover Events
- Branded crossovers with other gacha games. Marketing lever.
- **Effort:** Large (legal, content production)
- **Earliest candidate window:** Post-launch +6+ months, market-driven

### B-24 — Endless / Roguelike Mode
- Procedural endless climb beyond Tower of Trials. Different from Tower in that floors are procedural, not curated.
- **Effort:** Medium-Large
- **Earliest candidate window:** Post-launch +6 months

### B-25 — Guild Wars / Mass Boss Events
- Out of scope (single-player); see B-10.

---

## Technical / Infrastructure

### B-26 — Server-Side Combat Validation (full)
- v1 has server-side gacha + IAP + leaderboard validation. v2 could validate every combat for ladder integrity.
- **Effort:** Large
- **Earliest candidate window:** When ladder cheating becomes a problem.

### B-27 — Public Game API
- Allow third-party tools (e.g., damage calculators, build planners) to read public game data.
- **Effort:** Medium
- **Earliest candidate window:** Post-launch +6 months, community-driven

### B-28 — Player Profile Page (public/shareable)
- Public-facing profile with stats, hero collection, achievements. Sharable URL.
- **Effort:** Medium (web frontend + auth + privacy controls)
- **Earliest candidate window:** Post-launch +3 months

### B-29 — Tournament Mode / Speedrun Leaderboards
- Curated competitive modes. Out of v1 scope.
- **Effort:** Medium
- **Earliest candidate window:** Post-launch +6+ months

---

## Tracking

This backlog is **not a roadmap**. It's a list of options that have been considered and parked. Promote items to the active roadmap only when:

1. Player-data justifies the feature (telemetry shows demand or correlation with retention)
2. Capacity exists in the team
3. The feature aligns with current goals
