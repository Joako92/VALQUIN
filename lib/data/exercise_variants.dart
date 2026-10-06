import '../models/exercise_variant.dart';
import '../models/variant_family.dart';

// -----------------------------------------------------------------------------
// REPS
// -----------------------------------------------------------------------------

/// Basic strength and muscular endurance progression for beginners.
const VariantFamily basicRepsFamily = VariantFamily(
  id: 'basic_reps',
  name: 'Repeticiones básicas',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 10),
    ExerciseVariant(index: 1, sets: 3, amount: 12),
    ExerciseVariant(index: 2, sets: 3, amount: 15),
    ExerciseVariant(index: 3, sets: 4, amount: 15),
    ExerciseVariant(index: 4, sets: 4, amount: 20),
  ],
);

/// Maximum strength progression with low repetitions and high intensity.
const VariantFamily maxStrengthRepsFamily = VariantFamily(
  id: 'max_strength_reps',
  name: 'Fuerza máxima',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 5),
    ExerciseVariant(index: 1, sets: 3, amount: 3),
    ExerciseVariant(index: 2, sets: 4, amount: 3),
    ExerciseVariant(index: 3, sets: 4, amount: 2),
    ExerciseVariant(index: 4, sets: 5, amount: 1),
  ],
);

/// Explosive strength and power progression.
const VariantFamily powerRepsFamily = VariantFamily(
  id: 'power_reps',
  name: 'Potencia',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 5),
    ExerciseVariant(index: 1, sets: 4, amount: 5),
    ExerciseVariant(index: 2, sets: 5, amount: 4),
    ExerciseVariant(index: 3, sets: 5, amount: 3),
    ExerciseVariant(index: 4, sets: 6, amount: 2),
  ],
);

/// Hypertrophy-oriented progression with moderate volume.
const VariantFamily hypertrophyRepsFamily = VariantFamily(
  id: 'hypertrophy_reps',
  name: 'Hipertrofia',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 8),
    ExerciseVariant(index: 1, sets: 3, amount: 10),
    ExerciseVariant(index: 2, sets: 4, amount: 10),
    ExerciseVariant(index: 3, sets: 4, amount: 12),
    ExerciseVariant(index: 4, sets: 5, amount: 15),
  ],
);

/// High-volume muscular endurance progression.
const VariantFamily muscularEnduranceRepsFamily = VariantFamily(
  id: 'muscular_endurance_reps',
  name: 'Resistencia muscular',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 15),
    ExerciseVariant(index: 1, sets: 3, amount: 20),
    ExerciseVariant(index: 2, sets: 4, amount: 20),
    ExerciseVariant(index: 3, sets: 4, amount: 25),
    ExerciseVariant(index: 4, sets: 5, amount: 30),
  ],
);

/// Technical strength and body-control progression.
const VariantFamily technicalRepsFamily = VariantFamily(
  id: 'technical_reps',
  name: 'Fuerza técnica',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 5),
    ExerciseVariant(index: 1, sets: 3, amount: 8),
    ExerciseVariant(index: 2, sets: 4, amount: 8),
    ExerciseVariant(index: 3, sets: 4, amount: 10),
    ExerciseVariant(index: 4, sets: 5, amount: 10),
  ],
);

/// Balanced strength progression for all-around athletes.
const VariantFamily athleticStrengthFamily = VariantFamily(
  id: 'athletic_strength',
  name: 'Fuerza atlética',
  unit: 'reps',
  variants: [
    ExerciseVariant(index: 0, sets: 3, amount: 8),
    ExerciseVariant(index: 1, sets: 4, amount: 8),
    ExerciseVariant(index: 2, sets: 4, amount: 10),
    ExerciseVariant(index: 3, sets: 5, amount: 8),
    ExerciseVariant(index: 4, sets: 5, amount: 10),
  ],
);

// -----------------------------------------------------------------------------
// SECONDS
// -----------------------------------------------------------------------------

/// Short-duration maximum power progression.
const VariantFamily powerSecondsFamily = VariantFamily(
  id: 'power_seconds',
  name: 'Potencia explosiva',
  unit: 'sec',
  variants: [
    ExerciseVariant(index: 0, amount: 10),
    ExerciseVariant(index: 1, amount: 15),
    ExerciseVariant(index: 2, amount: 20),
    ExerciseVariant(index: 3, amount: 30),
    ExerciseVariant(index: 4, amount: 45),
  ],
);

