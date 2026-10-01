/// WGER exercise IDs mapped to VALQUIN exercise IDs.
///
/// VALQUIN remains the source of truth for exercise names, variants,
/// progression and training logic. These IDs are only used to retrieve
/// educational exercise information from WGER.
const Map<String, int> wgerExerciseIds = {
  // --------------------------------------------------
  // HEAD / CARDIO
  // --------------------------------------------------

  'caminata': 1104,
  'trote': 319,
  'sprint': 527,
  'ciclismo': 177,
  'bicicleta_estatica': 1618,
  'saltos_soga': 993,
  'jumping_jacks': 1314,
  'burpees': 132,

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  'flexiones_brazos': 1551,
  'flexiones_declinadas': 1112,
  'press_banca': 73,
  'press_declinado': 185,
  'press_declinado_mancuernas': 186,
  'aperturas_mancuernas': 238,

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  'press_militar': 418,
  'press_arnold': 20,
  'vuelo_lateral': 348,
  'vuelo_frontal': 256,
  'vuelo_posterior': 487,
  'encogimientos_hombros': 570,

  // --------------------------------------------------
  // WEAPON / BICEPS
  // --------------------------------------------------

  'curl_biceps': 92,
  'curl_alternado': 1567,
  'curl_concentrado': 202,
  'curl_predicador': 208,
  'curl_barra': 91,
  'curl_polea': 95,
  'curl_martillo': 272,

  // --------------------------------------------------
  // SHIELD / TRICEPS
  // --------------------------------------------------

  'fondos_banco': 197,
  'fondos_paralelas': 194,
  'triceps_polea': 659,
  'extension_triceps': 1668,
  'saque_tras_nuca': 1336,
  'press_frances': 246,

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  'sentadilla_libre': 615,
  'sentadilla_carga': 1801,
  'prensa_piernas': 371,
  'estocadas': 1324,
  'sentadilla_bulgara': 1706,
  'peso_muerto': 507,
  'hip_thrust': 294,
  'puente_gluteos': 265,
  'curl_femoral': 364,
  'silla_cuadriceps': 369,

  // --------------------------------------------------
  // BELT / CORE
  // --------------------------------------------------

  'plancha_frontal': 1307,
  'plancha_lateral': 580,
  'crunches': 167,
  'crunches_rotacion': 1912,
  'crunches_lateral': 576,
  'elevaciones_piernas': 377,
  'v_ups': 976,
  'escaladores': 996,

  // --------------------------------------------------
  // WINGS / BACK
  // --------------------------------------------------

  'polea_pecho': 355,
  'remo_sentado': 394,
  'remo_barra': 1698,
  'remo_mancuerna': 81,
  'dominadas': 475,
  'dominadas_asistidas': 1929,
  'pullover': 1137,
};

int? getWgerExerciseId(String exerciseId) {
  return wgerExerciseIds[exerciseId];
}