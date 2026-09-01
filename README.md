# solo_training_001

# Product Vision

Solo Training es una aplicación móvil inspirada en **Solo Leveling** que transforma el progreso físico en una experiencia RPG mediante el registro rápido de entrenamientos y la evolución del personaje.

Inspirada en juegos RPG como **MU Online** y **Shining Force**, y en series como **Solo Leveling**, **Dragon Ball** y **Los Caballeros del Zodiaco**.

La misión es lograr la combinación perfecta entre **juego RPG y entrenamiento real y serio**.

La visión es hacerlo mediante una aplicación con una interfaz simple pero llamativa, orientada especialmente a quienes crecieron durante los años 90 con juegos de rol, series animadas y sistemas de progresión que enfatizaban la motivación, la disciplina, el entrenamiento y la superación personal.

---

# Stack

* Flutter
* Dart
* SQLite
* Drift
* Riverpod

---

# Versión

**v0.5.4 — Database-driven Exercises & Equipment**

---

# Cambios en esta versión

La versión **v0.5.4** consolida la migración del contenido de dominio hacia SQLite mediante Drift.

El objetivo principal de esta etapa fue completar la integración entre:

* `Exercise`
* `ExerciseVariant`
* `EquipmentItem`
* Stats
* Unlock Requirements
* Equip Requirements
* Clases
* Compatibilidad entre equipamiento y clases

La aplicación utiliza ahora SQLite como fuente principal de datos para ejercicios y equipamiento.

Las pantallas de inventario y equipamiento ya no dependen directamente de los archivos estáticos de `data/exercises.dart`.

Además, se consolidó el modelo de equipamiento como elemento central del sistema RPG: los objetos pueden contener múltiples ejercicios, limitar sus variantes disponibles, modificar estadísticas y definir qué clases pueden utilizarlos.

---

# Ejercicios desde SQLite

Los ejercicios utilizados por la aplicación se obtienen directamente desde la base de datos.

* Se eliminó la dependencia directa de `data/exercises.dart` en `InventoryScreen`.
* Se eliminó la dependencia directa de `data/exercises.dart` en `EquipScreen`.
* Los ejercicios asociados a un `EquipmentItem` se resuelven desde SQLite.
* Los datos son obtenidos mediante `AppDatabase`.
* Las variantes de los ejercicios se reconstruyen desde SQLite.
* `maxVariant` determina hasta qué variante de un ejercicio puede acceder un `EquipmentItem`.
* Un mismo `Exercise` puede pertenecer a múltiples `EquipmentItem`.
* Un `Exercise` puede tener múltiples variantes.
* Las variantes permanecen desacopladas del equipamiento.
* Los modelos de persistencia generados por Drift permanecen separados de los modelos de dominio.

Actualmente la base de datos contiene:

```text
EXERCISES: 26
```

---

# EquipmentItem

`EquipmentItem` representa una pieza de equipamiento del personaje.

Cada objeto puede definir:

* Nombre.
* Rareza.
* Slot.
* Ejercicios asociados.
* Variante máxima disponible por ejercicio.
* Stats.
* Requisitos de desbloqueo.
* Requisitos para equiparlo.
* Compatibilidad con clases.

La integración con SQLite se realiza mediante Drift.

## Persistencia

Tabla:

```text
EquipmentItems
```

Operaciones disponibles:

* `insertEquipmentItem()`
* `getEquipmentItem(id)`
* `updateEquipmentItem()`
* `deleteEquipmentItem()`

---

# Relación EquipmentItem ↔ Exercise

La relación entre equipamiento y ejercicios se almacena mediante:

```text
EquipmentItemExercises
```

Cada relación contiene:

```text
equipmentItemId
exerciseId
maxVariant
```

Esto permite que un objeto pueda contener varios ejercicios y que un mismo ejercicio sea utilizado por diferentes objetos.

Operaciones disponibles:

