import 'package:valquin/localization/english_strings.dart';
import 'package:valquin/localization/spanish_strings.dart';

enum AppLanguage {
  english,
  spanish,
}

class LanguageStrings {
  final AppLanguage language;

  LanguageStrings(this.language);

  String get playerNamePlaceholder {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.playerNamePlaceholder;
      case AppLanguage.spanish:
        return SpanishStrings.playerNamePlaceholder;
    }
  }

  String get gotIt {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.gotIt;
      case AppLanguage.spanish:
        return SpanishStrings.gotIt;
    }
  }

  // Theme

  String get theme {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.theme;
      case AppLanguage.spanish:
        return SpanishStrings.theme;
    }
  }

  String get dark {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.dark;
      case AppLanguage.spanish:
        return SpanishStrings.dark;
    }
  }

  String get light {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.light;
      case AppLanguage.spanish:
        return SpanishStrings.light;
    }
  }

  // Stats

  String get attributeStrength {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.attributeStrength;
      case AppLanguage.spanish:
        return SpanishStrings.attributeStrength;
    }
  }

  String get attributeEndurance {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.attributeEndurance;
      case AppLanguage.spanish:
        return SpanishStrings.attributeEndurance;
    }
  }

  String get attributeEnergy {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.attributeEnergy;
      case AppLanguage.spanish:
        return SpanishStrings.attributeEnergy;
    }
  }

  String get attributeStamina {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.attributeStamina;
      case AppLanguage.spanish:
        return SpanishStrings.attributeStamina;
    }
  }

  String get playerNotLoaded {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.playerNotLoaded;
      case AppLanguage.spanish:
        return SpanishStrings.playerNotLoaded;
    }
  }

  String get resetPlayer {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.resetPlayer;
      case AppLanguage.spanish:
        return SpanishStrings.resetPlayer;
    }
  }

  String get level {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.level;
      case AppLanguage.spanish:
        return SpanishStrings.level;
    }
  }

  String get settings {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.settings;
      case AppLanguage.spanish:
        return SpanishStrings.settings;
    }
  }

  String get languageString {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.languageString;
      case AppLanguage.spanish:
        return SpanishStrings.languageString;
    }
  }

  String get english {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.english;
      case AppLanguage.spanish:
        return SpanishStrings.english;
    }
  }

  String get spanish {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.spanish;
      case AppLanguage.spanish:
        return SpanishStrings.spanish;
    }
  }

  // Player Screen

  String get statusInfoTitle {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.statusInfoTitle;
      case AppLanguage.spanish:
        return SpanishStrings.statusInfoTitle;
    }
  }

  String get statusInfoMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.statusInfoMessage;
      case AppLanguage.spanish:
        return SpanishStrings.statusInfoMessage;
    }
  }

  String get newClassAvailable {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.newClassAvailable;
      case AppLanguage.spanish:
        return SpanishStrings.newClassAvailable;
    }
  }

  String get classChangeAvailable {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeAvailable;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeAvailable;
    }
  }

  String get trainingUnlockedMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.trainingUnlockedMessage;
      case AppLanguage.spanish:
        return SpanishStrings.trainingUnlockedMessage;
    }
  }

  String get later {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.later;
      case AppLanguage.spanish:
        return SpanishStrings.later;
    }
  }

  String get accentColor {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.accentColor;
      case AppLanguage.spanish:
        return SpanishStrings.accentColor;
    }
  }

  String get close {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.close;
      case AppLanguage.spanish:
        return SpanishStrings.close;
    }
  }

  String get resetPlayerConfirmation {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.resetPlayerConfirmation;
      case AppLanguage.spanish:
        return SpanishStrings.resetPlayerConfirmation;
    }
  }

  String get cancel {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.cancel;
      case AppLanguage.spanish:
        return SpanishStrings.cancel;
    }
  }

  String get reset {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.reset;
      case AppLanguage.spanish:
        return SpanishStrings.reset;
    }
  }

  String get playerResetMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.playerResetMessage;
      case AppLanguage.spanish:
        return SpanishStrings.playerResetMessage;
    }
  }

  // Training History

  String get trainingHistory {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.trainingHistory;
      case AppLanguage.spanish:
        return SpanishStrings.trainingHistory;
    }
  }

  String get noTrainingHistory {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.noTrainingHistory;
      case AppLanguage.spanish:
        return SpanishStrings.noTrainingHistory;
    }
  }

  String get january {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.january;
      case AppLanguage.spanish:
        return SpanishStrings.january;
    }
  }

  String get february {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.february;
      case AppLanguage.spanish:
        return SpanishStrings.february;
    }
  }

  String get march {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.march;
      case AppLanguage.spanish:
        return SpanishStrings.march;
    }
  }

  String get april {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.april;
      case AppLanguage.spanish:
        return SpanishStrings.april;
    }
  }

  String get may {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.may;
      case AppLanguage.spanish:
        return SpanishStrings.may;
    }
  }

  String get june {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.june;
      case AppLanguage.spanish:
        return SpanishStrings.june;
    }
  }

  String get july {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.july;
      case AppLanguage.spanish:
        return SpanishStrings.july;
    }
  }

  String get august {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.august;
      case AppLanguage.spanish:
        return SpanishStrings.august;
    }
  }

  String get september {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.september;
      case AppLanguage.spanish:
        return SpanishStrings.september;
    }
  }

  String get october {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.october;
      case AppLanguage.spanish:
        return SpanishStrings.october;
    }
  }

  String get november {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.november;
      case AppLanguage.spanish:
        return SpanishStrings.november;
    }
  }

  String get december {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.december;
      case AppLanguage.spanish:
        return SpanishStrings.december;
    }
  }

  // Status dialog

  String get inventoryInfoTitle {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.inventoryInfoTitle;
      case AppLanguage.spanish:
        return SpanishStrings.inventoryInfoTitle;
    }
  }

  String get inventoryInfoMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.inventoryInfoMessage;
      case AppLanguage.spanish:
        return SpanishStrings.inventoryInfoMessage;
    }
  }

  // Class

  String get classNovice {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classNovice;

      case AppLanguage.spanish:
        return SpanishStrings.classNovice;
    }
  }

  String get classPowerLifter {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classPowerLifter;

      case AppLanguage.spanish:
        return SpanishStrings.classPowerLifter;
    }
  }

  String get classRunner {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classRunner;

      case AppLanguage.spanish:
        return SpanishStrings.classRunner;
    }
  }

  String get classBodybuilder {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classBodybuilder;

      case AppLanguage.spanish:
        return SpanishStrings.classBodybuilder;
    }
  }

  String get classGymnast {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classGymnast;

      case AppLanguage.spanish:
        return SpanishStrings.classGymnast;
    }
  }

  String get classAthlete {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classAthlete;

      case AppLanguage.spanish:
        return SpanishStrings.classAthlete;
    }
  }

  // Inventory Screen

  String get all {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.all;
      case AppLanguage.spanish:
        return SpanishStrings.all;
    }
  }

  String get equipped {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equipped;
      case AppLanguage.spanish:
        return SpanishStrings.equipped;
    }
  }

  String get shoulders {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.shoulders;
      case AppLanguage.spanish:
        return SpanishStrings.shoulders;
    }
  }

  String get head {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.head;
      case AppLanguage.spanish:
        return SpanishStrings.head;
    }
  }

  String get wings {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.wings;
      case AppLanguage.spanish:
        return SpanishStrings.wings;
    }
  }

  String get weapon {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.weapon;
      case AppLanguage.spanish:
        return SpanishStrings.weapon;
    }
  }

  String get chest {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.chest;
      case AppLanguage.spanish:
        return SpanishStrings.chest;
    }
  }

  String get shield {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.shield;
      case AppLanguage.spanish:
        return SpanishStrings.shield;
    }
  }

  String get accessory {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.accessory;
      case AppLanguage.spanish:
        return SpanishStrings.accessory;
    }
  }

  String get legs {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.legs;
      case AppLanguage.spanish:
        return SpanishStrings.legs;
    }
  }

  String get belt {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.belt;
      case AppLanguage.spanish:
        return SpanishStrings.belt;
    }
  }

  String get exercises {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.exercises;
      case AppLanguage.spanish:
        return SpanishStrings.exercises;
    }
  }

  String get requirements {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.requirements;
      case AppLanguage.spanish:
        return SpanishStrings.requirements;
    }
  }

  String get equip {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equip;
      case AppLanguage.spanish:
        return SpanishStrings.equip;
    }
  }

  String get unequip {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.unequip;
      case AppLanguage.spanish:
        return SpanishStrings.unequip;
    }
  }

  String get none {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.none;
      case AppLanguage.spanish:
        return SpanishStrings.none;
    }
  }

  String get unknownExercise {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.unknownExercise;
      case AppLanguage.spanish:
        return SpanishStrings.unknownExercise;
    }
  }

  String get isOnCooldown {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.isOnCooldown;
      case AppLanguage.spanish:
        return SpanishStrings.isOnCooldown;
    }
  }

  String get unequipped {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.unequipped;
      case AppLanguage.spanish:
        return SpanishStrings.unequipped;
    }
  }

  String get equippedMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equippedMessage;
      case AppLanguage.spanish:
        return SpanishStrings.equippedMessage;
    }
  }

  String get replaced {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.replaced;
      case AppLanguage.spanish:
        return SpanishStrings.replaced;
    }
  }

  String get unlockRequirementsNotMet {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.unlockRequirementsNotMet;
      case AppLanguage.spanish:
        return SpanishStrings.unlockRequirementsNotMet;
    }
  }

  String get equipRequirementsNotMet {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equipRequirementsNotMet;
      case AppLanguage.spanish:
        return SpanishStrings.equipRequirementsNotMet;
    }
  }

  String get noItems {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.noItems;
      case AppLanguage.spanish:
        return SpanishStrings.noItems;
    }
  }

  // Inventory Exercise Guide

  String get exerciseGuide {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.exerciseGuide;
      case AppLanguage.spanish:
        return SpanishStrings.exerciseGuide;
    }
  }

  String get exerciseGuideUnavailable {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.exerciseGuideUnavailable;
      case AppLanguage.spanish:
        return SpanishStrings.exerciseGuideUnavailable;
    }
  }

  String get exerciseGuideLoading {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.exerciseGuideLoading;
      case AppLanguage.spanish:
        return SpanishStrings.exerciseGuideLoading;
    }
  }

  // Welcome Screen

  String get welcomeDisclaimer {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.welcomeDisclaimer;
      case AppLanguage.spanish:
        return SpanishStrings.welcomeDisclaimer;
    }
  }

  String get startTraining {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.startTraining;
      case AppLanguage.spanish:
        return SpanishStrings.startTraining;
    }
  }

  // Create Player Screen

  String get createYourCharacter {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.createYourCharacter;
      case AppLanguage.spanish:
        return SpanishStrings.createYourCharacter;
    }
  }

  String get beginTrainingJourney {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.beginTrainingJourney;
      case AppLanguage.spanish:
        return SpanishStrings.beginTrainingJourney;
    }
  }

  String get playerName {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.playerName;
      case AppLanguage.spanish:
        return SpanishStrings.playerName;
    }
  }

  String get enterYourName {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.enterYourName;
      case AppLanguage.spanish:
        return SpanishStrings.enterYourName;
    }
  }

  String get creating {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.creating;
      case AppLanguage.spanish:
        return SpanishStrings.creating;
    }
  }

  String get createPlayer {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.createPlayer;
      case AppLanguage.spanish:
        return SpanishStrings.createPlayer;
    }
  }

  String get selectAvatar {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.selectAvatar;
      case AppLanguage.spanish:
        return SpanishStrings.selectAvatar;
    }
  }

  // Muscle Groups

  String get muscleGroupShoulders {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupShoulders;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupShoulders;
    }
  }

  String get muscleGroupCardio {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupCardio;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupCardio;
    }
  }

  String get muscleGroupBack {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupBack;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupBack;
    }
  }

  String get muscleGroupBiceps {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupBiceps;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupBiceps;
    }
  }

  String get muscleGroupChest {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupChest;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupChest;
    }
  }

  String get muscleGroupTriceps {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupTriceps;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupTriceps;
    }
  }

  String get muscleGroupLegs {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupLegs;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupLegs;
    }
  }

  String get muscleGroupCore {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.muscleGroupCore;
      case AppLanguage.spanish:
        return SpanishStrings.muscleGroupCore;
    }
  }

  // Equip Screen

  String get cooldown {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.cooldown;
      case AppLanguage.spanish:
        return SpanishStrings.cooldown;
    }
  }

  String get dailyMission {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.dailyMission;
      case AppLanguage.spanish:
        return SpanishStrings.dailyMission;
    }
  }

  String get noTrainingSelected {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.noTrainingSelected;
      case AppLanguage.spanish:
        return SpanishStrings.noTrainingSelected;
    }
  }

  String get trainingExecuted {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.trainingExecuted;
      case AppLanguage.spanish:
        return SpanishStrings.trainingExecuted;
    }
  }

  String get levelUpTitle {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.levelUpTitle;
      case AppLanguage.spanish:
        return SpanishStrings.levelUpTitle;
    }
  }

  String get levelUpMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.levelUpMessage;
      case AppLanguage.spanish:
        return SpanishStrings.levelUpMessage;
    }
  }

  String get execute {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.execute;
      case AppLanguage.spanish:
        return SpanishStrings.execute;
    }
  }

  // Equip Screen Info

  String get equipInfoTitle {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equipInfoTitle;
      case AppLanguage.spanish:
        return SpanishStrings.equipInfoTitle;
    }
  }

  String get equipInfoMessage {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.equipInfoMessage;
      case AppLanguage.spanish:
        return SpanishStrings.equipInfoMessage;
    }
  }

  // Class Change Info

  String get classChangeAcceptedTitle {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeAcceptedTitle;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeAcceptedTitle;
    }
  }

  String get classChangePowerLifter {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangePowerLifter;
      case AppLanguage.spanish:
        return SpanishStrings.classChangePowerLifter;
    }
  }

  String get classChangeRunner {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeRunner;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeRunner;
    }
  }

  String get classChangeBodybuilder {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeBodybuilder;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeBodybuilder;
    }
  }

  String get classChangeGymnast {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeGymnast;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeGymnast;
    }
  }

  String get classChangeAthlete {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeAthlete;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeAthlete;
    }
  }

  String get classChangeNovice {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.classChangeNovice;
      case AppLanguage.spanish:
        return SpanishStrings.classChangeNovice;
    }
  }

}