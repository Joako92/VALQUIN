# solo_training_001

# Product Vision

Solo Training es una aplicación móvil inspirada en Solo Leveling que transforma el progreso físico en una experiencia RPG mediante el registro rápido de entrenamientos y la evolución del personaje.

Inspirada en juegos RPG como MU Online y Shining Force, y en la serie Solo Leveling.

La misión es lograr la combinación perfecta entre juego RPG y entrenamiento real y serio.

La visión es hacerlo a través de una app con interfaz simple pero llamativa. Que llegue a los corazones de esos niños de los 90s criados con juegos de rol y series animadas que enfatizaban el progreso, la motivación, la disciplina y el entrenamiento, como Dragon Ball, Los Caballeros del Zodiaco, etc.

# Stack

* Flutter
* Dart
* SQLite
* Drift
* Riverpod

# Versión

**v0.4.3 — Exercise ↔ ExerciseVariant**

# Cambios en esta versión

* Se consolidó SQLite como sistema de persistencia local de la aplicación.

* Se incorporó Drift como ORM y capa de acceso a la base de datos.

* Se incorporó `build_runner` y `drift_dev` para la generación de código de Drift.

* Se creó la estructura inicial de la base de datos y sus tablas.

* Se creó la tabla `TestEntries` para validar la conexión y las operaciones básicas de persistencia.

* Se implementaron y testearon las operaciones básicas de CRUD: crear, leer, actualizar y eliminar registros.

* Se configuró la base de datos para utilizar un `QueryExecutor` alternativo durante los tests.

* Se creó la tabla `ExerciseVariants`.

* Se implementó el CRUD completo de `ExerciseVariant`.

* Se validaron mediante tests automatizados las operaciones INSERT, READ, UPDATE y DELETE de `ExerciseVariant`.

* Se creó la tabla `Exercises`.

* Se implementó el CRUD completo de `Exercise`.

* Se validaron mediante tests automatizados las operaciones INSERT, READ, UPDATE y DELETE de `Exercise`.

* Se estableció la base para relacionar posteriormente los ejercicios con sus variantes mediante la base de datos.

* Se mantuvo la arquitectura actual de la aplicación funcionando mientras se incorpora progresivamente la nueva capa de persistencia.

* Relación Exercise ↔ ExerciseVariant.

* Prevención de relaciones duplicadas.

# Casos de uso

| # | Caso                                                   | Resultado                                                        |
| - | ------------------------------------------------------ | ---------------------------------------------------------------- |
| 1 | Jugador alcanza nivel 5 siendo `Novice`                | Se habilita el cambio de clase                                   |
| 2 | `Novice` alcanza `100` en un stat                      | Se habilita la clase especializada correspondiente               |
| 3 | Cumple requisitos de varias clases especializadas      | Todas las clases correspondientes quedan disponibles para elegir |
| 4 | Jugador elige una clase especializada                  | La clase actual cambia de `Novice` a la clase seleccionada       |
| 5 | Jugador especializado alcanza `100` en todos los stats | Se habilita **Athlete**                                          |
| 6 | Jugador elige `Athlete`                                | La clase pasa a ser `Athlete` y no puede volver a cambiar        |
| 7 | Jugador cierra y vuelve a abrir la aplicación          | El progreso y la clase actual se mantienen                       |
| 8 | Jugador decide comenzar nuevamente                     | Puede resetear su progreso manteniendo sus objetos desbloqueados |

# Estado

La aplicación cuenta actualmente con:

* Creación y persistencia de jugadores.
* Sistema de estadísticas.
* Sistema de nivel y experiencia.
* Sistema de clases y progresión.
* Ejercicios con cantidades, unidades y variantes.
* Ejercicios agrupados dentro de objetos de equipamiento.
* Slots de equipamiento.
* Rarezas de objetos.
* Sistema de ejercicios equipados.
* Sistema de piezas activas por día.
* Cooldown por pieza de equipamiento.
* Identificadores únicos para ejercicios y objetos.
* Inventario y filtros por slot.
* Pantalla de equipamiento.
* Ejecución de entrenamientos.
* Ganancia de estadísticas.
* Reset del jugador.
* Interfaz RPG básica.
* Persistencia local.
* SQLite integrado.
* Drift integrado.
* Capa inicial de acceso a datos.
* Tabla de variantes de ejercicio.
* CRUD de `ExerciseVariant`.
* Tabla de ejercicios.
* CRUD de `Exercise`.
* CRUD de base de datos validado mediante tests automatizados.

# Arquitectura

```text
lib/

│
├── main.dart
├── app.dart
│
├── data/
│   ├── exercises.dart
│   └── equipment_items.dart
│
├── database/
│   ├── app_database.dart
│   │
│   └── tables/
│       ├── test_entries.dart
│       ├── exercise_variants.dart
│       └── exercises.dart
│
├── models/
│   ├── exercise.dart
│   ├── equipment_item.dart
│   ├── equipment_slot.dart
│   ├── player.dart
│   ├── player_class.dart
│   └── training_plan.dart
│
├── managers/
│   ├── player_manager.dart
│   ├── training_plan_manager.dart
│   └── class_manager.dart
│
├── persistence/
│   ├── player_storage.dart
│   └── training_plan_storage.dart
│
├── screens/
│   ├── main_screen.dart
│   ├── create_player_screen.dart
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
```

# Correr debug en el teléfono

```bash
flutter run -d ZY22KXJ833
```

# Tests

Para ejecutar los tests de la base de datos:

```bash
flutter test test/database/app_database_test.dart
```

# Actualmente se encuentran validadas las operaciones:

INSERT ✓

READ ✓

UPDATE ✓

DELETE ✓