* `insertEquipmentItemExercise()`
* `getEquipmentItemExercise()`
* `getEquipmentItemExercises(equipmentItemId)`
* `updateEquipmentItemExercise()`
* `deleteEquipmentItemExercise()`

Se evita la creación de relaciones duplicadas.

---

# Variantes de ejercicios

Los ejercicios utilizan variantes independientes almacenadas en SQLite.

Estructura conceptual:

```text
Exercise
    │
    └── ExerciseVariantLinks
             │
             └── ExerciseVariant
```

Cada variante puede definir:

* Índice de variante.
* Sets.
* Cantidad.
* Unidad.

Ejemplos de unidades:

```text
reps
min
km
hs
```

La relación con `EquipmentItem` utiliza `maxVariant` para determinar el nivel máximo de variante disponible mediante dicho objeto.

---

# Stats

Los objetos de equipamiento pueden modificar los atributos del personaje.

Los stats se almacenan mediante:

```text
EquipmentItemStats
```

Cada registro contiene:

```text
equipmentItemId
stat
value
```

Los stats persistidos continúan reconstruyéndose como:

```dart
Map<String, int>
```

Operaciones disponibles:

* `insertEquipmentItemStat()`
* `getEquipmentItemStat()`
* `getEquipmentItemStatRows()`
* `getEquipmentItemStats()`
* `updateEquipmentItemStat()`
* `deleteEquipmentItemStat()`

---

# Clases y compatibilidad de equipamiento

Durante esta versión se consolida el sistema de compatibilidad entre equipamiento y clases.

El diseño actual evita hacer que cada ejercicio pertenezca obligatoriamente a una única clase.

Los ejercicios básicos pueden ser compartidos entre diferentes clases cuando tiene sentido dentro del sistema.

Por ejemplo, un ejercicio básico como una flexión puede ser utilizado por diferentes especializaciones aunque cada clase pueda darle una importancia diferente.

Esto permite que el equipamiento represente la especialización sin limitar artificialmente los ejercicios básicos.

## Compatibilidad

Los objetos pueden encontrarse en diferentes categorías:

### Items compartidos

Pueden ser utilizados por varias clases.

### Items parcialmente restringidos

Pueden excluir una o dos clases, pero permanecer disponibles para las demás.

### Items exclusivos

Pueden pertenecer exclusivamente a una clase determinada.

Esto permite construir progresivamente objetos cada vez más especializados sin obligar a que los ejercicios básicos sean duplicados para cada clase.

---

# Filosofía de especialización

El sistema actual está diseñado para una progresión gradual.

En las primeras etapas, los jugadores comparten una base de ejercicios relativamente común.

A medida que avance el desarrollo podrán incorporarse ejercicios mucho más específicos para determinadas especializaciones.

Por ejemplo:

```text
Novice
   │
   ├── ejercicios básicos compartidos
   │
   └── equipamiento general
          │
          ▼
Especialización
   │
   ├── ejercicios específicos
   ├── equipamiento especializado
   └── bonificaciones específicas
```

Esto permite que futuras clases puedan desarrollar identidades más marcadas, por ejemplo:

```text
Bodybuilder
Runner
Gymnast
```

sin necesidad de modificar el sistema básico de ejercicios.

---

# Unlock Requirements

Los requisitos para desbloquear objetos se almacenan mediante:

```text
EquipmentItemUnlockRequirements
```

Operaciones disponibles:

* `insertEquipmentItemUnlockRequirement()`
* `getEquipmentItemUnlockRequirement()`
* `getEquipmentItemUnlockRequirements()`
* `updateEquipmentItemUnlockRequirement()`
* `deleteEquipmentItemUnlockRequirement()`

Los requisitos pueden representar condiciones como:

```text
level
strength
endurance
energy
stamina
class
```

utilizando:

```text
condition + value
```

---

# Equip Requirements

Los requisitos necesarios para equipar un objeto se almacenan mediante:

```text
EquipmentItemEquipRequirements
```

Operaciones disponibles:

