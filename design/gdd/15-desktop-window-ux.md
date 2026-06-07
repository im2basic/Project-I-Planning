# GDD 15 — Desktop Window UX

> Highlighted (`<mark>`) blocks are new vs. the source PDF.

## 1. Overview

Project I is a Unity desktop game with three window modes: **Compact**, **Expanded**, and **Tray**. The compact window is the game's identity — small, peripheral, always playable. <mark>Adds: full settings menu (sub-tabbed), accessibility suite, hotkey rebinding, audio sliders, notifications, multi-monitor, performance modes.</mark>

## 2. Player Fantasy

> *The game lives on my desktop like a clock or a music player — useful, unobtrusive, but I can grab it when I want to manage things.*

## 3. Detailed Rules

### 3.1 Window Modes

| Mode | Default size | Behavior |
|------|--------------|----------|
| **Compact** | 480 × 160 px | Default. Borderless. Always visible. Toggleable always-on-top. |
| **Expanded** | 1280 × 720 px | Resizable. Full UI. Standard window chrome. |
| **Tray** | — | No window. Game runs in system tray with right-click menu. |

### 3.2 Required Window Features (from PDF)

- Always-on-top toggle (default OFF)
- Click-through mode (default OFF)
- Window position lock (default OFF)
- Position memory across sessions (compact + expanded saved separately)
- Reset shortcuts (Shift+F11 = reset scale, Shift+F12 = reset position, Ctrl+Shift+T = click-through, Ctrl+Shift+M = mode switch)

### 3.3 Compact Mode Display

Visible elements:
- Active party chibis
- Current enemy chibis
- Damage numbers
- Loot drops (tickerized — small floating text)
- Gold counter, EXP counter, current stage name
- Shrine ready indicator (small icon, badge)
- Egg ready indicator
- Boss warning icon
- Expand button, settings button, close button (top-right cluster)

<mark>**Loot Ticker (NEW):** scrolling text at the bottom of the compact window showing the last 3 loot drops. Hovering pauses the scroll. Click opens the inventory.</mark>

### 3.4 Expanded Mode UI

See `gdd/20-ui-menus-tabs.md` for the full menu structure.

### 3.5 Tray Mode

<mark>

System tray icon menu:
- "Show Compact Mode"
- "Show Expanded Mode"
- "Pause Idle Combat"
- "Mute" (toggle)
- Hero / Inventory / Gacha quick-launch buttons (open in expanded mode)
- "Settings"
- "Exit"

Game continues idle simulation while in tray. CPU/GPU footprint is minimal — same as background combat (no animations rendered).

</mark>

### 3.6 Hotkeys (all rebindable)

<mark>

Default hotkeys:

| Action | Default | Rebindable |
|--------|---------|------------|
| Toggle compact ↔ expanded | Ctrl+Shift+M | Yes |
| Toggle always-on-top | Ctrl+Shift+A | Yes |
| Toggle click-through | Ctrl+Shift+T | Yes |
| Lock window position | Ctrl+Shift+L | Yes |
| Reset window position | Shift+F12 | Yes |
| Reset window size | Shift+F11 | Yes |
| Open settings | Ctrl+, | Yes |
| Quick claim Shrine | Ctrl+Shift+S | Yes |
| Quick claim idle rewards | Ctrl+Shift+R | Yes |
| Open Gacha | Ctrl+G | Yes |
| Pause combat (idle) | Ctrl+Shift+P | Yes |

**Conflict detection:** if two actions map to the same combo, UI warns and disables both until resolved.

</mark>

### 3.7 Settings Menu (NEW — fully restructured)

<mark>

Settings is organized into **9 sub-tabs**, each with focused options:

#### Audio
- Master Volume (slider, 0-100)
- Music Volume (slider, 0-100)
- SFX Volume (slider, 0-100)
- Voice Volume (slider, 0-100, even though no voice ships v1 — UI ready)
- UI Sound Volume (slider, 0-100)
- Mute all (override toggle)

#### Display
- Compact Mode FPS (15 / 30 / 60)
- Expanded Mode FPS (30 / 60 / 90 / 120 / Uncapped)
- Tray / Background FPS (5 / 10 / Simulation-only)
- Display Scale (UI 100% / 125% / 150%)
- Damage Numbers (Detailed / Simplified / Off)
- VFX Intensity (Off / Low / Medium / High)
- Animation Speed in Expanded Mode (1× / 1.5× / 2×) — separate from combat speed
- Reduce screen shake (toggle)

#### Window
- Start in Compact Mode (toggle)
- Start in Expanded Mode (toggle)
- Always-on-top (toggle)
- Click-through (toggle)
- Lock compact window position (toggle)
- Reset window position (button)
- Reset window size (button)
- Multi-monitor: remember per-monitor (toggle, default ON)
- Snap-to-edge (toggle)

#### Gameplay
- Combat Speed Default (1× / 2× / 3× / 4×)
- Auto-collect Shrine when full (toggle, default OFF)
- Auto-collect idle rewards on login (toggle, default OFF)
- Auto-equip best gear when leveling (toggle, default OFF)
- Auto-sell items below rarity (Off / Common / Uncommon / Rare)
- Confirm-on-spend (premium currency) (toggle, default ON)
- Auto-AI Bias (Aggressive / Balanced / Conservative)
- Pause-when-unfocused (toggle, default OFF)
- Pause-when-PC-sleeps (toggle, default OFF — offline rewards always work)

#### Controls
- Full hotkey list with rebind UI
- Reset all hotkeys to default (button)
- Mouse hover preview in compact mode (toggle)

