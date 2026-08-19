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

**v0.3.0 — Class Progression**

# Casos de uso

| #  | Caso                                                   | Resultado                                                        |
| -- | ------------------------------------------------------ | ---------------------------------------------------------------- |
| 1  | Jugador alcanza nivel 5 siendo `Novice`                | Se habilita la evaluación para cambio de clase                   |
| 2  | `Novice` tiene `Strength >= 100`                       | Se habilita **Power Lifter**                                     |
| 3  | `Novice` tiene `Endurance >= 100`                      | Se habilita **BodyBuilder**                                      |
| 4  | `Novice` tiene `Energy >= 100`                         | Se habilita **Gymnast**                                          |
| 5  | `Novice` tiene `Stamina >= 100`                        | Se habilita **Runner**                                           |
| 6  | Cumple requisitos de varias clases especializadas      | Todas las clases correspondientes quedan disponibles para elegir |
| 7  | No cumple ningún requisito de clase especializada      | No se habilita ningún cambio de clase                            |
| 8  | Jugador elige una clase especializada                  | La clase actual cambia de `Novice` a la clase seleccionada       |
| 9  | Jugador ya tiene una clase especializada               | No puede volver a elegir otra clase especializada                |
| 10 | Jugador alcanza `100` en todos los stats               | Se habilita **Athlete**, independientemente de su clase actual   |
| 11 | Jugador especializado alcanza `100` en todos los stats | Puede realizar el cambio definitivo a **Athlete**                |
| 12 | Jugador elige `Athlete`                                | La clase pasa a ser `Athlete` y no puede volver a cambiar        |
| 13 | Jugador no cumple nivel mínimo                         | No se habilita ninguna clase                                     |
| 14 | Los stats cambian después de desbloquear una clase     | La clase ya disponible no se pierde                              |
| 15 | Jugador cierra y vuelve a abrir la aplicación          | La clase actual se mantiene persistida                           |

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