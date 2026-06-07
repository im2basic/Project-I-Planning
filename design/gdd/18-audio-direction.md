# GDD 18 — Audio Direction

> Entire GDD is NEW. All content highlighted. Placeholder content — user is providing assets later; this is the specification.

## 1. Overview

<mark>Project I's audio is intentionally minimal and unobtrusive — players are running the game in the background while working. Combat is musically simple, satisfying SFX-driven; music swells only on bosses, ultimates, and key moments. **No voice acting in v1.**</mark>

## 2. Player Fantasy

> *I can have the game open all day without my ears getting tired. When something exciting happens — a critical, an Ultimate, a 5★ pull — I notice it.*

## 3. Detailed Rules

### 3.1 SFX Taxonomy

<mark>

**UI sounds:**
- Button hover, button press, tab open, modal open/close, menu navigation
- Notification chime (subtle), error tone (subtle)

**Combat sounds:**
- Basic attack (per weapon type — sword, bow, staff, etc.)
- Skill cast (per element — Fire whoosh, Water splash, Wind sweep)
- Hit impact (light, heavy, critical, blocked)
- Damage number (small jingle on crit only)
- Status effect application (each effect has signature sound)
- Hero KO (low thud)
- Wave clear (mild flourish)
- Boss appearance (distinct cue)
- Boss enrage (warning sting)

**Reward sounds:**
- Loot pickup (rarity-tiered — Common = soft, Mythic = celebratory)
- Egg hatch (distinctive crack + fanfare for Epic+)
- Shrine collect (gold-shower sound, satisfying)
- Level up (bright chord)
- Skill upgrade (twinkle)
- Achievement unlock (medium fanfare)

**Gacha sounds:**
- Pull start (drum roll-equivalent)
- Pull result reveal — rarity-tiered:
  - Rare: subtle bell
  - Epic: warm chord
  - Legendary: massive celebratory cue (extends into the splash art reveal)

**Window / system sounds:**
- Window snap to edge (subtle click)
- Compact ↔ Expanded transition (brief whoosh)
- Tray show / hide (subtle)

</mark>

### 3.2 Music

<mark>

**Music cues:**
- **Main menu / loading** — atmospheric, soft, looping
- **Compact mode background** — extremely soft ambient layer (toggleable per player; default OFF for performance)
- **Expanded mode menus** — slightly more present ambient
- **Campaign combat** — per-act theme (Act 1 = forest/whimsical, Act 2 = volcanic/intense, Act 3 = oceanic/somber)
- **Boss fights** — unique theme per chapter boss
- **Tower of Trials** — escalating theme that intensifies every 10 floors
- **Boss Rush** — gauntlet theme
- **Hero Trials** — per-element theme

**No voice acting in v1.** Hero "voice triggers" are reserved in UI layout but no audio shipped. Sound design substitutes for voice (e.g., on Ultimate cast, a distinctive elemental flourish plays instead of a hero shout).

</mark>

### 3.3 Mixing Bus

<mark>

| Bus | Default Volume | Player-adjustable |
|-----|----------------|-------------------|
| Master | 100 | Yes |
| Music | 60 | Yes |
| SFX | 80 | Yes |
| Voice (placeholder) | 80 | Yes |
| UI | 70 | Yes |

Mixing rules:
- SFX has slight ducking when Ultimate animation plays (so the Ultimate cue is the focal point)
- Music dips during boss enrage (so the warning is heard)
- Critical hit SFX has a distinct attack envelope (sharp transient)
- Compact mode audio at 70% of expanded volume by default (background-friendly)

</mark>

### 3.4 Asset Specs (for production)

<mark>

| Asset type | Format | Duration | Sample rate |
|------------|--------|----------|--------------|
| UI sounds | .wav / .ogg | < 1s | 44.1 kHz |
| Combat SFX | .wav / .ogg | < 2s | 44.1 kHz |
| Music loops | .ogg | 1-3 min loops | 44.1 kHz, stereo |
| Boss themes | .ogg | 2-4 min | 44.1 kHz, stereo |

Compression target: ~64-128 kbps OGG Vorbis for music, lossless or 192k for SFX.

</mark>

### 3.5 Localization-Aware

For v1, no voice acting means localization audio scope is minimal. If voice acting is added post-launch (it likely will be for at least the popular Asian-market locales), the system needs:

- VO triggers wired in code at all hero-ability points
- VO key naming convention: `hero.{heroId}.{abilityKey}.{lineIndex}`
- Fallback to silent if locale doesn't have VO

(See `gdd/19-localization-plan.md`.)

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Effective output volume | `MasterVol × BusVol × IndividualSourceVol` (all 0-100 scaled) |
| SFX ducking under Ultimate | -30% for the duration of the Ultimate animation |
| Music dip on boss enrage | -20% for 5 seconds |

## 5. Edge Cases

- **Multiple SFX overlap:** mixer caps simultaneous voices at 8 SFX channels; oldest is dropped.
- **System audio device change:** Unity auto-detects and continues. No save state needed.
- **All audio muted:** game functions normally; UI silent toggle indicator visible.
- **Music file fails to load:** silent fallback; log warning.

## 6. Dependencies

- `15-desktop-window-ux.md` — volume sliders, mute toggle
- `19-localization-plan.md` — future VO localization
- `01-combat.md` — combat SFX triggers
- `05-gacha-and-currencies.md` — gacha pull audio cues
- `06-idle-and-shrine.md` — Shrine collect SFX

## 7. Tuning Knobs

- Default volume per bus (3.3)
- Ducking magnitudes (3.3)
- Music loop lengths (3.2)
- Compact-mode music default (currently OFF)

## 8. Acceptance Criteria

1. ✅ <mark>All UI sound sliders adjust the corresponding bus.</mark>
2. ✅ <mark>Master mute silences all audio.</mark>
3. ✅ <mark>Different rarity gacha pulls produce distinct cues.</mark>
4. ✅ <mark>Per-act music themes play in the correct chapters.</mark>
5. ✅ Boss enrage music dip works.
6. ✅ <mark>Compact mode music respects its independent default.</mark>