#### Accessibility
- Color blind mode (Off / Protan / Deutan / Tritan)
- High contrast UI (toggle)
- Text size (Small / Normal / Large / XL)
- Reduce motion (toggle — disables non-essential animations)
- Reduce flashing (toggle — disables critical hit flash, etc.)
- Subtitles (toggle — for future VO)
- Screen reader hooks (toggle, opt-in; partial support v1; full v2)

#### Notifications
- Desktop notifications (toggle, master)
- Shrine ready alert (toggle, default ON)
- Idle storage cap alert (toggle, default ON)
- Egg ready alert (toggle, default OFF — avoids spam)
- Boss-stage available (toggle, default ON)
- Sound on notification (toggle, default ON)

#### Account
- Cloud save sync (toggle, default ON)
- Last sync timestamp (display)
- Manual sync now (button)
- Export save data (button — produces a `.savedata` file)
- Reset tutorial / replay onboarding (button — confirmation required)
- Sign out (button — for cloud save providers)
- Delete account (button — destructive; opens confirmation modal with 3-step verify)
- Discord Rich Presence (toggle, default ON)
- Telemetry / analytics (toggle, default ON; opt-out)

#### About
- Game version
- Build number
- Patch notes link
- Credits
- Open source licenses
- Privacy policy link
- Terms of service link
- Customer support link
- Help / FAQ link

</mark>

### 3.8 Accessibility (deeper detail)

<mark>

**Color blind modes:** UI palette swaps for Protanopia, Deuteranopia, Tritanopia. Combat HUD (element icons, damage numbers, status effects) get distinct shapes + symbols beyond color (e.g., Fire = flame icon + red, but also has a flame *outline*; Water has wave outline; Wind has triangle outline). This makes element identification possible without color.

**High contrast UI:** thicker borders, monochrome backgrounds, larger text. Standalone toggle from color blind mode.

**Text size:** scales all text. Layouts adapt — long text wraps, doesn't overflow.

**Reduce motion:** disables idle animations on the compact window. Combat animations still play (essential to feedback).

**Reduce flashing:** disables critical hit flash, ultimate impact flash, level-up screen flash. Required compliance for photosensitive accessibility.

**Screen reader:** v1 supports tab navigation + aria-label-equivalent metadata on critical buttons. Full screen reader support is v2.

</mark>

### 3.9 Performance Modes

<mark>

| Mode | Compact FPS | Expanded FPS | Tray FPS | When |
|------|-------------|--------------|----------|------|
| Performance | 30 | 60 | Simulation-only | Default for desktops |
| Battery Saver | 15 | 30 | Simulation-only | Auto on battery laptops |
| Ultra | 60 | 120 | 10 | Manual high-end |

Battery Saver auto-engages when system reports < 20% battery AND on battery power. Player can override.

</mark>

### 3.10 Compact Mode Mouse Interactions

<mark>

| Mouse action | Result |
|--------------|--------|
| Left-click anywhere (non-button) | (with click-through OFF) Toggles between drag-mode and click-mode |
| Right-click | Opens compact mode context menu (pause, settings, expand, exit, lock window) |
| Hover over hero chibi | Tooltip: hero name, HP%, current buffs |
| Hover over loot ticker | Pauses scroll, expands to show detail |
| Hover over Shrine icon | Tooltip: current Gold accumulated / cap |
| Double-click | Triggers Expand (if click-through OFF) |

</mark>

### 3.11 Multi-Monitor

<mark>

- Window remembers which monitor it was last on.
- If saved monitor is disconnected at launch, window snaps to primary monitor.
- "Move to next monitor" hotkey: Ctrl+Shift+M+→ (rebindable).
- Per-monitor display scaling respected.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Compact mode CPU cap | Target < 2% CPU on a modern desktop |
| Tray mode CPU cap | Target < 0.5% CPU |
| Loot ticker scroll speed | 30 px/s, pause on hover |

## 5. Edge Cases

- **Click-through ON + window dragged to off-screen:** Shift+F12 reset position rescues it.
- **Hotkey rebind conflict:** UI prevents save until conflict resolved.
- **All monitors disconnected with window on a removed monitor:** snap to primary.
- **DPI change mid-session:** UI re-renders; saved window position preserved by % not pixels.
- **Battery saver toggles on, then user plugs in:** restore to Performance after 30s of stable AC.

## 6. Dependencies

- `01-combat.md` — combat speed, auto-AI bias
- `06-idle-and-shrine.md` — auto-collect toggle, notifications
- `17-save-system.md` — settings persistence
- `19-localization-plan.md` — text size + localization
- `20-ui-menus-tabs.md` — Settings opens from any screen
- `21-liveops-and-telemetry.md` — Telemetry opt-in/out

## 7. Tuning Knobs

- Default FPS per mode (3.9)
- Default volume settings (50/100 across all sliders)
- Default hotkey bindings (3.6)
- Default toggles (auto-collect OFF, confirm-on-spend ON, etc.)
- Battery saver auto-engage threshold (20%)

## 8. Acceptance Criteria

1. ✅ <mark>Settings menu has 9 sub-tabs as documented.</mark>
2. ✅ <mark>All audio sliders affect their respective channels independently.</mark>
3. ✅ <mark>Compact mode position is saved across sessions.</mark>
4. ✅ <mark>All 11 hotkeys are rebindable.</mark>
5. ✅ <mark>Color blind mode swaps palettes + adds shape distinctions.</mark>
6. ✅ <mark>Battery saver auto-engages below 20% on AC battery.</mark>
7. ✅ Window mode switch (Ctrl+Shift+M) works from any mode.
8. ✅ <mark>Multi-monitor saved correctly across reboots.</mark>
9. ✅ Click-through OFF allows drag; ON prevents all interaction.
