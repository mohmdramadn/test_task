import 'dart:developer';

// ignore: implementation_imports, depend_on_referenced_packages
import 'package:async/src/result/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_task/common/data/interfaces/i_connection_service.dart';
import 'package:test_task/core/network/interceptors/connection_interceptor.dart';
import 'package:test_task/core/utils/helper/error_handler.dart';

@singleton
class NetworkService {
  final IConnectionService connectionService;
  late _NetworkClient _networkClient;

  NetworkService({required this.connectionService}) {
    _networkClient = _NetworkClient(connectionService: connectionService);
  }

  Future<Result<Response>> getAsync(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await _networkClient.getAsync(
          url: url, queryParameters: queryParameters);

      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('$error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> postAsync({
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _networkClient.postAsync(url: url, body: body, queryParameters: queryParameters);

      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('$stacktrace');
      return Result.error(error);
    }
  }
}

class _NetworkClient {
  final IConnectionService connectionService;
  late Dio _client;

  _NetworkClient({required this.connectionService}) {
    _client = Dio(
      BaseOptions(
        baseUrl: '',
        headers: {'accept': 'text/plain'},
        contentType: 'application/json',
        receiveTimeout: const Duration(milliseconds: 100000),
      ),
    );
    _client.interceptors.addAll([
      ConnectionInterceptor(connectionService),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    ]);
  }

  Future<Response> getAsync(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    return await _client.get<dynamic>(url, queryParameters: queryParameters);
  }

  Future<Response> postAsync(
      {required String url,
      dynamic body,
      Map<String, dynamic>? queryParameters}) async {
    return await _client.post<dynamic>(
      url,
      data: body,
      queryParameters: queryParameters,

    );
  }


}
