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

**v0.5.1 — Full Exercise SQL Integration & Database Admin**

# Cambios en esta versión

Esta versión continúa la migración del contenido de dominio hacia SQLite mediante Drift.

El objetivo principal de este snapshot es completar la eliminación de las referencias al contenido estático de `data/exercises.dart` en las pantallas que utilizan ejercicios.

Los ejercicios utilizados por Inventory y Equip ahora se obtienen directamente desde la base de datos.

Además, se incorporaron herramientas administrativas de desarrollo para inspeccionar y eliminar datos persistidos durante el desarrollo.

## Ejercicios desde SQLite

* Se eliminó la dependencia de `data/exercises.dart` en `InventoryScreen`.

* Se eliminó la dependencia de `data/exercises.dart` en `EquipScreen`.

* Los ejercicios asociados a un `EquipmentItem` ahora se resuelven directamente desde SQLite.

* Los datos de los ejercicios se obtienen mediante `AppDatabase`.

* Las variantes de los ejercicios se reconstruyen desde SQLite.

* `maxVariant` continúa determinando hasta qué variante de un ejercicio puede utilizar un `EquipmentItem`.

* Se mantiene la separación entre modelos de persistencia generados por Drift y modelos de dominio.

* InventoryScreen ahora consume completamente los `EquipmentItem` reconstruidos desde SQLite.

* EquipScreen utiliza los ejercicios asociados a los objetos equipados provenientes de SQLite.

La aplicación deja de depender de una lista estática de ejercicios para representar el contenido del inventario y del equipamiento.

## EquipmentItem

Se mantiene la integración completa de `EquipmentItem` con SQLite mediante Drift.

* Tabla `EquipmentItems`.

* Modelo de persistencia `EquipmentItemRow` generado por Drift.

* CRUD completo de `EquipmentItem`.

* `insertEquipmentItem()`.

* `getEquipmentItem(id)`.

* `updateEquipmentItem()`.

* `deleteEquipmentItem()`.

## Relación EquipmentItem ↔ Exercise

* Tabla `EquipmentItemExercises`.

* Relación `EquipmentItem ↔ Exercise`.

* `maxVariant` por relación.

* Prevención de relaciones duplicadas.

* `insertEquipmentItemExercise()`.

* `getEquipmentItemExercise()`.

* `getEquipmentItemExercises(equipmentItemId)`.

* `updateEquipmentItemExercise()`.

* `deleteEquipmentItemExercise()`.

## Stats

* Tabla `EquipmentItemStats`.

* Relación `EquipmentItem ↔ Stats`.

* `insertEquipmentItemStat()`.

* `getEquipmentItemStat()`.

* `getEquipmentItemStatRows()`.

* `getEquipmentItemStats()`.

* `updateEquipmentItemStat()`.

* `deleteEquipmentItemStat()`.

Los stats persistidos continúan reconstruyéndose como:

```dart
Map<String, int>
```

## Unlock Requirements

* Tabla `EquipmentItemUnlockRequirements`.

* Persistencia de los requisitos necesarios para desbloquear un objeto.

* `insertEquipmentItemUnlockRequirement()`.

* `getEquipmentItemUnlockRequirement()`.

* `getEquipmentItemUnlockRequirements()`.

* `updateEquipmentItemUnlockRequirement()`.

* `deleteEquipmentItemUnlockRequirement()`.

## Equip Requirements

* Tabla `EquipmentItemEquipRequirements`.

* Persistencia de los requisitos necesarios para equipar un objeto.

* `insertEquipmentItemEquipRequirement()`.

* `getEquipmentItemEquipRequirement()`.

* `getEquipmentItemEquipRequirements()`.

* `updateEquipmentItemEquipRequirement()`.

* `deleteEquipmentItemEquipRequirement()`.

## Reconstrucción del modelo de dominio

Se mantiene la reconstrucción completa de los objetos de equipamiento desde SQLite.

* `getEquipmentItemWithExercises()`.

* `getEquipmentItemsWithExercises()`.

* `getEquipmentItemWithAllData()`.

* `getEquipmentItemsWithAllData()`.

* Conversión de `EquipmentItemRow` hacia el modelo de dominio `EquipmentItem`.

* Conversión de las relaciones persistidas hacia `EquipmentExercise`.

* Reconstrucción de stats.

* Reconstrucción de `unlockRequirements`.

* Reconstrucción de `equipRequirements`.

* Función interna `_buildEquipmentRequirement()`.

* Conversión de `Rarity` y `EquipmentSlot` desde los valores persistidos.

* Los modelos de dominio permanecen separados de los Data Classes generados por Drift.

# Database Admin

Se incorporó una capa de herramientas administrativas para desarrollo y testing:

```text
database/
│
└── database_admin.dart
```

## Inspección de ejercicios

Se incorporaron métodos para inspeccionar el contenido de la base de datos durante el desarrollo.

### `printExercises()`

Permite imprimir todos los ejercicios almacenados en SQLite:

```text
EXERCISES IN DATABASE
TOTAL: X

ID: ...
NAME: ...
```

### `debugExerciseDatabase()`

Permite inspeccionar la estructura completa de cada ejercicio:

```text
Exercise
├── Variant links
│   └── ExerciseVariant
│
└── Equipment relations
```

Incluye:

