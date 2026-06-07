# GDD 08 — Inventory & Storage

## 1. Overview

Two storage systems: Character Storage (heroes/units) and Item Inventory (gear/materials/consumables). Both have starting caps, expandable via Crystals + milestone rewards. <mark>Adds: Lock & Favorite flags, bulk-select, filters, search, in-place comparison.</mark>

## 2. Player Fantasy

> *I'm collecting hundreds of units and dozens of weapons — and I can find anything in two clicks.*

## 3. Detailed Rules

### 3.1 Character Storage

- **Default:** 100 slots
- **Max:** 1000 slots
- **Expand:** +10 per purchase
- **Each character instance = 1 slot** (duplicates count separately until consumed/fused)

| Purchase # | +Slots | Crystal cost |
|------------|--------|--------------|
| 1–5 | +10 | 50 |
| 6–10 | +10 | 75 |
| 11–20 | +10 | 100 |
| 21–40 | +10 | 150 |
| 41+ | +10 | 200 |

<mark>**Free storage milestones** (account level ups):
- Account L10: +20 character slots
- Account L20: +30
- Account L30: +30
- Total free: 80 slots (so a free-track player without spending Crystals can grow to ~180 slots before paying).</mark>

### 3.2 Item Inventory

- **Default:** 200 slots
- **Max:** 2000 slots
- **Expand:** +20 per purchase
- **Stackable items:** 1 slot per unique type (e.g., 5,000 EXP Crystals = 1 slot)
- **Non-stackable:** weapons, accessories, eggs — 1 slot each

| Purchase # | +Slots | Crystal cost |
|------------|--------|--------------|
| 1–5 | +20 | 50 |
| 6–10 | +20 | 75 |
| 11–20 | +20 | 100 |
| 21–40 | +20 | 150 |
| 41+ | +20 | 200 |

<mark>**Free storage milestones** (battle pass + account level):
- Account L5: +20 inventory slots
- Account L15: +40
- Battle Pass tier 25 (every season): +40
- Total free per season: 100 slots.</mark>

### 3.3 Storage Behaviors

**When character storage is full:**
- ❌ Cannot hatch, claim from mail, gacha, or receive character rewards
- ✅ Can fuse, awaken, sell low-rarity units, expand, or send rewards to **mailbox** (held for 30 days)

**When item inventory is full:**
- ❌ Cannot loot dropped gear (drops are sent to mailbox)
- ✅ Can salvage, sell, equip, expand

<mark>**Mailbox overflow:** mail holds claimables for 30 days. After that, unclaimed items are deleted. The UI surfaces this clearly with a warning at 7 days remaining.</mark>

### 3.4 Lock / Favorite

<mark>

**Lock** (per item or character):
- Prevents accidental sell, salvage, or fusion-consume.
- Toggleable in detail view.
- Locked items show a 🔒 icon in lists.

**Favorite** (per item or character):
- Sort-priority flag, does NOT block actions.
- Shown with ⭐ icon.
- "Show Favorites First" filter available.

A common pattern: Favorite all your "good but uncertain" items, then Lock only your "definitely keeping" items.

</mark>

### 3.5 Filters / Search / Sort

<mark>

Available across both storage screens:

**Filters** (multi-select):
- Rarity (Common → Mythic)
- Element (Fire / Water / Wind / Neutral)
- Class (Tank / Assassin / Archer / Mage / Support)
- Equipment type (Weapon / Helmet / Chest / Gloves / Boots / Ring / Necklace)
- Equipment set
- Equipped status (equipped / unequipped / on which hero)
- Locked / Favorited

**Sort** (single-select):
- Level (high → low)
- Rarity (high → low)
- Name (A-Z)
- Acquisition date (recent → old)
- Power (computed from stats × class weights)

**Search** (text):
- Character / item name match
- Set name match (e.g., "berserker")

</mark>

### 3.6 Bulk Actions

<mark>

In Item Inventory, the **Bulk Select** mode allows:
- Multi-select up to 100 items at once
- Bulk sell → total Gold preview before confirm
- Bulk salvage → total Gold + materials preview before confirm
- Bulk lock / unlock / favorite

Locked items are auto-excluded from destructive bulk operations with a clear "X items locked, will not be affected" tooltip.

In Character Storage, Bulk Select supports:
- Bulk-feed-for-promotion (auto-fills with the optimal fodder when you click Promote)
- Bulk-lock / unlock / favorite

</mark>

### 3.7 Comparison View

<mark>

When tapping an item:
- Side-by-side comparison with whatever the currently-selected hero has equipped in that slot.
- Stat deltas shown in green (improvement) or red (downgrade).
- Quick "Equip on Hero" button if the item is an improvement.

</mark>

## 4. Formulas

| Concept | Formula |
|---------|---------|
| Item power (sort) | `Σ classWeight[stat] × statValue × rarityMod` (rarityMod: Common=1, Mythic=5) |
| Storage expansion cost | per 3.1 / 3.2 tables |

## 5. Edge Cases

- **Storage full + mail full:** rewards are queued and surface as a critical notification. Items don't disappear — the queue blocks any further reward generation until cleared.
- **Sort by acquisition date** when items have identical timestamps: tie-break by item UUID (deterministic).
- **Equipped item attempted to bulk-sell:** auto-excluded from selection.
- **Filter combinations with zero matches:** show "No items match these filters" + Clear Filters button.

## 6. Dependencies

- `03-stats-and-progression.md` — character data structure
- `04-equipment.md` — sub-stats and sets shown in filters
- `05-gacha-and-currencies.md` — mail delivery for pulled heroes when storage full
- `13-battle-pass.md` — free storage from BP tier 25
- `14-monetization.md` — Crystal cost for expansion

## 7. Tuning Knobs

- Storage starting caps (100 / 200)
- Storage max caps (1000 / 2000)
- Expansion costs (3.1 / 3.2)
- Mail expiry (currently 30 days)
- Bulk-select max items (currently 100)
- Free storage milestones

## 8. Acceptance Criteria

1. ✅ Character storage shows used / total slot count.
2. ✅ Expanding storage with Crystals immediately reflects in the UI.
3. ✅ <mark>Lock prevents bulk-sell from removing the item.</mark>
4. ✅ <mark>Bulk-sell of 50 items preview total Gold within 1 Gold accuracy.</mark>
5. ✅ Storage-full state correctly blocks gacha pulls and routes rewards to mailbox.
6. ✅ <mark>Mailbox auto-deletes items 30 days after delivery (with 7-day-warning UI surface).</mark>
7. ✅ <mark>Filter and search work on both storage screens.</mark>
