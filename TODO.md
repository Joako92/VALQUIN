# TODO

Ideas, mejoras y funcionalidades pendientes para VALQUIN.

---

## 🖥️ UI / UX

### 📱 Orientación horizontal

**Idea:**
Permitir que VALQUIN pueda utilizarse también en orientación horizontal (landscape), además de la orientación vertical actual (portrait).

**Objetivo:**
Ofrecer una alternativa de visualización que aproveche mejor el espacio horizontal de dispositivos compatibles y permita explorar una posible distribución de interfaz más cercana a una experiencia RPG tradicional.

**Consideraciones:**

* Mantener portrait como orientación principal/default.
* Permitir cambiar entre portrait y landscape.
* Evaluar si el cambio debe ser:

  * Automático según la orientación del dispositivo.
  * Manual desde Settings.
  * Ambas opciones.
* Adaptar las pantallas existentes al nuevo aspect ratio.
* Revisar especialmente:

  * `Status`
  * `Inventory`
  * `Equipment`
  * `Player`
  * `Daily Mission`
  * `Training`
  * Diálogos y overlays.
* Revisar el layout del avatar/equipamiento en landscape.
* Evitar que listas, botones o textos queden comprimidos o excesivamente separados.
* Evaluar si landscape puede habilitar una distribución específica de dos columnas.
* Probar en diferentes tamaños y relaciones de aspecto.

**Posible dirección visual:**

```text
┌──────────────────────────────────────────────────────────────┐
│                         PLAYER                               │
├───────────────┬──────────────────────────────┬───────────────┤
│               │                              │               │
│   STATS       │           AVATAR             │   EQUIPMENT   │
│               │                              │               │
│   STR  25     │                              │   HEAD        │
│   END  18     │                              │   CHEST       │
│   ENE  12     │                              │   LEGS        │
│   STA  20     │                              │   WEAPON      │
│               │                              │               │
└───────────────┴──────────────────────────────┴───────────────┘
```

**Estado:** 💡 Idea

**Prioridad:** Baja

**Versión:** TBD

---

## 🎨 VISUAL / ASSETS

<!-- Ideas relacionadas con arte, sprites, equipamiento, efectos, etc. -->

---

## 🏋️ TRAINING

<!-- Ideas relacionadas con ejercicios, misiones, entrenamiento, estadísticas, etc. -->

---

## ⚔️ GAMEPLAY

<!-- Mecánicas RPG, progresión, recompensas, clases, combate, etc. -->

---

## ⚙️ TECHNICAL

<!-- Arquitectura, performance, refactors, persistencia, APIs, etc. -->

---

## 📚 CONTENT

<!-- Nuevos ejercicios, sets, accesorios, clases, lore, etc. -->

---

## 💭 IDEAS / EXPERIMENTAL

<!-- Ideas todavía muy verdes que no justifican una tarea concreta. -->
