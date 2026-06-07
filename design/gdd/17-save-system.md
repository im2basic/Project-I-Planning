# GDD 17 — Save System

> Entire GDD is NEW. All content highlighted.

## 1. Overview

<mark>Local JSON save + optional cloud sync hook. Deterministic seeds for idle simulation. Tamper-resistant via checksum + obfuscation. Designed for fast cloud-restore on a new PC.</mark>

## 2. Player Fantasy

> *If my PC dies, my progress isn't gone. If I upgrade to a new machine, my game just works.*

## 3. Detailed Rules

### 3.1 Save Locations

<mark>

| Location | Use | Format |
|----------|-----|--------|
| `%APPDATA%/ProjectI/save/profile.json` | Primary | Plain JSON (obfuscated) |
| `%APPDATA%/ProjectI/save/profile.bak` | Backup | Last successful save (rotated) |
| Steam Cloud | Cloud sync | Same JSON, uploaded on save |
| Manual export `.savedata` | User backup | JSON file (player can email / re-import) |

On Mac (future): `~/Library/Application Support/ProjectI/save/`

</mark>

### 3.2 Save Data Schema (top-level)

<mark>

```json
{
  "version": "1.0.0",
  "playerId": "uuid-v4",
  "lastSaveAt": "ISO-8601",
  "lastSyncAt": "ISO-8601",
  "checksum": "sha256",
  "playerProfile": { ... account level, gems, gold, crystals ... },
  "heroes": [ ... per-hero state ... ],
  "inventory": [ ... ],
  "shrineState": { ... },
  "hatcheryState": { ... },
  "expeditionState": { ... },
  "gacha": { ... per `gdd/05-gacha-and-currencies.md` § 3.11 ... },
  "campaignState": { ... stage-clear records ... },
  "towerState": { ... },
  "bossRushState": { ... },
  "heroTrialState": { ... },
  "missions": { "daily": [...], "weekly": [...] },
  "battlePass": { ... },
  "achievements": [ ... ],
  "settings": { ... 9 sub-tab settings ... },
  "idleState": {
    "lastUpdateAt": "ISO-8601",
    "deterministicSeed": "uint64",
    "currentStage": "chapter-stage-difficulty",
    "rngState": "uint64"
  },
  "telemetryOptIn": true,
  "purchaseHistory": [ ... receipt IDs ... ]
}
```

</mark>

### 3.3 Save Cadence

| Trigger | Action |
|---------|--------|
| Significant change (purchase, gacha pull, hero upgrade) | Immediate save |
| Periodic | Every 60 seconds during active play |
| On window close | Final save |
| On crash | Recovery save (via OS signal handler if reachable) |

Saves are atomic: write to `profile.json.tmp` then rename. The previous `profile.json` becomes `profile.bak`.

### 3.4 Cloud Sync Strategy

<mark>

**Steam Cloud** is the v1 cloud target.

- Save uploaded on every "Save" event
- Last-modified timestamp + checksum used for conflict detection
- Conflict resolution: prefer the save with the higher `lastSaveAt`. On true ambiguity (same timestamp, different checksum), prompt the player with a "Choose local or cloud" modal showing high-level stats from each save.

**Cross-platform sync (future):**
- Mac/Windows share Steam Cloud
- Other platforms (EGS) would require platform-specific cloud sync

**Offline tolerance:**
- If Steam Cloud unavailable, game continues with local save
- Sync attempted on every subsequent save; notification when sync resumes

</mark>

### 3.5 Idle Simulation Determinism

<mark>

When the game launches after time has elapsed, idle accumulation is simulated using a **deterministic RNG seed** stored in `idleState.deterministicSeed`. The simulation:

1. Computes `elapsedHours = now - lastUpdateAt` (capped at 12h)
2. Adjusts for online/offline rate (`0.75` if Sleep/Closed)
3. Runs the loot drops for the configured idle stage using the stored seed
4. Updates `rngState` (advance the seed)
5. Saves the new state

Because the seed and rate are deterministic, **re-running the same simulation produces identical results**. This is critical for:
- Anti-cheat (server can validate)
- Bug reproduction (testers can replay scenarios)
- Player trust (no hidden "RNG manipulation")

**Anti-tamper:**
- The save file is obfuscated (XOR with a hashed key per playerId)
- A SHA-256 checksum of the save is included; mismatched checksum → save rejected; backup loaded
- Modified saves are detected; in normal F2P this would warrant a soft ban, but since Project I is single-player, **modified saves block gacha pulls + cloud sync only**. The player can keep playing but pull data refuses to upload.

