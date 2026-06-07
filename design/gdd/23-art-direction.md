# GDD 23 — Art Direction (PLACEHOLDER)

> **Status:** PLACEHOLDER. User is producing art separately and will provide assets later. This file documents the **questions to answer** + the **constraints already implied** by existing design.

## 1. Overview

Project I's visual identity is the foundation of the desktop window paradigm. The compact mode is what players see most — it must feel charming and unobtrusive. The expanded mode is where premium art lives.

## 2. Constraints already implied by existing design

These are NOT decisions yet — they're inferred from existing hero/system docs. The art director should treat them as starting hypotheses.

| Implication | From which doc |
|-------------|----------------|
| Stylized chibi sprites for combat | `gdd/15-desktop-window-ux.md` — chibi animations referenced |
| Full splash art for each 5★ hero | Source PDF + hero sheets |
| Compact window 480×160 px | `gdd/15-desktop-window-ux.md` |
| Background size 960×320 (compact-mode strips) | Source PDF asset list |
| Splash art uses anime-stylized illustration (implied by source PDF descriptions) | Hero sheets |
| 3 elemental color identities (Fire = red/orange, Water = blue/teal, Wind = green/white) | All hero sheets |
| Element + class icons exist | Source PDF |
| UI must scale 100% / 125% / 150% | `gdd/15-desktop-window-ux.md` § 3.7 |

## 3. Areas needing definition

### 3.1 Overall aesthetic

- Anime-stylized? Semi-realistic? Cute-chibi? Painterly?
- Lighting tone — soft & warm, neon & saturated, dark & moody?
- Target reference games for the art lead to look at? (e.g., Honkai Star Rail, AFK Arena, Disgaea, etc.)

### 3.2 Compact mode visuals

- Pixel art vs. low-resolution rendered sprites vs. high-res sprites downsampled?
- How much animation budget per chibi (frame count, particle density)?
- Background art treatment — parallax layers? Static? Looping ambient?
- Damage number style — flat? Animated? Color-coded by crit?

### 3.3 Expanded mode visuals

- HD chibi sprites (different from compact) OR same chibis up-rezzed?
- Splash art always visible on character menu? In what frame treatment?
- Skill icons style — flat, embossed, painterly?
- Status effect icons style

### 3.4 UI visual language

- Button shape — rounded rectangle? Plate-style? Hexagonal?
- Typography — display font (logo / headers), UI font (buttons), body font (descriptions)
- Border treatments — ornamental, minimal, glassmorphic?
- Color palette — primary background, primary accent, gold/legendary glow, error red, success green
- Hero card layout template (must work for all 15+ 5★ + 15 4★ heroes)
- Gacha pull animation aesthetic — crystals, lights, banners?
- Menu transitions — cuts, fades, parallax?

### 3.5 VFX style

- Particle density — sparse (low-end PC friendly) or rich (showpiece)?
- Element VFX language:
  - 🔥 Fire — flames? embers? phoenix imagery? lava?
  - 💧 Water — waves? bubbles? ice crystals? oceanic glow?
  - 🌪 Wind — leaves? wind lines? feathers? spirit butterflies?
- Critical hit VFX — screen-flash? screen-shake? slow-mo zoom?
- Ultimate VFX — full-screen takeover? Hero portrait reveal? Skill-banner card?
- Boss appearance VFX — distinct camera punch?

### 3.6 Iconography

- Skill icons (one per skill, ~24 unique per launch hero × 4 = 60+ icons)
- Element icons (3 — variants for small / large display)
- Class icons (5)
- Status effect icons (~17 from `gdd/01-combat.md` § 3.13)
- Equipment slot icons (7)
- Sub-stat icons (~11)
- Set bonus icons (6)
- Currency icons (Gold, Gems, Crystals, Hero Essence, Hero Shards, Tower Coin, plus material icons)

### 3.7 Animation principles

- Idle animation style (subtle breathing, looping action, dynamic pose?)
- Skill animation timing per skill type (basic / skill 1 / skill 2 / ultimate)
- Ultimate "camera moment" — Y/N?
- Death animation poetic vs. functional?

### 3.8 Branding / marketing assets

- Game logo
- Steam capsule art
- Splash screen art (game launches with...)
- Trailer style guide
- Social media tile templates

## 4. Asset budget guidelines

(Recommended targets — art director to confirm)

| Asset type | Per hero | For 15 5★ | For 15 4★ |
|-----------|----------|-----------|-----------|
| Splash art | 1 (3000×4000 px reference) | 15 | 15 |
| Hero card | 1 (600×900 px) | 15 | 15 |
| Chibi idle sheet | 1 (4 frames) | 15 | 15 |
| Chibi attack sheet | 1 (5-6 frames) | 15 | 15 |
| Chibi skill 1 sheet | 1 (5-6 frames) | 15 | 15 |
| Chibi skill 2 sheet | 1 (5-6 frames) | 15 | 15 |
| Chibi ultimate sheet | 1 (6 frames) | 15 | 15 |
| Chibi death sheet | 1 (5 frames) | 15 | 15 |
| Ultimate art / banner | 1 | 15 | optional for 4★ |
| Skill icons | 4 (basic + 3 skills) | 60 | 60 |

Total per-hero art: ~7-8 sheets + 1 splash + 1 card + icons.

## 5. Open questions for the art director

Before art production begins:

1. Reference games? Three art-style references the team agrees represents the target.
2. Style consistency check — chibi style vs. splash style — should they look "by the same artist"?
3. Color palette per element — exact hex values?
4. Logo / brand identity — does Project I have a final logo by launch?
5. Compact-mode visual identity — is the compact window itself a styled "frame" with skin choices? (See `gdd/14-monetization.md` — compact window themes as a cosmetic item.)

## 6. Dependencies

- `gdd/15-desktop-window-ux.md` — compact + expanded sizes and constraints
- `gdd/18-audio-direction.md` — pairs with visual identity for tone
- Every hero sheet — visual identity per character
- `gdd/22-boss-design.md` — boss visual theme guard rails (also TBD)

## 7. Acceptance Criteria (once filled)

1. ⏳ Art Bible document exists with style references and core palettes
2. ⏳ Reference reels assembled (chibi, splash, UI, VFX)
3. ⏳ All asset templates locked (hero card, skill icon, status icon, etc.)
4. ⏳ Pipeline / file format standards documented
5. ⏳ Cosmetic skin pipeline plan defined (for post-launch BP rewards)
