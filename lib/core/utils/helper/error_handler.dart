import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/generated/locale_keys.g.dart';


@singleton
class ErrorHandler {
  static String handleErrorMessage(DioException error) {
    if (error.response != null &&
        error.response!.statusCode == HttpStatus.unauthorized) {
      return LocaleKeys.sessionExpired.tr();
    } else if (error.response != null &&
        error.response!.statusCode == HttpStatus.internalServerError) {
      if (kDebugMode) print(error.response.toString());
      return LocaleKeys.somethingWentWrong.tr();
    } else if (error.response != null &&
        (error.response?.statusCode == HttpStatus.ok ||
            error.response?.statusCode == HttpStatus.badRequest)) {
      String errorMsg = error.response?.data['title'].toString() ??
          error.response?.data['message'].toString() ??
          "";
      return errorMsg;
    } else if (error.response != null &&
        error.response?.statusCode != HttpStatus.notFound) {
      String errorMsg = error.response?.data.toString() ?? "";
      return errorMsg;
    } else if (error.response?.statusCode == HttpStatus.serviceUnavailable) {
      return 'You\'re offline';
    }
    return LocaleKeys.somethingWentWrong.tr();
  }
}
