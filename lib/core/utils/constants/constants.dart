import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_task/core/styles/app_colors.dart';

import 'endpoints.dart';

class Constant {
  static TranslationsConstants translationsConstants =  TranslationsConstants();
  static Fonts fonts =  const Fonts();
  static AppColors appColors =  AppColors();
  static EndPoints endPoints =  const EndPoints();
}

class Fonts{
  const Fonts();
  String get madaniRegular => 'MadaniRegular';
  String get madaniExtraBold => 'MadaniExtraBold';
}

class TranslationsConstants {
  String get localeAR => 'ar';
  String get localeEN => 'en';
  String get localeDefault => localeAR;

  bool isEnglish(BuildContext context) =>
      (context.locale.languageCode == localeEN);

  bool isLTR(BuildContext context) =>
      (context.locale.languageCode == localeEN);

  static bool isContainsArabic(String text) {
    RegExp exp = RegExp(r"^[\u0621-\u064A]+");
    return exp.hasMatch(text);
  }
}