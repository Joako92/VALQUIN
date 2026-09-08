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

  // Equip Screen

  String get cooldown {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.cooldown;
      case AppLanguage.spanish:
        return SpanishStrings.cooldown;
    }
  }

  String get dailyExercises {
    switch (language) {
      case AppLanguage.english:
        return EnglishStrings.dailyExercises;
      case AppLanguage.spanish:
        return SpanishStrings.dailyExercises;
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

}