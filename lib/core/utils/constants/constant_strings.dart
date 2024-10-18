import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Constant {
  static TranslationsConstants translationsConstants =  TranslationsConstants();
  static Fonts fonts =  const Fonts();
}

class Fonts{
  const Fonts();
  String get nexa => 'Nexa';
  String get nexaBold => 'NexaBold';
  String get nexaRegular => 'NexaRegular';
}

class TranslationsConstants {
  String get localeAR => 'ar';
  String get localeEN => 'en';
  String get localeDefault => localeEN;

  bool isEnglish(BuildContext context) =>
      (context.locale.languageCode == localeEN);

  bool isLTR(BuildContext context) =>
      (context.locale.languageCode == localeEN);

  static bool isContainsArabic(String text) {
    RegExp exp = RegExp(r"^[\u0621-\u064A]+");
    return exp.hasMatch(text);
  }
}