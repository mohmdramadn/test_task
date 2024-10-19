
// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:async/async.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/network/network_service.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../data/repositories/login_repository.dart';
import '../entities/login_request_body.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final NetworkService networkService;

  LoginRepositoryImpl({required this.networkService});

  @override
  Future<Result> loginAsync({
    required String phoneNumber,
    required String password,
  }) async {
    final body = LoginRequestBody(phone: phoneNumber, password: password);

    var response = await networkService.postAsync(
        url: Constant.endPoints.loginUrl, body: body);

    if (response.isValue) {
      var data = json.decode(response.asValue!.value as String);
      return Result.value(data.result!);
    }

    var error = response.asError!.error as String;
    return Result.error(error);
  }
}
