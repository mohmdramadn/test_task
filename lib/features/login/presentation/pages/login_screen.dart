import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/gen/assets.gen.dart';
import 'package:test_task/generated/locale_keys.g.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_fields.dart';
import '../../../../core/utils/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Body();
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
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Constant.appColors.textFieldHintColor),
                    ),
                  ),
                  10.0.h.verticalSpace,
                  const _SocialLogin(),
                  Spacer(),
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
    return SizedBox(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: AppButton(
          onPressed: false ? null : () {},
          borderRadius: BorderRadius.circular(12.r),
          child: false
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
  }
}

class _UserDetailsFields extends StatelessWidget {
  const _UserDetailsFields();

  @override
  Widget build(BuildContext context) {
    // var emailController =
    //     context.select((LoginViewModel vm) => vm.emailController);
    // var passwordController =
    //     context.select((LoginViewModel vm) => vm.passwordController);

    // var formKey = context.select((LoginViewModel vm) => vm.formKey);

    return Form(
      // key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.h,
            child: Field(
              controller: TextEditingController(),
              labelText: LocaleKeys.phoneNumber.tr(),
              validator: (value) {
                // var validationState =
                //     context.read<LoginViewModel>().validateEmail(value!);
                // if (validationState != "") return validationState;
                // return null;
              },
              inputType: TextInputType.number,
            ),
          ),
          25.0.verticalSpace,
          Field(
            controller: TextEditingController(),
            labelText: LocaleKeys.password.tr(),
            obscureText: true,
            validator: (value) {
              // var validationState =
              //     context.read<LoginViewModel>().validatePassword(value!);
              // if (validationState != "") return validationState;
              // return null;
            },
          ),
          5.0.h.verticalSpace,
          const Align(
              alignment: Alignment.centerLeft, child: _ForgotPassword()),
          5.0.h.verticalSpace,
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: 30.0.h, right: 8.0.w, left: 8.0.w),
      child: Center(
        child: Column(
          children: [
            Assets.images.svgs.logoH.svg(),
            15.verticalSpace,
            Text(
              LocaleKeys.login.tr(),
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: Colors.white, fontSize: 16.spMin),
            ),
            4.0.h.verticalSpace,
            const _SubHeader(),
          ],
        ),
      ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 8.0.w),
      child: Text(
        LocaleKeys.login_title.tr(),
        style: theme.textTheme.headlineSmall!.copyWith(
          color: Constant.appColors.greyHint,
          fontSize: 12.spMin,
        ),
      ),
    );
  }
}
