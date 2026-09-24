# VALQUIN

### Forge Yourself.

<p align="center">
  <img src="assets\screenshots\status.png" alt="VALQUIN Status" width="250"/>
  <img src="assets\screenshots\inventory.png" alt="VALQUIN Inventory" width="250"/>
  <img src="assets\screenshots\equip.png" alt="VALQUIN Equip" width="250"/>
</p>

---

## What is VALQUIN?

**VALQUIN** is a mobile fitness RPG that turns real-world training into character progression.

The player performs real physical activities, records their training, gains experience, improves their stats, unlocks equipment and progresses through different character classes.

The core idea is simple:

> **Train in real life. Progress in the game. Forge Yourself.**

VALQUIN combines the progression systems of classic RPGs with real physical training, taking inspiration from games and anime such as **MU Online**, **Shining Force**, and **Solo Leveling**.

The project is designed around a simple principle:

**The game should reward consistency, progression and discipline rather than replace real training with a virtual representation of it.**

---

# Features

### Character Progression

* Player creation.
* Experience and leveling system.
* RPG attributes:

  * Strength
  * Endurance
  * Energy
  * Stamina
* Character classes.
* Class progression and unlock conditions.
* Permanent progression milestones.
* Player reset while preserving unlocked equipment.

### Avatar System

VALQUIN includes a dedicated character avatar system that provides the visual foundation for character customization and equipment presentation.

Current functionality includes:

* Male avatar 01.
* Dedicated avatar artwork.
* Multiple character views.
* Front view.
* Front 3/4 view.
* Side profile.
* Back view.
* Horizontal swipe navigation between available views.
* Consistent character identity across all views.
* Avatar integration with equipment visualization.

The current avatar is intentionally presented as a simple, lightly equipped beginner character.

This establishes the base visual layer on which equipment and future customization systems are built.

The current rotation flow is:

```text
Front
  │
  ▼
Front 3/4
  │
  ▼
Side
  │
  ▼
Back
```

The current implementation intentionally uses four production views rather than a complete 360-degree sprite system.

A future iteration will extend the avatar rotation into a full **360-degree character view**.

### Training System

* Exercises with multiple variants.
* Sets, quantities and units.
* Support for different training modalities.
* Training plan management.
* Daily training selection.
* Exercise execution.
* Experience and stat progression through training.
* Equipment-based exercise availability.
* Equipment cooldown system.

### Equipment System

Equipment is one of the core RPG mechanics of VALQUIN.

Each equipment item can define:

* Equipment slot.
* Rarity.
* Multiple exercises.
* Maximum exercise variant.
* Stat bonuses.
* Unlock requirements.
* Equip requirements.
* Class compatibility.
* Visual assets.

Current rarities:

```text
Common

Rare

Legendary

Mythic
```

Rarity is also part of VALQUIN's visual language.

Each rarity has its own primary color and glow effect:

```text
Common      → Light Gray + Blue Glow
Rare        → Green + Blue Glow
Legendary   → Violet + Yellow Glow
Mythic      → Fuchsia + White Glow
```

Rarity colors are intentionally independent from the application's primary accent color.

An equipment item can therefore act as both a progression reward and a way of specializing the player's training.

### Equipment Visualization

VALQUIN now includes the first functional equipment visualization layer.

Equipment artwork is rendered directly over the selected avatar and changes according to the avatar's current view.

Current functionality includes:

* Equipment PNG assets.
* View-specific equipment artwork.
* Front equipment rendering.
* Front 3/4 equipment rendering.
* Side equipment rendering.
* Back equipment rendering.
* Equipment positioning relative to the base avatar.
* Layer ordering between avatar and equipment.
* Equipment-specific rendering behavior.
* Front/3/4 shield presentation.
* Side/back shield presentation.
* Rear-layer wing rendering.
* Integration with the Status screen.
* Visual testing across the available avatar views.

The equipment renderer uses the avatar as a stable coordinate system so that equipment assets remain aligned with the character across different views.

The current architecture separates:

```text
Base Avatar
    │
    ▼
Equipment Renderer
    │
    ├── Head
    ├── Shoulders
    ├── Chest
    ├── Belt
    ├── Legs
    ├── Weapon
    ├── Shield
    ├── Wings
    └── Accessory
```