</mark>

### 3.6 Save Conflict UI

<mark>

If a true conflict exists:

```
┌─────────────────────────────────────┐
│  Save conflict detected             │
│                                     │
│  Local save:                        │
│    Last played: 2 hours ago         │
│    Account L42, 18 heroes, 23k Gems │
│                                     │
│  Cloud save:                        │
│    Last played: 5 minutes ago       │
│    Account L41, 12 heroes, 8k Gems  │
│                                     │
│  [ Use Local ]  [ Use Cloud ]       │
└─────────────────────────────────────┘
```

The chosen save replaces the other. The discarded save is preserved as `profile-conflict-{timestamp}.json` for 30 days in case of mistakes.

</mark>

### 3.7 IAP Receipt Storage

<mark>

Every IAP receipt is stored in `purchaseHistory[]`:

```json
{
  "txId": "steam-receipt-id",
  "productId": "small_crystal_pack",
  "amountUSD": 4.99,
  "purchasedAt": "ISO-8601",
  "validated": true,
  "validatedAt": "ISO-8601",
  "fingerprint": "checksum"
}
```

Receipts are validated against Steam's web API on first launch after purchase. Failed validation → entitlements held until next online sync.

</mark>

### 3.8 Account Delete

<mark>

"Delete Account" in settings → Account flows:

1. Confirmation modal #1: "Are you sure?"
2. Type-the-word verification (player types "DELETE")
3. Confirmation modal #2 with full impact summary
4. 7-day grace period — account marked for delete, can be cancelled
5. After 7 days: local save deleted, cloud save deleted, telemetry tokens purged

This implements GDPR / similar right-to-erasure compliance.

</mark>

### 3.9 Backup & Export

<mark>

Player can manually export their save:

- Settings → Account → Export Save
- Produces `ProjectI-{playerId}-{timestamp}.savedata`
- File is encrypted with the same obfuscation
- Re-importing on a new account replaces all state (with confirmation)

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Checksum | `SHA-256(canonicalJSON)` |
| Save obfuscation key | `SHA-256(playerId + buildSecret)` then XOR cipher |
| Idle elapsed hours | `min((now - lastUpdateAt), 12)` |
| Conflict tiebreak | higher `lastSaveAt` wins |

## 5. Edge Cases

- **System clock manipulation:** If `now - lastUpdateAt < 0` (clock moved backward), treat as `0` (no rewards). Surface a warning toast.
- **Save file corrupted:** load backup. If both fail, prompt user with "restore from Steam Cloud" or "start fresh" options.
- **Steam Cloud quota exceeded:** save locally; surface warning. Cloud sync resumes when player clears Cloud space.
- **First launch ever:** generate `playerId` (UUID v4), initial save written.
- **Save data > version mismatch:** load with migration script (each version increment has a migrator); reject if migration fails.

## 6. Dependencies

- `01-combat.md` — combat state preserved across battles
- `06-idle-and-shrine.md` — idle accumulation determinism
- `10-tower-of-trials.md` — monthly reset state
- `12-daily-weekly-loops.md` — mission state, reset timers
- `13-battle-pass.md` — BP state, season tracking
- `14-monetization.md` — purchase history
- `15-desktop-window-ux.md` — settings persistence
- `21-liveops-and-telemetry.md` — server-side validation of saves

## 7. Tuning Knobs

- Save cadence (60s default)
- Cloud sync attempt frequency
- Idle simulation cap (12h)
- Conflict grace preservation (30 days)
- Account delete grace (7 days)
- Obfuscation key derivation (cannot be changed without breaking existing saves)

## 8. Acceptance Criteria

1. ✅ <mark>Save file is atomic — no half-written corruption.</mark>
2. ✅ <mark>Backup save (`profile.bak`) is loaded if primary is corrupted.</mark>
3. ✅ <mark>Idle simulation is deterministic — same seed + elapsed = same loot.</mark>
4. ✅ <mark>Cloud sync conflict UI presents both saves; player choice replaces the other.</mark>
5. ✅ <mark>Account delete enters a 7-day grace period; can be cancelled.</mark>
6. ✅ <mark>Save export produces a valid, re-importable `.savedata` file.</mark>
7. ✅ Modified save blocks gacha pulls (no soft progression for editors).
8. ✅ <mark>IAP receipts are validated against Steam API on first sync.</mark>
