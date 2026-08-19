# solo_training_001

# Product Vision

Solo Training es una aplicación móvil inspirada en Solo Leveling que transforma el progreso físico en una experiencia RPG mediante el registro rápido de entrenamientos y la evolución del personaje.

Inspirada en juegos RPG como MU Online y Shining Force, y en la serie Solo Leveling.

La misión es lograr la combinación perfecta entre juego RPG y entrenamiento real y serio.

La visión es hacerlo a través de una app con interfaz simple pero llamativa. Que llegue a los corazones de esos niños de los 90s criados con juegos de rol y series animadas que enfatizaban el progreso, la motivación, la disciplina y el entrenamiento, como Dragon Ball, Los Caballeros del Zodiaco, etc.

---

# Stack

- Flutter
- Dart
- SQLite
- Drift
- Riverpod

---

# Versión

**v0.2.1 — Persistencia local: Equipamiento persistente**

# Casos de uso

| #  | Caso                                                  | Resultado                                              |
| -- | ----------------------------------------------------- | ------------------------------------------------------ |
| 1  | Equipa un item                                        | El item queda persistido                               |
| 2  | Desequipa un item                                     | El item deja de estar persistido                       |
| 3  | Reemplaza un item                                     | El nuevo item queda persistido                         |
| 4  | Activa un slot                                        | El slot activo queda persistido                        |
| 5  | Desactiva un slot                                     | El slot deja de estar activo al volver a abrir         |
| 6  | Ejecuta un entrenamiento                              | El cooldown queda persistido                           |
| 7  | Cierra y vuelve a abrir la aplicación                 | Equipment, slots activos y cooldowns se restauran      |
| 8  | Abre la aplicación mientras un cooldown sigue vigente | El cooldown continúa desde el tiempo restante correcto |
| 9  | Abre la aplicación después de que un cooldown expiró  | El item vuelve a estar disponible                      |
| 10 | No existe TrainingPlan persistido                     | Se inicia un TrainingPlan vacío                        |

# Estado

La aplicación cuenta actualmente con:

- Modelo de jugador.
- Sistema de estadísticas.
- Ejercicios con cantidades y unidades.
- Ejercicios agrupados dentro de objetos de equipamiento.
- Slots de equipamiento.
- Rarezas de objetos.
- Sistema de ejercicios equipados.
- Sistema de piezas activas por día.
- Cooldown por pieza de equipamiento.
- Identificadores únicos para ejercicios y objetos.
- Inventario y filtros por slot.
- Pantalla de equipamiento.
- Interfaz RPG básica.

La persistencia mediante SQLite/Drift y la lógica completa de progresión todavía se encuentran en desarrollo.

---

# Arquitectura

lib/
│
├── main.dart
├── app.dart
│
├── data/
│   ├── exercises.dart
│   ├── equipment_items.dart
│   ├── player.dart
│   └── training_plan.dart
│
├── models/
│   ├── exercise.dart
│   ├── equipment_item.dart
│   ├── equipment_slot.dart
│   ├── rarity.dart
│   ├── player.dart
│   └── training_plan.dart
│
├── screens/
│   ├── main_screen.dart
│   ├── player_screen.dart
│   ├── inventory_screen.dart
│   └── equip_screen.dart
│
└── widgets/
    ├── attribute_card.dart
    ├── equipment_item.dart
    ├── equipment_slot.dart
    ├── exercise_item.dart
    └── inventory_filter.dart

# Correr devug en el teléfono

flutter run -d ZY22KXJ833