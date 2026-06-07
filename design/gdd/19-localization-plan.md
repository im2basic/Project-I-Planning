# GDD 19 — Localization Plan

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>**V1 ships English only**, but the entire codebase is built for localization from day one. **No hardcoded strings**. All text is resolved through a localization key system. Key naming convention is strict so future translators can work without seeing English.</mark>

## 2. Player Fantasy

> *When the Japanese / Korean / Chinese launch happens, the game feels native — not bolted-on.*

## 3. Detailed Rules

### 3.1 Architecture

<mark>

```
Source code:    LocalizationManager.Get("hero.lyria.skill1.name")
                                          ↓
String table:   { "hero.lyria.skill1.name": "Gale Piercer", ... }
                                          ↓
UI displays:    "Gale Piercer"
```

**Per-locale string table files:**
- `data/strings/en.json` (English)
- `data/strings/ko.json` (Korean — post-launch)
- `data/strings/ja.json` (Japanese — post-launch)
- `data/strings/zh-cn.json` (Simplified Chinese — post-launch)
- `data/strings/zh-tw.json` (Traditional Chinese — post-launch)
- `data/strings/es.json`, `data/strings/fr.json`, `data/strings/de.json` (EU rollout)

</mark>

### 3.2 Key Naming Convention

<mark>

```
{category}.{subcategory}.{specificKey}[.subKey]
```

Examples:
- `hero.lyria.name`
- `hero.lyria.title`
- `hero.lyria.skill1.name`
- `hero.lyria.skill1.description`
- `hero.lyria.passive.description`
- `combat.damageType.crit`
- `ui.menu.gacha.title`
- `ui.button.confirm`
- `ui.tooltip.element.fire`
- `gacha.banner.limited.title`
- `event.boss_rush.welcome`
- `settings.audio.master`
- `error.network.connection_lost`

Categories: `hero`, `enemy`, `stage`, `item`, `equipment`, `set`, `ui`, `combat`, `gacha`, `tower`, `expedition`, `bp`, `mission`, `achievement`, `tutorial`, `settings`, `notification`, `error`.

</mark>

### 3.3 Pluralization

<mark>

Some locales (Russian, Polish, Arabic, etc.) have complex plural forms. The system uses ICU MessageFormat:

```json
{
  "ui.inventory.item_count": "{count, plural, one {# item} other {# items}}"
}
```

Even if v1 ships English only, this format is used from day one to avoid retrofitting.

</mark>

### 3.4 Right-to-Left (RTL) Support

<mark>

Arabic and Hebrew are RTL languages. UI layout system must support:
- Automatic mirror of horizontal layouts (gacha banner → flips orientation)
- Text alignment flip (left-aligned ↔ right-aligned)
- Combat UI: party still on left; enemies on right (combat orientation is gameplay-canonical, not text-flow)

V1 does NOT ship Arabic. The framework supports it (not a retrofit).

</mark>

### 3.5 Text Variable Substitution

<mark>

Damage formula tooltips and other dynamic text use named substitutions:

```json
{
  "skill.damage_tooltip": "Deals {damageMultiplier}× ATK ({damageRange}) damage."
}
```

Variables are passed at call time:

```
LocalizationManager.Get("skill.damage_tooltip", {
  damageMultiplier: "2.20",
  damageRange: "1200-1800"
})
```

</mark>

### 3.6 Translator Briefing

<mark>

When a locale is added, translators receive:

- The full English string table (source of truth)
- A glossary of game-specific terms (elemental names, class names, currency names)
- Style guide for tone (Project I is "earnest fantasy", not ironic; serious but warm)
- Character voice notes (e.g., Sylphie speaks gently; Kael is taciturn)
- Length constraints per string (UI fits, etc.)
- Cultural sensitivity flags (any region-specific concerns)

</mark>

### 3.7 Locale-Specific Considerations

<mark>

| Locale | Notes |
|--------|-------|
| Japanese (ja) | Hero names may use both katakana and kanji; choose per-hero |
| Korean (ko) | Honorifics matter for hero dialogue |
| Chinese (zh-cn) | Simplified characters; some elemental terms have established translations |
| Chinese (zh-tw) | Traditional characters; Taiwanese gaming market is large |
| Spanish (es) | "Latin Spanish" (LATAM) is default; "Spain Spanish" (ES) optional later |
| Portuguese (pt-BR) | Brazilian market; separate from Continental Portuguese |
| French (fr) | Single locale at launch (no Quebec split) |
| German (de) | Direct translations work; some terms borrowed (e.g., "Pity") |
| Russian (ru) | Complex pluralization; post-launch |
| Arabic (ar) | RTL; post-launch |

</mark>

### 3.8 Asset Localization

<mark>

In-image text (e.g., logo, UI ornaments) should be **avoided where possible**. If an image contains text:
- Maintain per-locale versions
- Or use overlaid runtime text (preferred)

Audio (future VO) follows separate localization spec — see `gdd/18-audio-direction.md`.

</mark>

### 3.9 Localization Testing

<mark>

For each locale before release:
- All UI screens visited in test mode with that locale
- Long-text scenarios tested (German is typically +30% length)
- Text-truncation testing
- RTL flipping verified (Arabic)
- Cultural review by native speaker

Project I uses a "locale tester team" of 1-2 per major locale for QA.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Fallback rule | If key missing in current locale → fallback to English → fallback to key string itself |
| Plural form selection | ICU CLDR rules |

## 5. Edge Cases

- **Missing translation:** falls back to English. UI shows the key string itself if English also missing (clearly broken — easy to catch in dev).
- **Locale switch mid-session:** UI re-localizes immediately. Game state is locale-independent.
- **Locale-specific date / number formatting:** uses platform locale APIs.
- **Translation longer than UI accommodates:** auto-resize containers; otherwise show "..." truncation with full-text tooltip.

## 6. Dependencies

- `15-desktop-window-ux.md` — Language selector setting
- `18-audio-direction.md` — Future VO localization
- All other GDDs — all text references LocalizationManager
- `17-save-system.md` — locale preference persists

## 7. Tuning Knobs

- Locale list (currently EN only at launch)
- Fallback chain rules
- Tester team size per locale
- Translation budget per quarter

## 8. Acceptance Criteria

1. ✅ <mark>No hardcoded strings in the codebase — every player-facing text uses LocalizationManager.</mark>
2. ✅ <mark>Key naming follows the documented convention.</mark>
3. ✅ <mark>Pluralization works correctly using ICU MessageFormat.</mark>
4. ✅ <mark>Locale fallback chain works (current → English → key).</mark>
5. ✅ <mark>RTL layout flips correctly when Arabic locale is loaded (testable in dev mode).</mark>
6. ✅ Variable substitution works for dynamic strings.
7. ✅ Locale switch updates UI without restart.