Most current equipment slots already have production PNG assets.

**Accessory visual assets are still pending.**

The current equipment system therefore represents the first functional vertical slice of the complete character visualization architecture.

### Inventory

The inventory provides an overview of the equipment available to the player.

Current functionality includes:

* Equipment grid.
* Equipment selection.
* Rarity visualization.
* Equipment details.
* Exercise information.
* Equipment variants.
* Requirements.
* Equip and unequip actions.
* Inventory filtering.
* Equipped-item filtering.
* Slot-based filtering.
* Custom equipment slot iconography.
* Rarity-based icon glow.

### Equipment & Daily Training

The equipment screen acts as the player's daily training loadout.

The player can:

* Equip items into equipment slots.
* Activate or deactivate equipped items.
* Select the exercise variant for each equipment item.
* Build a daily training plan from active equipment.
* Review the exercises generated by the selected equipment.
* Monitor equipment cooldowns.
* Automatically remove equipment from the active training plan when it enters cooldown.
* Execute the daily training plan.

The daily training flow is intentionally simple:

```text
Select Equipment
       │
       ▼
Activate Equipment
       │
       ▼
Select Variants
       │
       ▼
Generate Daily Plan
       │
       ▼
Review Exercises
       │
       ▼
Execute Training
       │
       ▼
Equipment Cooldown
       │
       ▼
Recover & Train Again
```

This creates a direct relationship between equipment selection and real-world training.

### Settings & Customization

VALQUIN includes a centralized application settings system for user-facing preferences.

Current settings include:

* Accent color customization.
* Runtime accent color changes.
* Language selection.
* Runtime language changes.
* Persistent settings storage.
* Centralized application settings state.
* Reactive theme updates.
* Reactive localization updates.

Supported languages:

```text
English

Spanish
```

Settings are persisted locally through SQLite, allowing user preferences to survive application restarts.

The settings architecture follows:

```text
AppSettings
    │
    ├── Accent Color
    │
    └── Language
           │
           ▼
    AppSettingsStorage
           │
           ▼
         SQLite
```

The active accent color is propagated through the application's theme rather than being manually passed through individual screens.

The selected language is consumed through the centralized localization system, keeping screens independent from language-specific implementation details.

This separation keeps user preferences independent from gameplay state, player progression and equipment rarity semantics.

---

# Visual Identity

VALQUIN follows a **dark mythic minimalism** visual direction.

The interface is intentionally restrained:

* Dark background.
* Simple dark surfaces.
* Clean typography.
* Minimal ornamentation.
* Strong visual hierarchy.
* Controlled use of accent colors.
* Custom symbolic iconography.
* RPG identity expressed primarily through equipment, character and other visual assets.
* Custom atmospheric background elements.
* Dedicated bottom navigation.

The core visual principle is:

> **The UI stays quiet. The world speaks through the assets.**

### Character Identity

VALQUIN's character system introduces a dedicated visual identity layer.

The avatar is treated as a world-building element rather than a conventional UI component.

The base character intentionally uses a simple and understated appearance:

* Slim, lightly built silhouette.
* Slightly elongated limbs.
* Simple fitted clothing.
* Barefoot appearance.
* Minimal visual accessories.
* Distinctive anime-inspired facial features.
* Large expressive eyes.
* Simple hairstyle.

The character is intentionally designed to look like a beginner before equipment is introduced.

This establishes a visual progression principle:

```text
BASE CHARACTER

      │

      ▼

  EQUIPMENT

      │

      ▼

VISUAL IDENTITY

      │

      ▼

SPECIALIZATION
```

The base avatar is therefore not intended to represent the final power level of the player.

Its purpose is to provide a stable visual foundation for equipment, customization and progression systems.

### Avatar Views

The first avatar implementation uses four dedicated production views:

```text
Front

Front 3/4

Side

Back
```

The same character design is preserved across all views.

The avatar can currently be rotated through these views using horizontal swipe gestures.

The implementation validates:

* Asset loading.
* View switching.
* Character positioning.
* Consistent presentation.
* Gesture interaction.
* Integration with the Status screen.
* Equipment compatibility across views.

Future iterations will expand this into a complete 360-degree rotation system.

### Avatar Architecture

Avatar assets are stored independently from the functional UI:

```text
assets/

└── images/

    └── avatar/

        ├── male_01_front.png
        ├── male_01_3q.png
        ├── male_01_side.png
        └── male_01_back.png
```

The avatar system is designed around the idea of separating the character's base appearance from equipment layers.

The current visual architecture is:

```text
Base Avatar
    │
    ├── Equipment
    │
    ├── Weapons
    │
    ├── Shields
    │
    ├── Wings
    │
    └── Future Visual Effects
```

This allows the character to remain visually consistent while equipment progressively changes the player's appearance.

### Equipment Visual Architecture

Equipment assets are organized around the same four-view structure as the avatar:

```text
Equipment Item
      │
      ├── Front
      ├── Front 3/4
      ├── Side
      └── Back
```

The equipment renderer selects the correct asset according to the avatar's current view.

The resulting presentation is:

```text
Avatar View
     │
     ▼
Equipment View
     │
     ▼
Position + Scale
     │
     ▼
Layer Ordering
     │
     ▼
Rendered Character
```

This architecture allows individual equipment categories to define special rendering behavior without coupling that behavior to the main player screen.

Certain equipment types require specific layer handling.

For example:

```text
Shield
    │
    ├── Front      → In front of avatar
    ├── Front 3/4  → In front of avatar
    ├── Side       → Behind avatar
    └── Back       → Behind avatar

Wings
    │
    └── Always behind avatar
```

These rendering rules are handled by the equipment visualization layer.

The result is a more reliable visual representation of equipment without requiring the base avatar assets to change.

The current implementation has been tested with the available avatar views and equipment assets directly in the frontend.

### Branding

VALQUIN's visual identity is built around a custom emblem representing progression, strength and upward movement.

The primary logo combines:

* A shield silhouette.
* A central V symbol.
* Wing-like extensions.
* A red upward arrow representing progression.

The logo is designed as a simple, recognizable symbol rather than a detailed illustration.

The application name is presented separately from the emblem, allowing the logo to function independently as an application icon and visual mark.

The core branding principle is:

> **Forge yourself through progression.**

### Iconography

VALQUIN uses a custom SVG icon system designed specifically for the application.

The icon language combines:

* Strong silhouettes.
* Solid shapes.
* Negative-space cutouts.
* Minimal geometry.
* Symbolic abstraction.
* Subtle fantasy and mythic influence.

The visual references are primarily:

* **MU Online** for equipment silhouettes and RPG inventory concepts.
* **Solo Leveling** for minimalist symbolic UI language.

The final geometry remains original to VALQUIN.

The core icon principle is:

> **An icon should be recognizable by its silhouette before its details.**

Custom icons are currently used for:

* Equipment slots.
* Status navigation.
* Inventory navigation.
* Equipment navigation.
* Player actions and settings.

SVG assets are rendered through reusable Flutter widgets, allowing their color to be controlled by the application's visual system.

### Application Icon

VALQUIN uses a dedicated launcher icon for the Android application.

The launcher icon is based on the VALQUIN emblem and is designed independently from the in-app SVG assets to accommodate Android launcher masking and icon proportions.

The launcher asset uses:

* A square canvas.
* Centered logo geometry.
* Controlled padding.
* A dedicated background.
* The VALQUIN emblem as the primary visual element.

This keeps the application icon visually consistent across Android launchers while preserving the original transparent SVG logo for use inside the application.

### Rarity Glow

Equipment rarity is represented not only through color, but also through a localized glow effect.

The glow is applied to the equipment icon itself rather than the surrounding card.

This creates a visual hierarchy where:

```text
Card

│
├── Border → Equipment rarity
│
└── Icon
     │
     ├── Color → Equipment rarity
     │
     └── Glow → Equipment rarity + active state
```

This keeps the interface restrained while allowing rare equipment to visually stand out.

### Color System

The global application palette is centralized through `AppColors`.

The default visual palette is:

