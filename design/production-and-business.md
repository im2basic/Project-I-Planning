# Project I — Production & Business Plan

> Sits alongside the design docs (`design/gdd/*`) but covers business, legal, marketing, engineering process, QA, customer support, analytics, community, and post-launch ops. Not a game-design doc — a **company / process** doc.

---

## 1. Engineering / Tech ADRs

(ADR = Architecture Decision Record. Lock these before writing serious code.)

### 1.1 Engine
- **Unity 2023 LTS** (or 6.0 LTS once stable)
- Built-in render pipeline for compact mode (lightweight)
- URP for expanded mode if richer visuals are needed
- Skip HDRP — overkill for chibi 2D game

### 1.2 C# / coding standards
- C# 10+
- Nullable reference types enabled
- `dotnet format` enforced in CI
- Folder structure: `Assets/Project/Scripts/<system>/`
- Unit tests in `Tests/<system>Tests/`
- One file per class. Internal classes for collaborators.

### 1.3 Save format
- JSON serialized via Newtonsoft.Json (or System.Text.Json on .NET 7+)
- Obfuscation: XOR cipher with player-derived key
- Checksum: SHA-256
- See `design/gdd/17-save-system.md` for full spec

### 1.4 Asset management
- Unity Addressables (NOT Resources)
- Remote content delivery NOT required at launch (single-build app)
- Lazy-load splash arts, chibi sheets per hero
- Preload tutorial assets

### 1.5 Networking
- Steamworks.NET for Steam integration
- No game-server architecture (single-player, server-validated state only)
- Custom config server: Firebase Remote Config OR AWS Lambda + S3
- IAP validation: server-side via Steam Web API

### 1.6 Audio
- Wwise OR FMOD (Wwise free for ≤200 SFX assets, FMOD free for indie under $500k revenue)
- OGG Vorbis for music, WAV/OGG for SFX

