import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/common/data/interfaces/i_connection_service.dart';

import '../../../generated/locale_keys.g.dart';

class ConnectionInterceptor extends Interceptor {
  final IConnectionService connectionService;

  ConnectionInterceptor(this.connectionService);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await connectionService.checkConnection();
    log(connectivityResult.toString());
    if (connectivityResult == false) {
      final error = DioException(
        requestOptions: options,
        response: Response(
          requestOptions: options,
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: 'You\'re offline',
        ),
      );
      return handler.reject(error);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 503) {
      Fluttertoast.showToast(
        msg: err.response?.statusMessage ?? LocaleKeys.somethingWentWrong.tr(),
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return super.onError(err, handler);
  }
}
