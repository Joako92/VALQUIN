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

**v0.4.6 — Equipment Item Migration**

> Nota: el commit anterior fue etiquetado como `0.4.5`, pero corresponde funcionalmente a la versión `0.4.6`.

# Cambios en esta versión

* Se continuó la migración del contenido de dominio hacia SQLite mediante Drift.
* Se creó la tabla `EquipmentItems`.
* Se implementó el modelo de persistencia `EquipmentItemRow` generado por Drift.
* Se implementó el CRUD completo de `EquipmentItem`.
* Se implementó `insertEquipmentItem()` para crear objetos de equipamiento en SQLite.
* Se implementó `getEquipmentItem(id)` para obtener un objeto de equipamiento desde SQLite.
* Se implementó `updateEquipmentItem()` para modificar objetos de equipamiento.
* Se implementó `deleteEquipmentItem()` para eliminar objetos de equipamiento.

## Relación EquipmentItem ↔ Exercise

* Se creó la tabla `EquipmentItemExercises`.
* Se implementó la relación `EquipmentItem ↔ Exercise`.
* Se incorporó `maxVariant` a la relación `EquipmentItemExercises` para determinar hasta qué variante de un ejercicio puede utilizar el objeto.
* Se implementó la prevención de relaciones duplicadas entre un objeto de equipamiento y un ejercicio.
* Se implementó `insertEquipmentItemExercise()`.
* Se implementó `getEquipmentItemExercise()`.
* Se implementó `getEquipmentItemExercises(equipmentItemId)`.
* Se implementó `updateEquipmentItemExercise()` para modificar el `maxVariant` de una relación.
* Se implementó `deleteEquipmentItemExercise()`.

## Stats

* Se creó la tabla `EquipmentItemStats`.
* Se implementó la relación `EquipmentItem ↔ Stats`.
* Se implementó `insertEquipmentItemStat()`.
* Se implementó `getEquipmentItemStat()`.
* Se implementó `getEquipmentItemStatRows()`.
* Se implementó `getEquipmentItemStats()` para reconstruir los stats como `Map<String, int>`.
* Se implementó `updateEquipmentItemStat()`.
* Se implementó `deleteEquipmentItemStat()`.

## Unlock Requirements

* Se creó la tabla `EquipmentItemUnlockRequirements`.
* Se implementó la persistencia de los requisitos necesarios para desbloquear un objeto.
* Se implementó `insertEquipmentItemUnlockRequirement()`.
* Se implementó `getEquipmentItemUnlockRequirement()`.
* Se implementó `getEquipmentItemUnlockRequirements()`.
* Se implementó `updateEquipmentItemUnlockRequirement()`.
* Se implementó `deleteEquipmentItemUnlockRequirement()`.

## Equip Requirements

* Se creó la tabla `EquipmentItemEquipRequirements`.
* Se implementó la persistencia de los requisitos necesarios para equipar un objeto.
* Se implementó `insertEquipmentItemEquipRequirement()`.
* Se implementó `getEquipmentItemEquipRequirement()`.
* Se implementó `getEquipmentItemEquipRequirements()`.
* Se implementó `updateEquipmentItemEquipRequirement()`.
* Se implementó `deleteEquipmentItemEquipRequirement()`.

## Reconstrucción del modelo de dominio

* Se implementó la reconstrucción completa de un `domain.EquipmentItem` desde SQLite.
* Se implementó `getEquipmentItemWithExercises()`.
* Se implementó `getEquipmentItemsWithExercises()`.
* Se implementó `getEquipmentItemWithAllData()`.
* Se implementó `getEquipmentItemsWithAllData()`.
* Se implementó la conversión de `EquipmentItemRow` hacia el modelo de dominio `EquipmentItem`.
* Se implementó la conversión de las relaciones persistidas hacia `EquipmentExercise`.
* Se implementó la reconstrucción de stats.
* Se implementó la reconstrucción de `unlockRequirements`.
* Se implementó la reconstrucción de `equipRequirements`.
* Se creó una función interna `_buildEquipmentRequirement()` para convertir las filas persistidas en `EquipmentRequirement`.
* Se mantuvieron separados los modelos de dominio de los Data Classes generados por Drift.

# Modelo de persistencia actual

La estructura de datos relacionada con ejercicios y equipamiento queda organizada de la siguiente manera:

```text
EquipmentItem
│
├── EquipmentItemExercises
│       │
│       ├── exerciseId
│       └── maxVariant
│
├── EquipmentItemStats
│       │
│       ├── stat
│       └── value
│
├── EquipmentItemUnlockRequirements
│       │
│       ├── condition
│       └── value
│
└── EquipmentItemEquipRequirements
        │
        ├── condition
        └── value


Exercise
│
└── ExerciseVariantLinks
        │
        └── ExerciseVariant
```

Esto permite que:

