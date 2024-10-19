import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/features/login/presentation/cubit/login_state.dart';
import 'package:test_task/gen/assets.gen.dart';
import 'package:test_task/generated/locale_keys.g.dart';
import 'package:test_task/main.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_fields.dart';
import '../../../../core/router/routes_names.dart';
import '../../../../core/utils/base_state.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../../common/widgets/header.dart';
import '../../../../../common/widgets/sub_header.dart';
import '../../data/repositories/login_repository.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(loginRepository: getIt<LoginRepository>()),
      child: Builder(builder: (context) {
        return const _Body();
      }),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height - 50.h;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Constant.appColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: PopScope(
            canPop: true,
            child: SizedBox(
              height: height - 20.h,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                  const _Header(),
                  25.0.verticalSpace,
                  const _UserDetailsFields(),
                  16.0.h.verticalSpace,
                  const _LoginButton(),
                  10.0.h.verticalSpace,
                  Center(
                    child: Text(
                      LocaleKeys.orSignUpWithSocial.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Constant.appColors.textFieldHintColor),
                    ),
                  ),
                  10.0.h.verticalSpace,
                  const _SocialLogin(),
                  const Spacer(),
                  const Center(child: _Register()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: AppButton(
              onPressed: () {},
              borderColor: Colors.white,
              backgroundColor: Colors.transparent,
              child: Assets.images.svgs.appleLogo.svg(),
            ),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: AppButton(
              onPressed: () {},
              borderColor: Colors.white,
              backgroundColor: Colors.transparent,
              child: Assets.images.svgs.facebookLogo.svg(),
            ),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: AppButton(
              onPressed: () {},
              borderColor: Colors.white,
              backgroundColor: Colors.transparent,
              child: Assets.images.svgs.googleLogo.svg(),
            ),
          ),
        ),
      ],
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        LocaleKeys.forgotPassword.tr(),
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white),
      ),
    );
  }
}

class _Register extends StatelessWidget {
  const _Register();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: LocaleKeys.doYouHaveAcc.tr(),
                style:
                    theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
            TextSpan(
              text: LocaleKeys.doSignup.tr(),
              style: theme.textTheme.bodySmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: AppButton(
              onPressed: !state.isLoginButtonEnabled
                  ? null
                  : () => context.read<LoginCubit>().onLoginSelectedAsync(),
              borderRadius: BorderRadius.circular(12.r),
              child: state.state is LoadingResult
                  ? SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      LocaleKeys.login.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _UserDetailsFields extends StatelessWidget {
  const _UserDetailsFields();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return Form(
              key: state.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50.h,
                    child: Field(
                      controller: state.phoneController,
                      labelText: LocaleKeys.phoneNumber.tr(),
                      validator: (value) {
                        var validationState = context
                            .read<LoginCubit>()
                            .onValidatePhoneAction(value!);
                        if (validationState != "") return validationState;
                        return null;
                      },
                      inputType: TextInputType.number,
                    ),
                  ),
                  25.0.verticalSpace,
                  Field(
                    controller: state.passwordController,
                    labelText: LocaleKeys.password.tr(),
                    obscureText: state.isPasswordObscure,
                    suffixIcon: InkWell(
                        onTap: () => context
                            .read<LoginCubit>()
                            .onPasswordVisibilityChangeAction(),
                        child: state.isPasswordObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    onChange: (value) => context
                        .read<LoginCubit>()
                        .setLoginButtonState(
                            state.loginFormKey!.currentState!.validate()),
                    validator: (value) {
                      var validationState = context
                          .read<LoginCubit>()
                          .onValidatePasswordAction(value!);
                      if (validationState != "") return validationState;
                      return null;
                    },
                  ),
                  5.0.h.verticalSpace,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.forgetPasswordRoute),
                          child: const _ForgotPassword())),
                  5.0.h.verticalSpace,
                ],
              ),
            );
          }
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0.h, right: 8.0.w, left: 8.0.w),
      child: Center(
        child: Column(
          children: [
            Header(title: LocaleKeys.login.tr()),
            4.0.h.verticalSpace,
            SubHeader(title: LocaleKeys.login_title.tr()),
          ],
        ),
      ),
    );
  }
}