* ID del ejercicio.
* Nombre.
* Cantidad de variantes asociadas.
* ID de cada variante.
* Índice de variante.
* Sets.
* Amount.
* Unit.
* Relaciones con `EquipmentItem`.
* `maxVariant` de cada relación.

## Inspección de equipamiento

### `debugEquipmentDatabase()`

Permite inspeccionar todos los objetos de equipamiento almacenados en SQLite.

Incluye:

* ID.
* Nombre.
* Cantidad de ejercicios asociados.
* ID de cada ejercicio.
* `maxVariant`.

Esto permite verificar rápidamente el estado real de la base de datos durante el desarrollo.

## Eliminación de ejercicios

### `deleteExercise()`

Se incorporó una operación administrativa para eliminar completamente un ejercicio.

La eliminación se realiza mediante:

```dart
deleteExerciseCompletely()
```

La operación elimina:

1. Relaciones `EquipmentItem → Exercise`.
2. Relaciones `Exercise → ExerciseVariant`.
3. Variantes asociadas.
4. El ejercicio.

La operación se ejecuta dentro de una transacción.

## Eliminación de EquipmentItem

Se incorporó una operación administrativa equivalente para eliminar objetos de equipamiento durante el desarrollo.

Esto permite limpiar objetos antiguos, objetos de testing o datos obsoletos directamente desde las herramientas administrativas.

La eliminación debe contemplar las relaciones asociadas al objeto antes de eliminar el registro principal.

Durante este snapshot se utilizaron estas herramientas para limpiar objetos antiguos de la base de datos:

* `Casco del novato`.
* `Pechera del novato`.
* `Inequipable`.

Se mantiene:

* `Carameloraro`.

Este último permanece intencionalmente como objeto de prueba.

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

# Flujo actual de datos

El flujo principal de datos queda establecido de la siguiente manera:

```text
SQLite
   │
   ▼
Drift
   │
   ▼
AppDatabase
   │
   ├── Exercise
   │      └── ExerciseVariants
   │
   └── EquipmentItem
          ├── Exercises
          ├── Stats
          ├── Unlock Requirements
          └── Equip Requirements
   │
   ▼
Domain Models
   │
   ▼
Managers
   │
   ├── InventoryScreen
   └── EquipScreen
```

De esta manera, las pantallas ya no necesitan importar directamente los datos estáticos desde `data/exercises.dart` para resolver los ejercicios.

# Tests de esta versión

Se mantienen los tests automatizados para validar:

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
* Integridad de las relaciones entre ejercicios y equipamiento.

**Resultado final:**

```text
+86: All tests passed!  
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
* Ejercicios almacenados en SQLite.
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
* Capa de acceso a datos.
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
* InventoryScreen consumiendo `EquipmentItem` desde SQLite.
* EquipScreen consumiendo ejercicios desde SQLite.
* Eliminación de la dependencia de `data/exercises.dart` en InventoryScreen.
* Eliminación de la dependencia de `data/exercises.dart` en EquipScreen.
* CRUD de base de datos validado mediante tests automatizados.
* Relaciones de base de datos validadas mediante tests automatizados.
* Reconstrucción de modelos de dominio validada mediante tests automatizados.
* Seeders disponibles como herramientas de desarrollo y testing.
* Herramientas administrativas para inspección de ejercicios.
* Herramientas administrativas para inspección de equipamiento.
* Eliminación administrativa de ejercicios.
* Eliminación administrativa de objetos de equipamiento.

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
│   ├── database_admin.dart
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

> `data/exercises.dart` y `data/equipment_items.dart` pueden permanecer temporalmente como fuentes estáticas utilizadas por seeders, desarrollo o testing. Las pantallas principales ya no dependen directamente de estos archivos para leer los datos.

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

**EXERCISE SQL CONSUMPTION ✓**

**EQUIPMENT STATS ✓**

**UNLOCK REQUIREMENTS ✓**

**EQUIP REQUIREMENTS ✓**

**DATABASE ADMIN ✓**

**FULL TEST SUITE — 86 TESTS PASSING ✓**

# Cierre de versión

La versión **v0.5.1** consolida la integración del sistema de ejercicios y equipamiento con SQLite mediante Drift.

Los `Exercise`, sus variantes y las relaciones con `EquipmentItem` pueden persistirse y reconstruirse desde la base de datos.

`EquipmentItem`, sus ejercicios, variantes disponibles, stats, requisitos de desbloqueo y requisitos de equipamiento pueden persistirse en SQLite y reconstruirse como modelos de dominio.

`InventoryScreen` consume actualmente los objetos de equipamiento directamente desde SQLite.

`EquipScreen` también resuelve los ejercicios asociados a los objetos equipados directamente desde SQLite.

Se eliminó la dependencia directa de `data/exercises.dart` en ambas pantallas, avanzando hacia una arquitectura en la que SQLite se convierte en la fuente de datos principal de los ejercicios.

Además, se incorporó `DatabaseAdmin` como capa de herramientas de desarrollo para inspeccionar y limpiar el contenido de la base de datos.

Durante este snapshot se eliminaron objetos antiguos o utilizados exclusivamente para testing, manteniendo `Carameloraro` como elemento de prueba.

Los seeders quedan exclusivamente como herramientas de desarrollo para poblar bases de datos de prueba.

**v0.5.1 — CLOSED ✓**