/// Isometric strength and body-control progression.
const VariantFamily isometricSecondsFamily = VariantFamily(
  id: 'isometric_seconds',
  name: 'Isometría',
  unit: 'sec',
  variants: [
    ExerciseVariant(index: 0, amount: 15),
    ExerciseVariant(index: 1, amount: 20),
    ExerciseVariant(index: 2, amount: 30),
    ExerciseVariant(index: 3, amount: 45),
    ExerciseVariant(index: 4, amount: 60),
  ],
);

// -----------------------------------------------------------------------------
// MINUTES
// -----------------------------------------------------------------------------

/// Basic aerobic progression for beginners.
const VariantFamily basicMinutesFamily = VariantFamily(
  id: 'basic_minutes',
  name: 'Cardio básico',
  unit: 'min',
  variants: [
    ExerciseVariant(index: 0, amount: 10),
    ExerciseVariant(index: 1, amount: 15),
    ExerciseVariant(index: 2, amount: 20),
    ExerciseVariant(index: 3, amount: 30),
    ExerciseVariant(index: 4, amount: 45),
  ],
);

/// Cardio used as complementary conditioning.
const VariantFamily conditioningMinutesFamily = VariantFamily(
  id: 'conditioning_minutes',
  name: 'Acondicionamiento',
  unit: 'min',
  variants: [
    ExerciseVariant(index: 0, amount: 15),
    ExerciseVariant(index: 1, amount: 20),
    ExerciseVariant(index: 2, amount: 30),
    ExerciseVariant(index: 3, amount: 40),
    ExerciseVariant(index: 4, amount: 60),
  ],
);

/// Long-duration endurance progression for endurance athletes.
const VariantFamily enduranceMinutesFamily = VariantFamily(
  id: 'endurance_minutes',
  name: 'Resistencia aeróbica',
  unit: 'min',
  variants: [
    ExerciseVariant(index: 0, amount: 30),
    ExerciseVariant(index: 1, amount: 45),
    ExerciseVariant(index: 2, amount: 60),
    ExerciseVariant(index: 3, amount: 90),
    ExerciseVariant(index: 4, amount: 120),
  ],
);

// -----------------------------------------------------------------------------
// KILOMETERS
// -----------------------------------------------------------------------------

/// Basic distance progression for beginners.
const VariantFamily basicDistanceFamily = VariantFamily(
  id: 'basic_distance',
  name: 'Distancia básica',
  unit: 'km',
  variants: [
    ExerciseVariant(index: 0, amount: 1),
    ExerciseVariant(index: 1, amount: 2),
    ExerciseVariant(index: 2, amount: 3),
    ExerciseVariant(index: 3, amount: 5),
    ExerciseVariant(index: 4, amount: 10),
  ],
);

/// Long-distance running progression.
const VariantFamily longDistanceFamily = VariantFamily(
  id: 'long_distance',
  name: 'Fondo',
  unit: 'km',
  variants: [
    ExerciseVariant(index: 0, amount: 5),
    ExerciseVariant(index: 1, amount: 10),
    ExerciseVariant(index: 2, amount: 15),
    ExerciseVariant(index: 3, amount: 21),
    ExerciseVariant(index: 4, amount: 42),
  ],
);

// -----------------------------------------------------------------------------
// ALL VARIANT FAMILIES
// -----------------------------------------------------------------------------

/// All variant families available in the catalog.
const List<VariantFamily> variantFamilies = [
  // Reps
  basicRepsFamily,
  maxStrengthRepsFamily,
  powerRepsFamily,
  hypertrophyRepsFamily,
  muscularEnduranceRepsFamily,
  technicalRepsFamily,
  athleticStrengthFamily,

  // Seconds
  powerSecondsFamily,
  isometricSecondsFamily,

  // Minutes
  basicMinutesFamily,
  conditioningMinutesFamily,
  enduranceMinutesFamily,

  // Kilometers
  basicDistanceFamily,
  longDistanceFamily,
];
