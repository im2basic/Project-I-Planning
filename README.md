# Project I — Planning

This repo contains the **pre-production design plan** for Project I — a Unity desktop idle gacha turn-based hero collector RPG.

The Unity source code lives in a **separate** repo. This repo is design + planning only — Markdown docs and a rendered PDF.

---

## 📖 Where to start

1. **Read [`design/Project-I-Master-Plan.pdf`](./design/Project-I-Master-Plan.pdf)** — 290-page rendered master plan with all systems, hero sheets, and a yellow highlight on every change from the source PDF.
2. **For Unity setup on a new machine,** read [`design/unity-setup-guide.md`](./design/unity-setup-guide.md).
3. **For day-to-day reference,** browse the Markdown source in `design/`.

---

## 📁 Repo structure

```
Project-I-Planning/
├── README.md                                # This file
├── build-pdf.sh                              # Rebuild the PDF from source
└── design/
    ├── Project-I-Master-Plan.pdf            # Rendered master plan (output)
    ├── project-i-master-plan.md             # Top-level design overview
    ├── CHANGELOG-from-source-PDF.md         # Every change vs. the source PDF
    ├── BACKLOG.md                            # Deferred features
    ├── production-and-business.md           # Engineering, legal, marketing, QA, support
    ├── unity-setup-guide.md                  # Step-by-step Unity setup
    ├── .render-style.css                     # PDF render styling
    ├── gdd/                                  # 25 game design documents
    │   ├── 01-combat.md                      # Combat, damage formula, auto-AI, formation
    │   ├── 02-elements-and-classes.md        # 3-element triangle, 5 classes
    │   ├── 03-stats-and-progression.md       # 7 stats, Level/Star/Awaken/Skill
    │   ├── 04-equipment.md                   # Slots, sub-stats, set bonuses
    │   ├── 05-gacha-and-currencies.md        # Banners, pity, wishlist
    │   ├── 06-idle-and-shrine.md             # Idle rewards, Shrine
    │   ├── 07-eggs-and-fusion.md             # Egg incubation, fusion ladder
    │   ├── 08-inventory-and-storage.md       # Storage caps, locks, bulk
    │   ├── 09-campaign-structure.md          # 12 chapters × 4 difficulties
    │   ├── 10-tower-of-trials.md             # 100-floor monthly mode
    │   ├── 11-world-map-expedition.md        # Dispatch missions
    │   ├── 12-daily-weekly-loops.md          # Dailies, weeklies, Hero Trials, Boss Rush
    │   ├── 13-battle-pass.md                 # 50-tier, 60-day BP
    │   ├── 14-monetization.md                # Crystal packs, Monthly Card, bundles
    │   ├── 15-desktop-window-ux.md           # Compact/Expanded/Tray modes, settings
    │   ├── 16-tutorial-onboarding.md         # Lyria as starter, 9-stage tutorial
    │   ├── 17-save-system.md                 # Local + Steam Cloud, anti-tamper
    │   ├── 18-audio-direction.md             # SFX taxonomy, music cues
    │   ├── 19-localization-plan.md           # String tables, EN→CJK/EU
    │   ├── 20-ui-menus-tabs.md               # 14 top-level tabs, mail/inbox, codex
    │   ├── 21-liveops-and-telemetry.md       # Hot-config, telemetry, anti-cheat
    │   ├── 22-boss-design.md                 # 12 chapter bosses (PLACEHOLDER)
    │   ├── 23-art-direction.md               # Art bible questions (PLACEHOLDER)
    │   ├── 24-day-1-launch-content.md        # Full Day-1 lockdown
    │   └── 25-enemy-ai.md                    # 5-tier AI scaling system
    └── heroes/                               # Hero sheets (17 files)
        ├── README.md                         # Roster index
        ├── 4-stars-TBD.md                    # 4★ placeholder
        ├── valdrik.md                        # Fire Tank
        ├── emberia.md                        # Fire Mage
        ├── kaida.md                          # Fire Assassin
        ├── glacier.md                        # Water Tank
        ├── marina.md                         # Water Support
        ├── neria.md                          # Water Mage
        ├── lyria.md                          # Wind Archer (MAIN CHARACTER)
        ├── sylphie.md                        # Wind Support
        ├── kael.md                           # Wind Assassin
        ├── auron.md                          # Water Archer (Launch Limited Banner)
        ├── ragnar.md                         # Fire Archer (Future Limited Banner)
        ├── akari.md                          # Fire Support (Future Limited Banner)
        ├── seraphina.md                      # Water Assassin (Future Limited Banner)
        ├── mei-lin.md                        # Wind Tank (Future Limited Banner)
        └── ayame.md                          # Wind Mage (Future Limited Banner)
```

---

## 🎮 Game summary

- **Engine:** Unity (Windows PC first; Mac later)
- **Genre:** Idle gacha turn-based hero collector RPG
- **Inspiration:** TBH (Task Bar Hero) for desktop window UX; Epic Seven / AFK Arena for combat depth
- **Launch roster:** 10 of 15 5★ heroes (9 Standard + Auron launch banner) + 15 4★ (designs TBD)
- **Combat:** Auto-paced turn-based; manual toggle in expanded mode; cooldowns in turns
- **Monetization:** F2P with Battle Pass + Monthly Card + Crystal packs + Limited Banner bundles + Dupe Shop
- **Gacha:** 0.6% Legendary / 7.2% Epic / 92.2% Rare; hard pity at 50 (no soft pity)
- **Endgame:** 100-floor Tower of Trials (monthly reset) + Expedition + Hero Trials + Boss Rush
- **PvP / Guilds / Multiplayer:** Out of scope for v1

See [`design/project-i-master-plan.md`](./design/project-i-master-plan.md) for the full vision.

---

## 🛠 Rebuilding the PDF

Requires `pandoc` and `weasyprint`:

```bash
brew install pandoc weasyprint
```

Then:

```bash
# Edit build-pdf.sh — replace REPLACE_WITH_REPO_ROOT with the absolute path to your cloned repo
# E.g., if cloned to ~/Documents/ProjectI/planning, replace with /Users/yourname/Documents/ProjectI/planning

./build-pdf.sh
```

The PDF will be regenerated at `design/Project-I-Master-Plan.pdf` with yellow highlights on all new-vs.-source content.

---

## 📋 Status

- ✅ Design phase complete (25 GDDs + 15 hero sheets)
- ✅ Day-1 launch content locked (`design/gdd/24-day-1-launch-content.md`)
- ⏳ Boss designs (12 chapter bosses) — placeholders only
- ⏳ Art direction (style guide / art bible) — placeholder only
- ⏳ 4★ hero designs (15) — user is producing separately
- ⏳ Unity project scaffolding — see `design/unity-setup-guide.md`

---

## License

All design documents in this repo are copyright Song / im2basic, all rights reserved.