* `insertEquipmentItemEquipRequirement()`
* `getEquipmentItemEquipRequirement()`
* `getEquipmentItemEquipRequirements()`
* `updateEquipmentItemEquipRequirement()`
* `deleteEquipmentItemEquipRequirement()`

Esto permite diferenciar entre:

```text
Desbloquear un objeto
```

y:

```text
Cumplir las condiciones para equiparlo
```

---

# Reconstrucción del modelo de dominio

La aplicación reconstruye los objetos de equipamiento completos desde SQLite.

Métodos principales:

* `getEquipmentItemWithExercises()`
* `getEquipmentItemsWithExercises()`
* `getEquipmentItemWithAllData()`
* `getEquipmentItemsWithAllData()`

La reconstrucción incluye:

* `EquipmentItemRow`
* `EquipmentExercise`
* `Exercise`
* `ExerciseVariant`
* Stats
* Unlock Requirements
* Equip Requirements
* `Rarity`
* `EquipmentSlot`

La función interna:

```dart
_buildEquipmentRequirement()
```

permite reconstruir los requisitos persistidos como modelos de dominio.

Los modelos de dominio permanecen desacoplados de los Data Classes generados por Drift.

---

# Database Admin

Se incorporó una capa de herramientas administrativas para desarrollo y testing:

```text
database/
│
└── database_admin.dart
```

## Inspección de ejercicios

### `printExercises()`

Permite inspeccionar rápidamente todos los ejercicios almacenados en SQLite.

Ejemplo:

```text
EXERCISES IN DATABASE

TOTAL: 26

ID: caminata
NAME: CAMINATA

ID: flexiones_brazos
NAME: FLEXIONES
```

### `debugExerciseDatabase()`

Permite inspeccionar la estructura completa de cada ejercicio:

```text
Exercise
│
├── Variant links
│      └── ExerciseVariant
│
└── Equipment relations
```

Incluye:

* ID.
* Nombre.
* Cantidad de variantes.
* ID de variantes.
* Índice de variante.
* Sets.
* Amount.
* Unit.
* Relaciones con `EquipmentItem`.
* `maxVariant`.

---

# Inspección de equipamiento

### `debugEquipmentDatabase()`

Permite inspeccionar todos los objetos de equipamiento almacenados en SQLite.

Incluye:

* ID.
* Nombre.
* Cantidad de ejercicios asociados.
* ID de cada ejercicio.
* `maxVariant`.

Actualmente la base de datos contiene:

```text
EQUIPMENT ITEMS: 43
```

Esto permite verificar rápidamente el contenido real de SQLite durante el desarrollo.

---

# Eliminación administrativa

Se incorporaron operaciones administrativas para eliminar datos durante desarrollo y testing.

## Eliminación de ejercicios

`deleteExercise()` permite eliminar completamente un ejercicio mediante:

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

También se incorporó una operación equivalente para eliminar objetos de equipamiento.

Esto permite limpiar:

* Objetos antiguos.
* Objetos de testing.
* Datos obsoletos.

Durante este snapshot se eliminaron objetos antiguos utilizados durante las primeras etapas del desarrollo.

Se mantiene:

```text
Carameloraro
```

como elemento de prueba.

---

# Modelo de persistencia actual

La estructura relacionada con ejercicios y equipamiento queda organizada de la siguiente manera:

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

Este modelo permite:

* Un `EquipmentItem` con múltiples ejercicios.
* Un `Exercise` perteneciente a múltiples objetos.
* Un `maxVariant` diferente para cada relación.
* Múltiples variantes por ejercicio.
* Variantes desacopladas del equipamiento.
* Múltiples stats por objeto.
* Múltiples requisitos de desbloqueo.
* Múltiples requisitos de equipamiento.
* Compatibilidad entre equipamiento y clases.
* Reconstrucción completa de los datos como modelos de dominio.

---

# Flujo actual de datos

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

SQLite se establece como la fuente principal de datos persistidos.

Los archivos estáticos permanecen únicamente como fuentes auxiliares para seeders, desarrollo y testing.

---

# Estado actual del contenido

