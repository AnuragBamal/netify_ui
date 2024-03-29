enum LanguageType { english, hindi }

const String english = "en";
const String hindi = "hi";

extension LanguageTypeExtension on LanguageType {
  String get languageCode {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.hindi:
        return hindi;
    }
  }
}
