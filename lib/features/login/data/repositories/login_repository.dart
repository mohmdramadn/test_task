// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

abstract class LoginRepository{
  Future<Result> loginAsync({
    required String phoneNumber,
    required String password,
  });
}