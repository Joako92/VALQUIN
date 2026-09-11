import '../models/exercise.dart';
import 'exercise_variants.dart';

const List<Exercise> exercises = [
  // --------------------------------------------------
  // HEAD / CARDIO
  // --------------------------------------------------

  Exercise(
    id: 'caminata',
    name: 'CAMINATA',
    variants: runningVariants,
  ),

  Exercise(
    id: 'trote',
    name: 'TROTE',
    variants: runningVariants,
  ),

  Exercise(
    id: 'sprint',
    name: 'SPRINT',
    variants: sprintVariants,
  ),

  Exercise(
    id: 'ciclismo',
    name: 'CICLISMO',
    variants: bikeVariants,
  ),

  Exercise(
    id: 'bicicleta_estatica',
    name: 'BICICLETA ESTÁTICA',
    variants: bikeVariants,
  ),

  Exercise(
    id: 'saltos_soga',
    name: 'SALTOS CON SOGA',
    variants: cardioVariants,
  ),

  Exercise(
    id: 'jumping_jacks',
    name: 'JUMPING JACKS',
    variants: cardioVariants,
  ),

  Exercise(
    id: 'burpees',
    name: 'BURPEES',
    variants: cardioVariants,
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  Exercise(
    id: 'flexiones_brazos',
    name: 'FLEXIONES',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'flexiones_declinadas',
    name: 'FLEXIONES DECLINADAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'press_banca',
    name: 'PRESS BANCA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'press_declinado',
    name: 'PRESS DECLINADO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'press_declinado_mancuernas',
    name: 'PRESS DECLINADO CON MANCUERNAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'aperturas_mancuernas',
    name: 'APERTURAS CON MANCUERNAS',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  Exercise(
    id: 'press_militar',
    name: 'PRESS MILITAR',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'press_arnold',
    name: 'PRESS ARNOLD',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'vuelo_lateral',
    name: 'VUELO LATERAL',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'vuelo_frontal',
    name: 'VUELO FRONTAL',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'vuelo_posterior',
    name: 'VUELO POSTERIOR',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'encogimientos_hombros',
    name: 'ENCOGIMIENTOS DE HOMBROS',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // WEAPON / BICEPS
  // --------------------------------------------------

  Exercise(
    id: 'curl_biceps',
    name: 'CURL DE BÍCEPS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_alternado',
    name: 'CURL ALTERNADO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_concentrado',
    name: 'CURL CONCENTRADO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_predicador',
    name: 'CURL PREDICADOR',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_barra',
    name: 'CURL CON BARRA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_polea',
    name: 'CURL EN POLEA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_martillo',
    name: 'CURL MARTILLO',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // SHIELD / TRICEPS
  // --------------------------------------------------

  Exercise(
    id: 'fondos_banco',
    name: 'FONDOS EN BANCO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'fondos_paralelas',
    name: 'FONDOS EN PARALELAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'triceps_polea',
    name: 'TRÍCEPS EN POLEA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'extension_triceps',
    name: 'EXTENSIÓN DE TRÍCEPS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'saque_tras_nuca',
    name: 'SAQUE TRAS LA NUCA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'press_frances',
    name: 'PRESS FRANCÉS',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  Exercise(
    id: 'sentadilla_libre',
    name: 'SENTADILLA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'sentadilla_carga',
    name: 'SENTADILLA + CARGA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'prensa_piernas',
    name: 'PRENSA DE PIERNAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'estocadas',
    name: 'ESTOCADAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'sentadilla_bulgara',
    name: 'SENTADILLA BULGARA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'peso_muerto',
    name: 'PESO MUERTO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'hip_thrust',
    name: 'HIP THRUST',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'puente_gluteos',
    name: 'PUENTE DE GLÚTEOS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'curl_femoral',
    name: 'CURL FEMORAL',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'silla_cuadriceps',
    name: 'SILLA DE CUÁDRICEPS',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // BELT / CORE
  // --------------------------------------------------

  Exercise(
    id: 'plancha_frontal',
    name: 'PLANCHA',
    variants: timedVariants,
  ),

  Exercise(
    id: 'plancha_lateral',
    name: 'PLANCHA LATERAL',
    variants: timedVariants,
  ),

  Exercise(
    id: 'crunches',
    name: 'CRUNCHES',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'crunches_rotacion',
    name: 'CRUNCHES DE ROTACIÓN',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'crunches_lateral',
    name: 'CRUNCHES LATERALES',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'elevaciones_piernas',
    name: 'ELEVACIONES DE PIERNAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'v_ups',
    name: 'V-UPS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'escaladores',
    name: 'ESCALADORES',
    variants: standardStrengthVariants,
  ),

  // --------------------------------------------------
  // WINGS / BACK
  // --------------------------------------------------

  Exercise(
    id: 'polea_pecho',
    name: 'POLEA AL PECHO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'remo_sentado',
    name: 'REMO SENTADO',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'remo_barra',
    name: 'REMO CON BARRA',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'remo_mancuerna',
    name: 'REMO CON MANCUERNAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'dominadas',
    name: 'DOMINADAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'dominadas_asistidas',
    name: 'DOMINADAS ASISTIDAS',
    variants: standardStrengthVariants,
  ),

  Exercise(
    id: 'pullover',
    name: 'PULLOVER',
    variants: standardStrengthVariants,
  ),
];
