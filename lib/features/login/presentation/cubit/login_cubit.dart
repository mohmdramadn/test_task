import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/utils/extensions/result_extension.dart';
import 'package:test_task/features/login/data/repositories/login_repository.dart';
import 'package:test_task/generated/locale_keys.g.dart';
import '../../../../core/services/message_service.dart';
import '../../../../core/utils/base_state.dart';
import '../../../../core/utils/validator.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginRepository})
      : super(
          LoginStates(
            phoneController: TextEditingController(),
            passwordController: TextEditingController(),
            loginFormKey: GlobalKey<FormState>()
          ),
        );

  final LoginRepository loginRepository;

  Future<void> onLoginSelectedAsync() async {
    emit(state.copyWith(state: const LoadingResult()));

    final result = await loginRepository.loginAsync(
      phoneNumber: state.phoneController.text,
      password: state.passwordController.text,
    );

    result.fold(
      (error) {
        emit(state.copyWith(state: ErrorResult(error)));
        MessageService.showToast(
          msg: LocaleKeys.somethingWentWrong.tr(),
          state: ToastStates.ERROR,
        );
      },
      (success) async {
        emit(state.copyWith(state: const SuccessResult()));
        MessageService.showToast(
          msg: 'Success',
          state: ToastStates.SUCCESS,
        );
      },
    );
  }

  void setLoginButtonState(value) {
    emit(state.copyWith(isLoginButtonEnabled: value));
  }

  void onPasswordVisibilityChangeAction() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  String? onValidatePhoneAction(String phoneNumber) {
    var validationResult = Validator.isValidPhone(phoneNumber);
    return validationResult;
  }

  String? onValidatePasswordAction(String password) {
    var validationResult = Validator.isValidPassword(password);
    return validationResult;
  }

  @override
  Future<void> close() async {
    state.phoneController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