```text
Background       → Black

Surface          → Dark Gray

Default Accent   → Red

Titles           → Yellow

Primary Text     → White

Secondary Text   → Light Gray
```

The application's accent color is user-configurable through the Settings system.

`AppColors.accent` defines the default accent used when no customization has been selected.

At runtime, the active accent is provided through `AppSettings` and exposed to the UI through `ThemeData`.

This architecture allows components to consume:

```dart
Theme.of(context).colorScheme.primary
```

instead of depending directly on a fixed accent color.

The accent color represents interaction, emphasis and player identity.

Yellow is primarily used for titles and important information.

Rarity colors remain independent and preserve their own meaning within the game world.

Semantic state colors such as success, warning and error also remain independent from the configurable accent.

This separation allows the interface to maintain a consistent visual identity without changing the meaning of equipment rarities or system states.

### Background & Atmosphere

VALQUIN's visual architecture separates functional interface elements from atmospheric world-building elements.

The application uses dedicated visual assets to establish a stronger sense of place while keeping the UI itself restrained.

Background elements are designed to:

* Establish the visual atmosphere of VALQUIN.
* Reinforce the fantasy identity of the application.
* Provide depth behind functional screens.
* Support the character and equipment presentation.
* Avoid interfering with readability and interaction.

The background system is intentionally independent from functional UI components so that world-building elements can evolve without coupling them to application logic.

### Bottom Navigation

VALQUIN uses a custom bottom navigation system designed to replace the standard Material navigation appearance.

The navigation bar provides access to the application's primary screens through custom VALQUIN iconography.

The current navigation structure includes:

* Status.
* Inventory.
* Equip.

The navigation system follows the same visual principles as the rest of the application:

* Dark surface.
* Custom SVG icons.
* Minimal visual noise.
* Strong central alignment.
* Consistent icon sizing.
* Clear active-state feedback.
* Accent-based active state.

The navigation bar is treated as part of VALQUIN's visual identity rather than as a generic Flutter component.

### Visual Architecture

VALQUIN separates **interface information** from **world-building elements**.

The UI provides:

```text
Structure

Hierarchy

Interaction

Information
```

While visual assets provide:

```text
Character Identity

Equipment Identity

Fantasy

Mythology

Atmosphere
```

With the v0.7 milestone, the character became the first major world-building element capable of interacting directly with the player's progression.

With v0.7.2, equipment can now participate in that visual layer through dedicated assets and frontend rendering.

This creates the first complete visual loop between:

```text
Player
  │
  ▼
Avatar
  │
  ▼
Equipment
  │
  ▼
Training
  │
  ▼
Progression
```

---

# Development & Database Tools

VALQUIN includes development tools that make database initialization and testing easier during development.

### Database Seeders

The application includes database seeders for initializing the local game database with the required development data.

Seeder execution can be explicitly requested through a command-line argument:

```bash
flutter run -- --seeder
```

This keeps database initialization separate from the normal application startup flow.

The seeded database can be used to quickly populate:

* Exercises.
* Exercise variants.
* Equipment.
* Equipment relationships.
* Requirements.
* Other development data.

This is particularly useful when testing the application from a clean database state.

### Database Administration

VALQUIN also includes database administration tools for development and testing.

The database layer is built around SQLite and Drift, keeping persistent gameplay data structured and locally accessible.

---

# Project Status

### Current Version

**v0.7.3 — Welcome & Character Creation**

Version 0.7.3 introduces the initial player onboarding flow and separates the first-time player experience from the main application flow.

The application now provides a dedicated entry point for new players before entering the main game interface.

The current application includes:

* Welcome screen.
* First-time player onboarding.
* Language selection before character creation.
* English and Spanish localization.
* Runtime language switching.
* Persistent language selection.
* Welcome disclaimer.
* Character creation screen.
* Avatar selection during character creation.
* Player name creation.
* Persistent player name.
* Persistent avatar selection.
* Initial male avatar.
* Level and experience.
* RPG stats.
* Character classes.
* Class progression.
* Exercise variants.
* SQLite persistence.
* Equipment system.
* Inventory.
* Equipment slots.
* Equipment rarity.
* Rarity-based visual styling.
* Equipment/exercise relationships.
* Equipment stat bonuses.
* Unlock requirements.
* Equip requirements.
* Class compatibility.
* Training plan management.
* Active equipment selection.
* Daily exercise generation.
* Equipment cooldowns.
* Training execution.
* Training progression.
* Local persistence.
* Automated tests.
* Database seeders.
* Command-line seeder execution.
* Database administration tools.
* Centralized application colors.
* Centralized application icons.
* Unified dark application palette.
* Custom SVG icon system.
* Custom equipment slot icons.
* Custom navigation icons.
* Reusable icon rendering widget.
* Reusable icon glow widget.
* Rarity-based icon glow.
* Unified visual language across Status, Inventory and Equip screens.
* Final VALQUIN logo.
* Android launcher icon.
* VALQUIN application name.
* Custom atmospheric background.
* Redesigned bottom navigation.
* Custom navigation layout and positioning.
* Settings system.
* Runtime accent color customization.
* Runtime language selection.
* English and Spanish localization.
* Persistent accent color settings.
* Persistent language settings.
* Reactive application theme.
* Reactive localization updates.
* Theme-based accent color usage across the UI.
* Initial male avatar.
* Dedicated avatar assets.
* Four avatar production views.
* Front avatar view.
* Front 3/4 avatar view.
* Side avatar view.
* Back avatar view.
* Horizontal swipe avatar rotation.
* Avatar integration into the Status screen.
* Equipment PNG assets.
* View-specific equipment assets.
* Equipment visualization in the frontend.
* Equipment positioning relative to avatar views.
* Equipment layer ordering.
* Shield-specific layer handling.
* Wing-specific rear-layer rendering.
* Equipment visualization testing across avatar views.
* Welcome-to-character-creation navigation flow.
* Character creation validation.
* Avatar selection during character creation.
* Persistent avatar identity across application restarts.

The current first-time player flow is:

```text
Application Start
       │
       ▼
   Has Player?
    /      \
  No        Yes
  │          │
  ▼          ▼
Welcome     Main
  │
  ▼
Create Player
  │
  ▼
Main
```

The Welcome Screen provides the initial application introduction and allows the player to select the application language before creating a character.

The Create Player Screen provides the initial character setup:

```text
Select Language
       │
       ▼
Welcome Screen
       │
       ▼
Select Avatar
       │
       ▼
Enter Player Name
       │
       ▼
Create Player
       │
       ▼
Main Application
```

The selected language, player name and avatar identity are persisted locally.

The avatar selected during character creation is now used throughout the player presentation system instead of relying on a hardcoded default avatar.

The current character system therefore has a complete first-time setup flow from application launch to the main gameplay interface.

The core database and domain architecture remain established.

The functional UI has been redesigned around a consistent visual foundation.

The application now has a defined visual language for:

```text
Color

Rarity

Iconography

Branding

Navigation

Background

Atmosphere

Character Identity

Avatar Presentation

Equipment Presentation

Layering

Interaction States

Customization

Localization

Onboarding
```

The current system intentionally uses four production avatar views.

The next avatar iteration will expand the rotation toward a complete **360-degree view**.

The remaining equipment visualization work includes accessory assets and additional visual content.

---

# Roadmap

## v0.6 — UI & Visual Identity

The v0.6 milestone focused on transforming the functional RPG interface into a cohesive visual experience.

### Completed

* Screen layout redesign.
* Status screen redesign.
* Inventory redesign.
* Equipment screen redesign.
* Equipment rarity visualization.
* Rarity-based colors and glow effects.
* Daily training plan visualization.
* Equipment cooldown visualization.
* Improved interaction feedback.
* Reusable visual configuration.
* Centralized application colors.
* Centralized application icons.
* Unified dark visual palette.
* Initial VALQUIN visual language.
* Navigation bar redesign.
* Custom VALQUIN icons.
* Custom equipment slot visuals.
* Rarity-based icon glow.
* Final VALQUIN logo.
* Android launcher icon.
* VALQUIN application name.
* Custom atmospheric background.
* Bottom navigation refinement.
* Navigation icon positioning and spacing.
* Settings architecture.
* Accent color customization.
* Runtime theme updates.
* Theme-based accent color consumption.
* Language selection.
* English and Spanish localization.
* Runtime language updates.
* Persistent application settings.
* Persistent accent color.
* Persistent language selection.