* Un `EquipmentItem` tenga múltiples ejercicios.
* Un mismo `Exercise` pueda pertenecer a múltiples `EquipmentItem`.
* Cada relación `EquipmentItem ↔ Exercise` pueda definir su propio `maxVariant`.
* Un `Exercise` pueda tener múltiples variantes.
* Las variantes sean reutilizables y estén desacopladas del equipamiento.
* Un `EquipmentItem` tenga múltiples stats.
* Un `EquipmentItem` tenga múltiples requisitos de desbloqueo.
* Un `EquipmentItem` tenga múltiples requisitos para ser equipado.
* Los requisitos puedan representar nivel o stats mediante `condition` + `value`.
* Los datos persistidos puedan reconstruirse nuevamente como modelos de dominio.

# Tests de esta versión

Se agregaron tests automatizados para validar:

* CRUD de `EquipmentItem`.
* CRUD de `EquipmentItemExercises`.
* CRUD de `EquipmentItemStats`.
* CRUD de `EquipmentItemUnlockRequirements`.
* CRUD de `EquipmentItemEquipRequirements`.
* Creación de relaciones `EquipmentItem ↔ Exercise`.
* Lectura individual de relaciones.
* Lectura múltiple de ejercicios asociados a un objeto.
* Prevención de relaciones duplicadas.
* Actualización de `maxVariant`.
* Eliminación de relaciones.
* Lectura de múltiples stats.
* Actualización de stats.
* Eliminación de stats.
* Persistencia de requisitos de desbloqueo.
* Persistencia de requisitos de equipamiento.
* Reconstrucción de un `EquipmentItem` desde SQLite.
* Reconstrucción de los ejercicios asociados.
* Reconstrucción de los stats.
* Reconstrucción de los requisitos de desbloqueo.
* Reconstrucción de los requisitos de equipamiento.
* Conversión correcta de los datos persistidos hacia los modelos de dominio.
* Uso de `maxVariant` durante la reconstrucción del equipamiento.

**Resultado final:**

```text
87 tests passed
0 tests failed
```

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
* Tabla de relaciones `ExerciseVariantLinks`.
* Relación entre ejercicios y variantes.
* Reconstrucción de ejercicios desde SQLite.
* Tabla de objetos de equipamiento.
* CRUD de `EquipmentItem`.
* Tabla de relaciones `EquipmentItemExercises`.
* Relación entre objetos de equipamiento y ejercicios.
* `maxVariant` por relación entre objeto y ejercicio.
* Tabla de stats de equipamiento.
* Tabla de requisitos de desbloqueo.
* Tabla de requisitos de equipamiento.
* Reconstrucción completa de objetos de equipamiento desde SQLite.
* Conversión de datos de persistencia a modelos de dominio.
* CRUD de base de datos validado mediante tests automatizados.
* Relaciones de base de datos validadas mediante tests automatizados.
* Reconstrucción de modelos de dominio validada mediante tests automatizados.
* Seeders disponibles como herramientas de desarrollo y testing.

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
│   ├── seed/
│   │   └── exercise_seeder.dart
│   │
│   └── tables/
│       ├── test_entries.dart
│       ├── exercise_variants.dart
│       ├── exercises.dart
│       ├── exercise_variant_links.dart
│       ├── equipment_items.dart
│       ├── equipment_item_exercises.dart
│       ├── equipment_item_stats.dart
│       ├── equipment_item_unlock_requirements.dart
│       └── equipment_item_equip_requirements.dart
│
├── models/
│   ├── exercise.dart
│   ├── equipment_item.dart
│   ├── equipment_slot.dart
│   ├── rarity.dart
│   ├── equipment_requirement.dart
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

Para ejecutar los tests de relaciones entre objetos de equipamiento y ejercicios:

```bash
flutter test test/database/equipment_item_exercises_test.dart
```

Para ejecutar los tests de stats:

```bash
flutter test test/database/equipment_item_stats_test.dart
```

Para ejecutar los tests de requisitos de desbloqueo:

```bash
flutter test test/database/equipment_item_unlock_requirements_test.dart
```

Para ejecutar los tests de requisitos de equipamiento:

```bash
flutter test test/database/equipment_item_equip_requirements_test.dart
```

Para ejecutar los tests del seeder:

```bash
flutter test test/database/exercise_seeder_test.dart
```

Para ejecutar todos los tests:

```bash
flutter test
```

# Operaciones validadas

**INSERT ✓**

**READ ✓**

**UPDATE ✓**

**DELETE ✓**

**RELATIONS ✓**

**SEEDING ✓**

**DOMAIN RECONSTRUCTION ✓**

**EQUIPMENT STATS ✓**

**UNLOCK REQUIREMENTS ✓**

**EQUIP REQUIREMENTS ✓**

**FULL TEST SUITE — 87 TESTS PASSING ✓**

# Cierre de versión

La versión `v0.4.6` deja completada la migración inicial del `EquipmentItem` hacia SQLite.

El objeto de equipamiento ya no depende exclusivamente de datos hardcodeados para reconstruirse. Su información principal, ejercicios asociados, stats, requisitos de desbloqueo y requisitos de equipamiento pueden persistirse en SQLite y reconstruirse nuevamente como objetos de dominio.

La separación entre **persistencia** y **dominio** queda establecida como base arquitectónica para continuar migrando el resto de la aplicación.

**v0.4.6 — CLOSED ✓**
