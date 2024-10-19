import 'package:flutter/cupertino.dart';

import '../../../../core/utils/base_state.dart';

class LoginStates {
  final BaseState state;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final bool isPasswordObscure;
  final bool isLoginButtonEnabled;
  final GlobalKey<FormState>? loginFormKey;

  LoginStates({
    this.state = const InitResult(),
    required this.phoneController,
    required this.passwordController,
    this.isPasswordObscure = true,
    this.isLoginButtonEnabled = false,
    this.loginFormKey,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginStates &&
        other.state == state &&
        other.phoneController == phoneController &&
        other.isPasswordObscure == isPasswordObscure &&
        other.isLoginButtonEnabled == isLoginButtonEnabled &&
        other.loginFormKey == loginFormKey &&
        other.passwordController == passwordController;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        isLoginButtonEnabled.hashCode ^
        isPasswordObscure.hashCode ^
        loginFormKey.hashCode ^
        phoneController.hashCode ^
        passwordController.hashCode;
  }

  LoginStates copyWith({
    BaseState? state,
    bool? isLoginButtonEnabled,
    bool? isPasswordObscure,
    GlobalKey<FormState>? loginFormKey,
    TextEditingController? phoneController,
    TextEditingController? passwordController,
  }) {
    return LoginStates(
      state: state ?? this.state,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      loginFormKey: loginFormKey ?? this.loginFormKey,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      phoneController: phoneController ?? this.phoneController,
      passwordController: passwordController ?? this.passwordController,
    );
  }

  @override
  String toString() =>
      'RecommendStates(\nstate: $state , \nisButtonEnabled: $isLoginButtonEnabled \nisPasswordObscure: $isPasswordObscure\n)';
}