### 1.7 UI
- Unity UI Toolkit (UI Builder + USS) for expanded mode — modern, performant
- Compact mode: hand-laid UI via canvas + sprite (small surface area, doesn't need toolkit complexity)

### 1.8 CI/CD
- GitHub Actions for build pipeline
- Builds: Windows x64 (launch), macOS (post-launch)
- Automated unit tests on PR
- Asset bundle builds nightly
- Steam Build Tools for upload

### 1.9 Crash & error tracking
- **Sentry** (or Unity Cloud Diagnostics) integrated from Day 1
- Stack-trace deobfuscation enabled
- PII-stripped reports

### 1.10 Analytics
- **PostHog** (open-source, GDPR-friendly) OR **GameAnalytics** (gacha-friendly free tier)
- Event taxonomy from `design/gdd/21-liveops-and-telemetry.md` § 3.4

---

## 2. Legal & Compliance

### 2.1 Required documents (lawyer-drafted before launch)

| Document | Status |
|----------|--------|
| End-User License Agreement (EULA) | ⏳ Need draft |
| Privacy Policy | ⏳ Need draft (GDPR + CCPA + PIPEDA compliant) |
| Terms of Service | ⏳ Need draft |
| Refund Policy | ⏳ Need draft (Steam policy compliant) |
| Cookie Policy (if web companion) | ⏳ If applicable |
| Open Source Licenses page | ⏳ Auto-generate from package.json equivalents |

### 2.2 Content rating
- **ESRB** (North America): Submit for "E10+" or "Teen" rating depending on combat tone
- **PEGI** (Europe): Submit for "PEGI 7" or "PEGI 12"
- **USK** (Germany): Submit
- **CERO** (Japan): Submit if Japanese localization planned

Rating submissions take 2-6 weeks. Plan ahead.

### 2.3 Compliance frameworks

- **GDPR** (EU): Privacy policy, data export, right-to-be-forgotten — addressed in `design/gdd/17-save-system.md` § 3.8 + `gdd/21-liveops-and-telemetry.md`
- **CCPA** (California): Similar requirements
- **COPPA**: If under-13 users — Project I targets 13+ minimum (set Steam age gate accordingly)
- **PCI-DSS**: Payment data — Steam handles this; we never see credit card numbers
- **DSA (EU Digital Services Act)**: If user-generated content emerges — N/A at launch

### 2.4 Gacha disclosure laws (per region)

| Region | Requirement |
|--------|-------------|
| Japan | Disclose all gacha rates publicly (we do — `gdd/05-gacha-and-currencies.md`) |
| South Korea | Same |
| China | If launching there, requires version + government approval (separate process) |
| Belgium | Loot boxes banned — region-restrict purchases OR exclude from Belgian sales |
| Netherlands | Loot boxes restricted — same handling |

**Decision:** Geo-block Crystal purchases in Belgium and Netherlands. Players can still play F2P.

### 2.5 Trademark
- "Project I" is a working title. Final game name needs:
  - Trademark search (USPTO, EUIPO, JPO)
  - Domain registration (.com, .gg, .net)
  - Steam URL slug reservation

---

## 3. Marketing & Store Page

### 3.1 Steam page assets needed (~6 weeks before launch)

- **Header capsule** (1920×620)
- **Library capsule** (600×900)
- **Hero capsule** (1840×930)
- **Main capsule** (616×353)
- **Small capsule** (296×175)
- **Page background** (1438×810)
- **Screenshots** (1920×1080) — minimum 5, recommended 8-12
- **Trailer** (30s-2min, 1920×1080, MP4)
- **Animated GIFs** (optional, increases conversion)
- **Game logo** (transparent PNG)
- **Page description** (short + long)
- **Tags** (e.g., Idle, Gacha, RPG, Anime, Free to Play, Singleplayer, Turn-Based, 2D)

### 3.2 Trailer outline (30-60 second cut)

1. **0-3s** — Compact window appears on desktop (TBH-style hook — visual differentiation)
2. **4-15s** — Quick montage: Lyria firing arrows, Emberia AoE flames, gacha pull animation, Tower climb, character roster
3. **16-25s** — Voice-over / text: "Idle in your taskbar. Battle when you want. Build the team you dream of."
4. **26-30s** — Logo + "Launching [date] on Steam" CTA

### 3.3 Soft launch strategy

**Option A** — Open Steam Early Access in 2-3 small English-speaking regions (e.g., Canada, Australia, NZ)
- Pros: Real feedback before global launch; preserves day-1 cleanliness for major markets
- Cons: Splits attention; piracy / region-shopping risk

**Option B** — Closed Beta via Steam Playtest (~500-2,000 players)
- Pros: Free, low-risk, signed NDAs possible
- Cons: Self-selected hardcore players, not representative

**Option C** — Direct global launch with rapid post-launch hotfix capability
- Pros: Single moment of attention, easier marketing
- Cons: Bugs visible to everyone

**Recommendation:** Option B (closed beta 4-6 weeks pre-launch) then Option C (global launch). Use hot-config to tune balance based on beta data.

### 3.4 Content creator strategy

- Outreach to YouTubers / Twitch streamers in the gacha + idle game niche 4-6 weeks before launch
- Provide early access keys + ~$50 of in-game gem packs for content creation
- Offer banner exclusives at affiliate / creator events
- Target list: ~20-50 mid-tier creators (10k-200k followers) over 3-5 mega creators

### 3.5 Community channels

| Channel | Launch Status | Purpose |
|---------|---------------|---------|
| **Discord** | Live 4 weeks pre-launch | Closed beta coordination, community building, support channel |
| **Reddit** (`r/ProjectI` or similar) | Live 2 weeks pre-launch | Long-form discussions, memes, guides |
| **Twitter/X** | Live 2 weeks pre-launch | Patch notes, hype posts, banner announcements |
| **TikTok** | Optional | Short-form gameplay clips |
| **YouTube** (official channel) | Live with trailer | Trailers, dev diaries, tutorials |
| **Website / Landing page** | Live 4 weeks pre-launch | Newsletter signup, Steam wishlist CTA |

### 3.6 Pricing strategy

- Base game: **Free to play** (F2P)
- Monetization per `gdd/14-monetization.md`
- **Wishlist target before launch:** 30,000-50,000 (industry rule of thumb for indie F2P)
- **Regional pricing:** Use Steam's recommended tiers — don't undercut, don't overprice
- **Launch discount:** none (F2P has no base price to discount); but a "Launch Founder Pack" ($14.99-$24.99) is a viable one-week-only purchase

---

## 4. QA & Test Process

### 4.1 Test environments

- **Dev** — daily builds, local testing
- **Staging** — bi-weekly QA builds, automated test pass
- **Beta** (closed) — externally distributed via Steam Playtest
- **Production** — live Steam build

### 4.2 Test types

| Test type | Owned by | Cadence |
|-----------|----------|---------|
| Unit tests (combat formulas, gacha rates, save serialization) | Engineering | Every commit (CI) |
| Integration tests (state transitions, IAP, cloud save) | Engineering | Every PR |
| Smoke tests (game launches, tutorial completable) | QA | Daily on dev builds |
| Regression suite (known-bug list) | QA | Pre-release builds |
| Manual playtest (full gameplay session) | QA + designers | Weekly |
| Localization QA | Localization team | Per-locale release |
| Platform certification (Steam Deck Verified) | Engineering + QA | Pre-launch + per-version |
| Compliance check (rate disclosures, refund flow) | Legal + QA | Pre-launch |

### 4.3 Bug tracking
- **Linear** or **Jira** or **GitHub Issues** — pick one
- Severity levels:
  - **P0 (Blocker)** — Crash / data loss / IAP broken → fix within 24h
  - **P1 (Critical)** — Major feature broken → fix within 1 week
  - **P2 (Major)** — Important issue, no workaround → fix within sprint
  - **P3 (Minor)** — Polish / cosmetic → fix when convenient
  - **P4 (Trivial)** — Backlog

### 4.4 Test plan template

For each launch feature (BP, Gacha, Tower, etc.):
1. Happy path test cases
2. Edge cases (boundary values, empty states, max values)
3. Error states (no internet, save corrupted, etc.)
4. Performance tests (memory, FPS in compact mode)
5. Compatibility tests (Win 10 / Win 11, integrated graphics, low-RAM PC)

---

## 5. Customer Support

### 5.1 Tooling
- **Helpshift** (specialized for games) OR **Zendesk** (general SaaS) — pick before launch
- Integrated SDK in-game for ticket submission
- Email fallback: `support@<projectname>.gg`

### 5.2 Response time SLA
- **Billing issues:** 48 hours
- **Account / data loss:** 72 hours
- **General gameplay:** 7 days
- **Bug reports:** acknowledged within 7 days

### 5.3 FAQ articles (launch-ready)

20 articles ready Day 1:
- How does gacha work?
- What is pity?
- How do I get Apex Catalyst?
- How does the Battle Pass work?
- How do I refund a purchase? (links to Steam policy)
- Why is the game in my taskbar?
- Can I play on Mac?
- How do I report a bug?
- I lost my account / I want to delete my account
- Cross-platform save?
- (10 more covering common questions)

### 5.4 Response templates

Pre-written responses for common scenarios:
- Refund denied (item already consumed)
- Account recovery
- Compensation gift
- Server downtime explanation
- Cheating accusation handling

### 5.5 Escalation path

Tier 1 (support agent) → Tier 2 (senior support) → Tier 3 (engineering / community manager) → Tier 4 (legal / executive)

---

## 6. Analytics & Data

### 6.1 Stack

| Layer | Tool |
|-------|------|
| Event collection | PostHog SDK / GameAnalytics SDK |
| Crash reporting | Sentry |
| Server logs | CloudWatch / Datadog |
| BI / dashboard | PostHog dashboards OR Metabase + Postgres |
| A/B testing | PostHog feature flags OR custom |

### 6.2 Key dashboards (build pre-launch)

1. **Funnel:** Install → Tutorial Complete → First Pull → First Purchase
2. **Retention:** D1, D7, D14, D30 cohort curves
3. **Monetization:** ARPU, ARPPU, conversion rate, top-spender distribution
4. **Engagement:** DAU, session length, sessions per day, idle session %
5. **Content:** Stage completion rates, Tower floor reach distribution, BP tier reach
6. **Performance:** Crash-free session %, average FPS by mode
7. **Gacha health:** Pity hit rate, Legendary distribution by source

### 6.3 KPI targets (launch + 30 days)

| Metric | Target |
|--------|--------|
| D1 retention | 35-45% |
| D7 retention | 20-25% |
| D30 retention | 8-12% |
| D1 conversion (any spend) | 2-3% |
| Tutorial completion | 75-85% |
| Avg session length | 8-15 minutes |
| ARPPU (paying users) | $30-60 lifetime |
| Crash-free session % | 99.5%+ |

If hitting **below 50% of any** target after 14 days → emergency review meeting.

---

## 7. Team Structure (Required Roles)

(These are the suggested roles needed. Sizes vary based on budget.)

| Role | Min Headcount | Responsibilities |
|------|---------------|------------------|
| Game Director / Producer | 1 | Vision, priorities, schedule |
| Game Designer | 1-2 | Mechanics, balance, content |
| Lead Engineer | 1 | Architecture, tech direction |
| Engineers (Unity / C#) | 2-4 | Implementation |
| Tools Engineer | 0-1 | Internal tools, build pipeline |
| Lead Artist / Art Director | 1 | Style guide, art bible |
| Artists (chibi, splash, UI) | 2-4 | Hero / boss / UI art |
| Animator | 1-2 | Chibi animations, VFX motion |
| VFX Artist | 0-1 | Particle systems, skill VFX |
| Audio Designer | 0-1 | SFX library, music direction |
| UI/UX Designer | 1 | Layouts, wireframes |
| QA Lead | 1 | Test strategy, regression suite |
| QA Testers | 1-2 | Manual testing |
| Community Manager | 0-1 | Discord, social, content creator outreach |
| Customer Support | 0-2 | Ticket handling (post-launch grows) |
| Localization Lead | 0-1 | When adding locales |
| Marketing | 0-1 | Steam page, ads, partnerships |
| Legal | Contract | EULA, privacy, compliance |

Solo / two-person team: combine roles. A two-person studio (one engineering + one design/art) can absolutely ship Project I — many indie gachas have shipped this way.

---

## 8. Release Timeline & Milestones

(Template — adjust to actual schedule.)

| Phase | Duration | Goal |
|-------|----------|------|
| **Pre-production** | 3 months | All GDDs locked (✅ this phase complete), engine setup, art bible, tech ADRs |
| **Vertical slice** | 2 months | One playable chapter + tutorial + basic gacha + idle. Validates core loop. |
| **Production Alpha** | 6 months | All 12 chapters playable, 10 heroes implemented, BP/Tower/Expedition functional, but rough |
| **Beta / Closed Playtest** | 2 months | Polished, missing some content. ~500 external testers via Steam Playtest |
| **Pre-launch hardening** | 1 month | Final QA, certification, store page finalization, marketing push |
| **Launch** | 1 week | Day 1 + first week monitoring + hotfix readiness |
| **Post-launch ops** | Ongoing | Banners every ~3-4 weeks, BP seasons every 60 days, balance patches |

**Total pre-launch: ~14-16 months** from end of design phase.

### Critical milestones (with owners)
- 🎯 Vertical slice playable internally (validates "the game is fun")
- 🎯 First playtest external (validates "players get it")
- 🎯 All 10 launch heroes implemented + balanced
- 🎯 Tower of Trials Season 1 fully populated (100 floors)
- 🎯 BP Season 1 fully populated (50 tiers)
- 🎯 Localization-ready (string extraction complete, even if EN only)
- 🎯 Compliance & legal approved
- 🎯 Steam page approved + wishlist drive started
- 🎯 Content creator outreach complete
- 🎯 Soft launch / closed beta
- 🎯 Launch day

---

## 9. Risk Management

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Cheaters edit save → bypass IAP | Lost revenue | Medium | Tamper detection (`gdd/17-save-system.md`); IAP validation server-side |
| Compact window concept doesn't resonate | Bad reviews | Medium | Beta playtest validates ASAP; have expanded-mode as fallback |
| Apex Catalyst supply tuning wrong | Player frustration OR power inflation | High | Hot-config; adjust within 2 weeks of telemetry signal |
| Battle Pass season can't be authored in time | Live-ops gap | Medium | First 3 BP seasons authored before launch |
| Steam algorithm doesn't favor F2P | Low organic traffic | High | Strong wishlist push + content creator partnerships |
| Cloud save conflict bugs | Player data loss perception | Medium | Conflict resolution UI; preserve discarded saves for 30 days |
| Server downtime breaks gacha | Players furious | Low | Local fallback for config; queue purchases offline |
| Localization missing market | Reduced global reach | Medium | EN-first; CJK + EU as post-launch wave |
| Belgium/NL gacha ban affects sales | Minimal revenue impact | Confirmed | Geo-restrict IAP, allow F2P |

---

## 10. Post-Launch Live-Ops Model

### 10.1 Patch cadence
- **Hotfix:** as needed (P0/P1 issues, hot-config tweaks) — same-day to 1-week
- **Minor patch:** every 2 weeks (balance changes, small QoL, bug fixes)
- **Major content patch:** every 4-6 weeks (new banner, new BP season transitions, new chapter)

### 10.2 First-year content roadmap (recommendation)

| Month | New Content |
|-------|-------------|
| Month 1 (launch) | Day-1 content per `gdd/24-day-1-launch-content.md` |
| Month 2 | Banner #2 (e.g. Ragnar or Mei Lin), first limited event (e.g. "Phoenix Rite" mini-stage) |
| Month 3 | BP Season 2, Banner #3, first chapter content drop (Chapter 13 if ready) |
| Month 4 | Banner #4, "Tower Echoes" (Tower variant mode), first cosmetic shop rotation |
| Month 5 | BP Season 3, Banner #5, first 4★ designs released |
| Month 6 | Half-year anniversary event, free 5★ pick, Banner #6 |
| Month 7-12 | Continue cadence; introduce new endgame (Hero Trials new tier, Boss Rush Hell unlock) |

### 10.3 Community ops
- Weekly Discord dev update (every Friday)
- Monthly newsletter (mid-month)
- Quarterly producer's letter (state of the game)

### 10.4 Hotfix decision tree

When a P0 bug is detected:
1. Acknowledge in Discord within 1 hour
2. Hot-config workaround if possible (no app patch)
3. If client patch required: target same-day deployment
4. Post-mortem and compensation mail within 48 hours
5. Public patch notes published

---

## 11. Budget (rough planning template)

(Numbers are placeholders — fill in based on actual budget.)

| Category | Pre-launch | Year 1 Live-Ops |
|----------|------------|------------------|
| Team salaries | $300k-$1M (small team) | $400k-$1.5M |
| Art outsourcing (chibis, splashes, BP skins) | $50k-$150k | $100k-$300k |
| Audio (SFX library + music) | $10k-$50k | $20k-$50k |
| Tooling (Unity Pro, Sentry, Helpshift, etc.) | $10k-$30k | $10k-$30k |
| Marketing (ads, content creators, events) | $20k-$100k | $50k-$300k |
| Legal | $10k-$30k | $5k-$15k |
| Steam fees | $100 (one-time per app) | 30% revenue share |
| Servers (config, telemetry) | $5k-$15k | $10k-$50k |
| QA outsourcing (LQA, certification) | $10k-$30k | $5k-$20k |
| Contingency | 15-20% | 15-20% |

---

## 12. Acceptance Criteria (this doc)

1. ✅ All engineering ADRs documented (§ 1)
2. ✅ Legal requirements listed (§ 2)
3. ✅ Marketing checklist provided (§ 3)
4. ✅ QA process defined (§ 4)
5. ✅ Customer support model defined (§ 5)
6. ✅ Analytics stack picked (§ 6)
7. ✅ Team roles enumerated (§ 7)
8. ✅ Release timeline template ready (§ 8)
9. ✅ Risk register populated (§ 9)
10. ✅ Live-ops model defined (§ 10)
11. ✅ Budget template provided (§ 11)