El contenido actualmente persistido en SQLite incluye:

```text
Exercises:       26
Equipment Items: 43
```

Los objetos de equipamiento incluyen:

* Items básicos.
* Items de distintas rarezas.
* Sets.
* Items con múltiples ejercicios.
* Items con variantes avanzadas.
* Items asociados a estadísticas.
* Items con restricciones.
* Items compartidos entre clases.
* Items restringidos a determinadas clases.

Las rarezas actuales son:

```text
Common
Rare
Legendary
Mythic
```

Estas cuatro rarezas constituyen el sistema actual de rareza.

Una eventual rareza adicional como `Secret` queda fuera del alcance de esta versión.

---

# Tests de esta versión

Se mantienen tests automatizados para validar:

* CRUD de `EquipmentItem`.
* CRUD de `EquipmentItemExercises`.
* CRUD de `EquipmentItemStats`.
* CRUD de `EquipmentItemUnlockRequirements`.
* CRUD de `EquipmentItemEquipRequirements`.
* Creación de relaciones `EquipmentItem ↔ Exercise`.
* Lectura individual de relaciones.
* Lectura múltiple de ejercicios asociados.
* Prevención de relaciones duplicadas.
* Actualización de `maxVariant`.
* Eliminación de relaciones.
* Lectura de múltiples stats.
* Actualización de stats.
* Eliminación de stats.
* Persistencia de requisitos de desbloqueo.
* Persistencia de requisitos de equipamiento.
* Reconstrucción de `EquipmentItem` desde SQLite.
* Reconstrucción de ejercicios asociados.
* Reconstrucción de variantes.
* Reconstrucción de stats.
* Reconstrucción de requisitos.
* Conversión de datos persistidos hacia modelos de dominio.
* Uso de `maxVariant`.
* Integridad de relaciones entre ejercicios y equipamiento.
* Seeders.
* Herramientas administrativas.

Resultado:

```text
+86: All tests passed!
```

---

# Casos de uso

| # | Caso                                                   | Resultado                                                        |
| - | ------------------------------------------------------ | ---------------------------------------------------------------- |
| 1 | Jugador alcanza nivel 5 siendo `Novice`                | Se habilita el cambio de clase                                   |
| 2 | `Novice` alcanza `100` en un stat                      | Se habilita la clase especializada correspondiente               |
| 3 | Cumple requisitos de varias clases especializadas      | Todas las clases correspondientes quedan disponibles para elegir |
| 4 | Jugador elige una clase especializada                  | La clase actual cambia de `Novice` a la clase seleccionada       |
| 5 | Jugador especializado alcanza `100` en todos los stats | Se habilita `Athlete`                                            |
| 6 | Jugador elige `Athlete`                                | La clase pasa a ser `Athlete` y no puede volver a cambiar        |
| 7 | Jugador cierra y vuelve a abrir la aplicación          | El progreso y la clase actual se mantienen                       |
| 8 | Jugador decide comenzar nuevamente                     | Puede resetear su progreso manteniendo sus objetos desbloqueados |

---

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
* Identificadores únicos.
* Inventario.
* Filtros por slot.
* Pantalla de equipamiento.
* Ejecución de entrenamientos.
* Ganancia de estadísticas.
* Reset del jugador.
* Interfaz RPG básica.
* Persistencia local.
* SQLite integrado.
* Drift integrado.
* Riverpod integrado.
* Capa de acceso a datos.
* Tabla de variantes de ejercicio.
* CRUD de `ExerciseVariant`.
* Tabla de ejercicios.
* CRUD de `Exercise`.
* Relaciones `ExerciseVariantLinks`.
* Relación entre ejercicios y variantes.
* Reconstrucción de ejercicios desde SQLite.
* Tabla de objetos de equipamiento.
* CRUD de `EquipmentItem`.
* Relaciones `EquipmentItemExercises`.
* Relación entre objetos de equipamiento y ejercicios.
* `maxVariant` por relación.
* Tabla de stats de equipamiento.
* Tabla de requisitos de desbloqueo.
* Tabla de requisitos de equipamiento.
* Reconstrucción completa de objetos desde SQLite.
* Conversión de datos de persistencia a modelos de dominio.
* `InventoryScreen` consumiendo `EquipmentItem` desde SQLite.
* `EquipScreen` consumiendo ejercicios desde SQLite.
* Eliminación de la dependencia directa de `data/exercises.dart`.
* CRUD validado mediante tests.
* Relaciones validadas mediante tests.
* Reconstrucción validada mediante tests.
* Seeders para desarrollo y testing.
* Herramientas administrativas de base de datos.
* Compatibilidad de equipamiento con clases.

