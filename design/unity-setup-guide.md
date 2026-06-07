# Project I — Unity Setup Guide

> Step-by-step setup for starting Project I in Unity. Run this top-to-bottom on your Mac (or future PC). Total time ~30-60 minutes for steps 1-7. Steps 8+ are ongoing.

---

## 0. Prerequisites

Before you start:

- ☐ macOS Sonoma+ (or Windows 10+)
- ☐ 16 GB RAM minimum (32 GB recommended)
- ☐ 50 GB free disk
- ☐ Stable internet connection
- ☐ Apple ID or Microsoft account (for Unity Hub)
- ☐ GitHub account (you have `im2basic`)
- ☐ Free Steam account (for Steamworks integration later)

---

## 1. Install Unity Hub

1. Download from <https://unity.com/download>
2. Open the downloaded `.dmg` and drag Unity Hub to Applications
3. Launch Unity Hub
4. Sign in (or create a free Unity account)
5. Choose a license: **Personal** is free for revenue under $200k. **Plus** ($399/year) when you cross that threshold.

---

## 2. Install Unity Editor

1. In Unity Hub, click **Installs** → **Install Editor**
2. Choose **Unity 2023.3 LTS** (or the latest LTS version available)
3. In the modules dialog, check these:
   - ☑ **Mac Build Support (IL2CPP)** (you're on Mac)
   - ☑ **Windows Build Support (IL2CPP)** ← critical, this is the launch target
   - ☑ **Visual Studio for Mac** OR **JetBrains Rider** (your code editor — Rider preferred for C# dev)
   - ☑ **Documentation**
4. Click **Install**. Wait ~20-30 minutes.

---

## 3. Install C# IDE

Choose ONE:

- **JetBrains Rider** (recommended for serious development) — <https://www.jetbrains.com/rider/> — free non-commercial license available
- **Visual Studio Code** (free) — <https://code.visualstudio.com/> + install the C# extension
- **Visual Studio for Mac** (free, deprecated by MS but functional) — bundled in Unity install option

In Unity → Preferences → External Tools → set **External Script Editor** to your choice.

---

## 4. Install Git & Configure GitHub

```bash
# Check if git is installed
git --version

# If not installed, install via Homebrew
brew install git

# Configure your identity (one-time setup)
git config --global user.name "Song"
git config --global user.email "your-github-email@example.com"

# Set default branch to main
git config --global init.defaultBranch main
```

Then authenticate with GitHub:

```bash
# Install GitHub CLI (easiest auth path)
brew install gh

# Login
gh auth login
```

Choose "GitHub.com" → "HTTPS" → "Login with a web browser" → follow prompts.

---

## 5. Clone the Planning Repo

```bash
# Pick where you want the repo on disk
cd ~/Documents
mkdir -p ProjectI
cd ProjectI

# Clone the planning repo I created for you
gh repo clone im2basic/Project-I-Planning planning

# OR if you don't use gh CLI:
# git clone https://github.com/im2basic/Project-I-Planning.git planning

cd planning
ls -la
```

You should see all the design docs.

---

## 6. Create a Separate Unity Project Repo

Planning lives in `Project-I-Planning`. The actual Unity project should live in a **separate repo** (it has very different content + large binary assets).

### Option A — Create on GitHub via web

1. Go to <https://github.com/new>
2. Repository name: `Project-I-Game` (or similar — avoid copyrighted name yet)
3. Visibility: **Private** (until launch)
4. Initialize with `.gitignore` template: **Unity**
5. Add a README
6. Click **Create repository**
7. Clone locally:
   ```bash
   cd ~/Documents/ProjectI
   gh repo clone im2basic/Project-I-Game game
   ```

### Option B — Create via CLI

```bash
cd ~/Documents/ProjectI
gh repo create Project-I-Game --private --description "Project I — Unity game source" --gitignore Unity --clone
mv Project-I-Game game
cd game
```

---

## 7. Create the Unity Project

1. Open Unity Hub
2. Click **New Project**
3. Template: **2D (URP)** (we want Universal Render Pipeline for expanded mode polish)
4. Project name: `ProjectI`
5. Location: `~/Documents/ProjectI/game/` (the repo you just made)
6. Click **Create project**

Unity creates the folder structure. **Wait** ~5 minutes for the first import.

### 7a. Verify .gitignore

Open the `game/` repo directory in Finder. You should see a `.gitignore` (Unity template). If not, copy this content into `.gitignore`:

```
# Unity generated
/Library/
/Temp/
/Obj/
/Build/
/Builds/
/Logs/
/UserSettings/
/MemoryCaptures/

# Visual Studio / Rider
.idea/
.vs/
*.csproj
*.unityproj
*.sln
*.suo
*.tmp
*.user
*.userprefs
*.pidb
*.booproj
*.svd
*.pdb
*.mdb
*.opendb
*.VC.db

# Mac / Windows OS
.DS_Store
Thumbs.db

# Builds
*.apk
*.aab
*.unitypackage
*.app

# Crashlytics
crashlytics-build.properties
```

### 7b. Initial commit

```bash
cd ~/Documents/ProjectI/game
git add .
git commit -m "Initial Unity project — Project I"
git push origin main
```

---

## 8. Recommended Folder Structure

In `Assets/`, create this folder structure (in Unity Project window — right-click → Create → Folder):

```
Assets/
├── Project/
│   ├── Scripts/
│   │   ├── Core/                  # Game loop, save system, config
│   │   ├── Combat/                # Combat engine, AI
│   │   ├── Heroes/                # Hero data + behavior
│   │   ├── Gacha/                 # Gacha system
│   │   ├── Idle/                  # Idle simulation
│   │   ├── UI/                    # UI screens, widgets
│   │   ├── Window/                # Desktop window control (compact / expanded / tray)
│   │   ├── Audio/                 # Audio manager
│   │   ├── Localization/          # String table system
│   │   ├── Analytics/             # Telemetry hooks
│   │   └── Tests/                 # Unit / integration tests
│   ├── Art/
│   │   ├── Heroes/                # Splash, chibi, hero cards (per hero subfolder)
│   │   ├── Enemies/               # Enemy art
│   │   ├── UI/                    # UI sprites
│   │   ├── Icons/                 # Element / class / status icons
│   │   ├── VFX/                   # Particle effects
│   │   └── Backgrounds/           # Stage backgrounds (incl. compact strips)
│   ├── Audio/
│   │   ├── Music/
│   │   ├── SFX/
│   │   └── Voice/                 # Reserved for future VO
│   ├── Data/                      # ScriptableObjects: hero stats, enemy stats, drop tables, etc.
│   ├── Scenes/
│   │   ├── Bootstrap.unity        # First scene that loads on launch
│   │   ├── Compact.unity          # Compact mode UI
│   │   ├── Expanded.unity         # Expanded mode UI
│   │   ├── Tutorial.unity         # Tutorial flow
│   │   └── Combat.unity           # Combat scene (can be additive)
│   └── Prefabs/                   # Reusable game objects
└── ThirdParty/                    # Imported packages (Steamworks, etc.)
```

---

## 9. Install Required Unity Packages

In Unity → Window → Package Manager:

| Package | Why |
|---------|-----|
| **Addressables** | Asset loading (mandatory) |
| **Input System** | Modern input (replaces old Input class) |
| **2D Sprite** | If 2D template didn't include |
| **Universal RP** | Render pipeline |
| **TextMeshPro** | UI text (mandatory) |
| **Newtonsoft Json** | Save serialization |
| **Unity Test Framework** | Unit tests |

In Package Manager, also import these from the Asset Store / Git later:

- **Steamworks.NET** — Steam integration. From: <https://steamworks.github.io/>
- **DOTween** — Tweening library (free). From Asset Store.
- **Sentry SDK for Unity** — Crash reporting. From <https://docs.sentry.io/platforms/unity/>

---

## 10. First Code: Set Up the Game Bootstrap

In Unity → `Assets/Project/Scripts/Core/`, create a new C# script: `GameBootstrap.cs`

```csharp
using UnityEngine;

namespace ProjectI.Core
{
    public class GameBootstrap : MonoBehaviour
    {
        [SerializeField] private bool startInCompactMode = true;

        private void Start()
        {
            Debug.Log("Project I bootstrap started.");

            // TODO: load save data
            // TODO: initialize config (hot-config fetch)
            // TODO: route to Tutorial or main menu based on save state
            // TODO: switch to compact or expanded mode based on settings

            if (startInCompactMode)
            {
                // Placeholder — actual compact mode switch comes later
                Debug.Log("Starting in compact mode.");
            }
        }
    }
}
```

Create an empty GameObject in the `Bootstrap.unity` scene → name it `GameBootstrap` → attach the script.

Press **Play** in the editor. You should see "Project I bootstrap started." in the Console.

✅ **Hello-world milestone hit.**

---

## 11. Set Up Reference to Planning Repo

The Unity project (`game/`) doesn't include the planning docs. Reference them like this:

### Option A — Submodule (clean, but more git complexity)

```bash
cd ~/Documents/ProjectI/game
git submodule add https://github.com/im2basic/Project-I-Planning.git docs/planning
git submodule update --init --recursive
git add .
git commit -m "Add planning repo as submodule"
git push
```

Now `docs/planning/` inside the Unity project links to the planning repo. When the planning repo updates, run:

```bash
git submodule update --remote
```

### Option B — Just keep both repos side-by-side (simpler)

Keep the planning repo at `~/Documents/ProjectI/planning/` and the Unity project at `~/Documents/ProjectI/game/`. Open both in your file browser. Reference docs in `planning/` whenever you need them.

**Recommended:** Option B for simplicity. Move to A once you have CI / multiple devs.

---

## 12. Working Across Mac + PC

Since you're planning on Mac + want to work on Windows PC too:

### On your Mac
```bash
# Daily: pull latest before starting work
cd ~/Documents/ProjectI/planning
git pull

cd ~/Documents/ProjectI/game
git pull

# Edit / develop ...

# Push when done
cd ~/Documents/ProjectI/game
git add .
git commit -m "Describe what you did"
git push
```

### On your PC (one-time setup)

1. Install Git for Windows: <https://git-scm.com/download/win>
2. Install GitHub CLI: <https://cli.github.com/>
3. Open Command Prompt or PowerShell:
   ```powershell
   gh auth login
   # follow same auth flow
   ```
4. Install Unity Hub for Windows: <https://unity.com/download>
5. Install the same Unity 2023.3 LTS version
6. Clone the repos:
   ```powershell
   mkdir C:\dev\ProjectI
   cd C:\dev\ProjectI
   gh repo clone im2basic/Project-I-Planning planning
   gh repo clone im2basic/Project-I-Game game
   ```
7. Open Unity Hub → Add → select `C:\dev\ProjectI\game\` → open

✅ **You can now work on either machine. Push when done; pull before starting.**

---

## 13. Daily Workflow Cheat Sheet

```bash
# Morning — start of work session
cd ~/Documents/ProjectI/game     # or whichever repo you're in
git pull

# Work in Unity ...

# Mid-day — commit often (good habit)
git add .
git commit -m "WIP: implementing hero stats system"

# End of day — push to GitHub so it's safe + available on your other PC
git push
```

Rules:
- **Never** commit while Unity is open and unsaved.
- **Always** save scenes and assets before committing.
- **Pull first** if working on multiple machines.
- **Push often** — at least daily.

---

## 14. Recommended Next Tasks (after setup)

In rough order, the first ~3 months of implementation work:

1. **Save system** (Scripts/Core/SaveSystem) — JSON serialization, obfuscation, checksums, atomic writes
2. **Hot-config fetcher** (Scripts/Core/Config) — fetches gacha rates, BP schedule, etc.
3. **Hero data system** (Scripts/Heroes/HeroData.cs) — ScriptableObjects for the 10 launch heroes
4. **Combat engine — turn order** (Scripts/Combat/ActionGauge.cs) — see `design/gdd/01-combat.md` § 3.2
5. **Combat engine — damage formula** (Scripts/Combat/DamageCalculator.cs) — see `gdd/01-combat.md` § 3.5
6. **Stat system** (Scripts/Heroes/HeroStats.cs) — implements the 7 core stats per `gdd/03`
7. **Enemy AI** (Scripts/Combat/EnemyAI.cs) — see `gdd/25-enemy-ai.md`
8. **Compact window controller** (Scripts/Window/CompactWindowController.cs) — borderless window, always-on-top, click-through
9. **Auto-AI for player heroes** (Scripts/Combat/AutoAI.cs) — see `gdd/01` § 3.14
10. **First test battle scene** — combine 1-9 into one playable Lyria vs. enemy battle

This is "vertical slice" work. Validates the engine before you build all 15 heroes.

---

## 15. Troubleshooting

**Unity is slow / crashes on first import**
- Wait 30 minutes. First-time imports are heavy.
- If still slow: check Activity Monitor — Unity needs RAM headroom.

**Git rejects push: "non-fast-forward"**
- Someone (or another machine) pushed before you. Pull first:
  ```bash
  git pull --rebase
  ```
- Then push again.

**"package.json" conflicts during pull**
- Unity package manifest changed on both sides. Resolve by accepting the newer version OR merging manually.

**Unity won't open the project**
- Check Unity version matches. If you opened a project made in 2023.3 in 2022.x, it won't work.

---

## 16. Resources & References

- **Unity Manual:** <https://docs.unity3d.com/Manual/index.html>
- **C# style guide:** <https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions>
- **Steamworks.NET docs:** <https://steamworks.github.io/>
- **GitHub CLI docs:** <https://cli.github.com/manual/>
- **Project I planning docs:** local copy at `~/Documents/ProjectI/planning/`

---

## 17. Done with setup?

✅ Unity Hub installed
✅ Unity 2023.3 LTS installed with Windows + Mac build support
✅ Git + GitHub CLI configured
✅ Both repos cloned to `~/Documents/ProjectI/`
✅ Unity project created and opens
✅ Folder structure created
✅ First bootstrap script runs in editor
✅ Mac + PC workflows verified

You're ready to start implementing the Vertical Slice. Begin with the save system (it underpins everything else).

Refer to `design/gdd/01-combat.md` and onward for spec details.
