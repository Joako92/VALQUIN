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
