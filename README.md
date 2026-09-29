# VALQUIN

### Forge Yourself.

<p align="center">

  <img src="assets/screenshots/status.png" alt="VALQUIN Status" width="250"/>

  <img src="assets/screenshots/inventory.png" alt="VALQUIN Inventory" width="250"/>

  <img src="assets/screenshots/equipment.png" alt="VALQUIN Equipment" width="250"/>

</p>

> **Train in real life. Progress in the game. Forge Yourself.**

VALQUIN is a fitness RPG designed to turn real-life training into character progression.

The player trains in real life, completes exercises, earns progress, unlocks equipment and builds a character through a game-inspired progression system.

The visual direction follows a **dark mythic minimalism** approach:

> **The UI stays quiet. The world speaks through the assets.**

---

## Current Version

**v0.7.7 — Daily Mission & Equipment Training Flow**

The current development cycle focuses on improving the Equipment training flow and making the player's daily training objective clearer and more game-like.

### v0.7.7 Highlights

* Introduced the **Daily Mission** system in the Equipment screen.

* Daily exercises are now grouped by **muscle group**.

* Centralized the relationship between equipment slots and muscle groups through the `MuscleGroup` domain model.

* Added localized muscle group labels in English and Spanish.

* Accessory equipment is excluded from the Daily Mission because it does not represent a training muscle group.

* Daily Mission exercises automatically reflect the selected exercise variant for each equipped item.

* Added localized **Execute / Ejecutar** action text to the training button.

* Improved the Equipment screen presentation to make the selected training easier to understand before execution.

### Muscle Groups

Equipment slots are mapped to training muscle groups through the `MuscleGroup` model:

| Equipment Slot | Muscle Group |
| -------------- | ------------ |
| Shoulders      | Shoulders    |
| Head           | Cardio       |
| Wings          | Back         |
| Weapon         | Biceps       |
| Chest          | Chest        |
| Shield         | Triceps      |
| Legs           | Legs         |
| Belt           | Core         |
| Accessory      | —            |

This keeps the relationship between equipment and training centralized in the domain layer instead of scattering slot-specific logic throughout the UI.

### Daily Mission

The Equipment screen now presents the selected training as a structured daily objective:

```text
DAILY MISSION

Shoulders:
• Military Press — 3 x 10 reps
• Lateral Raises — 3 x 10 reps

Chest:
• Push-ups — 3 x 10 reps
• Dips — 3 x 10 reps
```

The mission is generated dynamically from:

* Active equipment slots.
* Equipped items.
* Selected exercise variants.
* Equipment exercise definitions.
* Muscle group mappings.
* Cooldown state.

Exercises belonging to the same muscle group are grouped together automatically.

---

## Core Concept

VALQUIN connects four progression dimensions:

| Real Training        | Character Progression |
| -------------------- | --------------------- |
| Strength training    | Strength              |
| Sets and repetitions | Endurance             |
| Training duration    | Energy                |
| Aerobic capacity     | Stamina               |

Training determines progression, while equipment and character development provide the RPG layer.

---

## Current Gameplay Structure

### STATUS

The main character screen displays:

* Player information.
* Character statistics.
* Current equipment.
* Avatar.
* Equipment visual layers.

The avatar supports four views:

* Front
* Three-quarter
* Side
* Back

Equipment is rendered independently from the avatar, allowing individual items and visual layers to be combined dynamically.

### INVENTORY

The Inventory provides:

* Equipment browsing.
* Equipment filtering.
* Equipment details.
* Exercise variants.
* Unlock requirements.
* Equip requirements.
* Equipment statistics.
* Cooldown information.
* Equipment activation.

Equipment is organized by slots:

* Head
* Shoulders
* Wings
* Weapon
* Chest
* Shield
* Accessory
* Legs
* Belt

### EQUIPMENT

The Equipment system combines the selected equipment with the player's avatar through independent visual layers.

The Equipment screen also acts as the preparation stage for the player's daily training mission.

Players can:

* Activate equipment slots.
* Select exercise variants.
* Review the generated Daily Mission.
* View exercises grouped by muscle group.
* Execute the training session.

Special visual behavior includes:

* Wings rendered behind the character.
* Shields using view-specific layering.
* Accessories using independent animation.
* Rarity-based visual effects.

---

## Equipment Rarities

VALQUIN currently uses four equipment rarities:

| Rarity    | Visual Identity |
| --------- | --------------- |
| Common    | Gray / Blue     |
| Rare      | Green / Blue    |
| Legendary | Violet / Yellow |
| Mythic    | Fuchsia / White |

Rarity colors are independent from the application's user-selected accent color.

---

## Accessory Animation

Accessories can use an independent animated presentation.

The current animation system uses an eight-frame sequence:

```text
1 → 2 → 3 → 4 → 4 → 3 → 2 → 1
```

Accessory assets are stored independently from the avatar and equipment layers.

Current accessory concepts include:

* Weekly Logbook
* Atlas Gloves
* Pegasus
* Icarus Feather
* Hermes Sandals
* Apollo Laurel

Accessories can participate in the Equipment system without being assigned to a training muscle group.

---

## Visual Direction

VALQUIN follows a dark fantasy / mythological RPG aesthetic inspired by classic RPG interfaces and anime-style character progression.

The goal is not to reproduce a specific existing game, but to create an original visual identity combining:

* Dark backgrounds.
* Mythological themes.
* Minimal UI.
* Character-focused presentation.
* Game-inspired equipment.
* Strong visual assets.
* Subtle effects and animations.

---

## Technical Architecture

VALQUIN is built with:

* **Flutter / Dart**
* **SQLite**
* **Drift**
* **Riverpod**

The project is progressively moving toward a modular architecture where:

```text
Screens
   ↓
Managers
   ↓
Models / Domain
   ↓
Persistence
```

UI components are progressively extracted from large screens into reusable widgets.

Visual configuration remains separated from domain models:

```text
Domain Models
    ↓
Visual Configuration
    ↓
Widgets / Renderers
```

This allows gameplay data to remain independent from visual presentation.

The `MuscleGroup` model follows the same principle by keeping training-domain relationships separate from screen presentation.

---

## Project Structure

The application is organized around several main areas:

```text
lib/

├── config/
├── database/
├── managers/
├── models/
├── persistence/
├── screens/
├── widgets/
└── ...
```

The architecture is being refined incrementally through vertical slices, keeping each change testable and isolated.

---

## Development Milestones

### v0.7.7

**Daily Mission & Equipment Training Flow**

* Daily Mission system.
* Exercises grouped by muscle group.
* Centralized `MuscleGroup` domain model.
* Equipment slot → muscle group mapping.
* English / Spanish muscle group localization.
* Accessory exclusion from training groups.
* Daily Mission integration with selected exercise variants.
* Improved Equipment screen training presentation.
* Localized Execute / Ejecutar action.

### v0.7.6

**Welcome Flow Fix & Inventory Modularization**

* Welcome Screen bug fix.
* Inventory Screen decentralization.
* Inventory UI extraction into reusable widgets.
* Equipment visual mapping centralization.
* Inventory architecture cleanup.

### v0.7.5

**Equipment Visual Polish & Content Expansion**

* Equipment visual improvements.
* New equipment content.
* Expanded equipment sets and visual assets.

### v0.7.4

**Accessory Animation**

* Animated accessory system.
* Eight-frame accessory animation cycle.
* Accessory rendering separated from equipment layers.

### v0.7.3

**Avatar Customization & Onboarding**

* Welcome Screen.
* Player creation flow.
* Avatar selection.
* Persistent avatar selection.

### v0.7

**Avatar System**

* Four-view avatar system.
* Front / three-quarter / side / back rendering.
* Avatar persistence.

### v0.6.7

**Localization**

* English / Spanish localization system.

### v0.6.6

**Persistent Application Settings**

* Persistent application settings.
* Accent color persistence.
* Localization settings persistence.

### v0.6.3

**Custom Launcher**

* Custom VALQUIN launcher icon.

### v0.5.4

**Database-Driven Equipment & Exercises**

* Database-driven exercise system.
* Equipment data.
* Exercise variants.
* Requirements and progression data.

---

## Roadmap

### Next Step — Beta Preparation

The next development phase will focus on preparing VALQUIN for real-world testing.

Planned work includes:

* Beta APK preparation.
* Installation testing.
* Real-device testing.
* Gameplay validation.
* Bug collection.
* Balance adjustments.
* UX improvements based on testing.

The objective is to move from an increasingly complete development build toward a stable **private beta**.

---

## Philosophy

VALQUIN is built around a simple idea:

> **Training in real life should feel like progression in a game.**

The application should not replace discipline with gamification.

It should make discipline visible.

**Train. Progress. Forge Yourself.**