---

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

---

# Correr debug en el teléfono

```bash
flutter run -d ZY22KXJ833
```

---

# Tests

Test de la base de datos:

```bash
flutter test test/database/app_database_test.dart
```

Tests de relaciones entre equipamiento y ejercicios:

```bash
flutter test test/database/equipment_item_exercises_test.dart
```

Tests de stats:

```bash
flutter test test/database/equipment_item_stats_test.dart
```

Tests de requisitos de desbloqueo:

```bash
flutter test test/database/equipment_item_unlock_requirements_test.dart
```

Tests de requisitos de equipamiento:

```bash
flutter test test/database/equipment_item_equip_requirements_test.dart
```

Tests del seeder:

```bash
flutter test test/database/exercise_seeder_test.dart
```

Todos los tests:

```bash
flutter test
```

---

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

**CLASS COMPATIBILITY ✓**

**FULL TEST SUITE — 86 TESTS PASSING ✓**

---

# Próxima versión

## v0.6 — UI & Visual Identity

Con la capa de persistencia y el modelo de dominio suficientemente consolidados, la próxima etapa se enfocará principalmente en la interfaz.

El objetivo de `v0.6` será transformar la interfaz RPG básica actual en una experiencia visual más cercana a la visión original del proyecto.

Las prioridades serán:

* Rediseño visual.
* Identidad gráfica.
* Pantalla principal.
* Status.
* Inventory.
* Equipment.
* Visualización de rarezas.
* Visualización de stats.
* Representación visual de los slots.
* Feedback visual de equipamiento.
* Feedback de entrenamiento.
* Animaciones.
* Jerarquía visual.
* Componentes reutilizables.
* Diseño orientado a una futura identidad propia de Solo Training.

La lógica de dominio y persistencia existente deberá mantenerse estable mientras se trabaja sobre la capa visual.

---

# Cierre de versión

La versión **v0.5.4** consolida la transición de Solo Training desde una aplicación con contenido principalmente estático hacia una arquitectura basada en datos persistidos mediante **SQLite + Drift**.

Los ejercicios, sus variantes y las relaciones con el equipamiento pueden almacenarse y reconstruirse desde la base de datos.

Los `EquipmentItem` pueden contener múltiples ejercicios, definir variantes máximas, modificar estadísticas y establecer requisitos de desbloqueo y equipamiento.

El sistema también permite representar diferentes niveles de compatibilidad entre objetos y clases, desde equipamiento compartido hasta objetos exclusivos de una especialización.

Los ejercicios básicos permanecen reutilizables entre clases, mientras que el sistema queda preparado para incorporar en el futuro ejercicios y equipamiento mucho más específicos para cada especialización.

`InventoryScreen` y `EquipScreen` consumen actualmente los datos reconstruidos desde SQLite, eliminando su dependencia directa de las fuentes estáticas.

La incorporación de `DatabaseAdmin` permite inspeccionar, depurar y limpiar el contenido persistido durante el desarrollo.

Los seeders permanecen como herramientas auxiliares para desarrollo y testing.

Con esta versión, la estructura fundamental del sistema RPG y su persistencia local quedan suficientemente establecidas para comenzar una nueva etapa centrada en la experiencia visual.

**v0.5.4 — CLOSED ✓**

**Next: v0.6 — UI & Visual Identity**
