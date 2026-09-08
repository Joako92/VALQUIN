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

}