---

## v0.7 — Avatar & Character Presentation

The v0.7 milestone introduced the first real character presentation system.

### Completed

* Initial male avatar.
* Male avatar 01.
* Dedicated avatar artwork.
* Four production views.
* Front view.
* Front 3/4 view.
* Side profile.
* Back view.
* Avatar asset organization.
* Avatar integration into the Status screen.
* Avatar positioning and presentation.
* Horizontal swipe interaction.
* Sequential avatar rotation.
* Base character designed as an equipment-ready RPG avatar.
* Foundation for future equipment layering.

### v0.7.2 — Mid Version

The v0.7.2 creates modularization on Player Screen.

### Completed

* Production PNG assets for the current equipment catalog.
* Equipment assets for multiple equipment slots.
* Four-view equipment assets.
* Front equipment rendering.
* Front 3/4 equipment rendering.
* Side equipment rendering.
* Back equipment rendering.
* Equipment positioning relative to the avatar.
* Equipment scale and alignment.
* Equipment layer ordering.
* Shield-specific layer behavior.
* Wings rendered behind the avatar.
* Frontend testing with the available avatar views.
* Integration between avatar and equipment visualization.
* Seeder execution arguments.
* Explicit database seeder execution through `--seeder`.
* Corrections to avatar/equipment rendering layers.
* Initial vertical slice connecting avatar, equipment and frontend presentation.

Accessory visual assets remain pending.

### Next Step

* Complete accessory visual assets.
* Full 360-degree avatar rotation.
* Bidirectional continuous rotation.
* Additional avatar variants.
* Female avatar variants.
* Blond and dark-haired variants.
* Improved avatar transition animations.
* Avatar selection system.
* Persistent avatar selection.

### Future Avatar & Equipment Work

* Complete equipment visual layering.
* Weapon visualization expansion.
* Armor visualization expansion.
* Hair variations.
* Character customization.
* Dynamic equipment appearance.
* Visual progression based on player equipment.
* Character-specific visual states.
* Additional equipment visual effects.
* More complete accessory visualization.

---

# Future Development

### RPG Progression

* More character classes.
* Class-specific exercises.
* Advanced specialization paths.
* More equipment tiers.
* More complex progression requirements.
* Additional RPG mechanics.

### Training

* Expanded exercise database.
* More exercise variants.
* Training history.
* Progress tracking.
* More training types.
* More meaningful stat progression.

### Visual Experience

* Complete 360-degree avatar rotation.
* Character customization.
* Multiple avatar variants.
* Complete equipment visual representation.
* Weapon visualization.
* Animated progression.
* Unlock animations.
* Level-up feedback.
* Rare equipment effects.
* More immersive RPG screens.
* Custom VALQUIN visual assets.
* Dynamic visual states.

### Application Customization

* Additional accent color options.
* Custom avatar configuration.
* Avatar selection.
* Additional personalization options.

### Long-Term Vision

The long-term goal is to create a fitness application where **training itself becomes the progression system**.

The RPG layer should not distract from real-world training.

It should make the process of training more engaging.

```text
REAL TRAINING

      │

      ▼

   PROGRESS

      │

      ▼

   EXPERIENCE

      │

      ▼

     LEVEL

      │

      ▼

     STATS

      │

      ▼

  EQUIPMENT

      │

      ▼

 SPECIALIZATION

      │

      ▼

 NEW TRAINING

      │

      └───────────────►
```

---

# Project Philosophy

VALQUIN is built around a simple idea:

> **Forge yourself through real training.**

The RPG mechanics exist to reinforce the habit of training.

Every workout should contribute to something:

```text
Train

↓

Improve

↓

Level Up

↓

Unlock

↓

Specialize

↓

Become Stronger
```

The goal is not to create a game that happens to contain workouts.

The goal is to create a **training system that feels like an RPG**.

---

### VALQUIN

**Forge Yourself.**
