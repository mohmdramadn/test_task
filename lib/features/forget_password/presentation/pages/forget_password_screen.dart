import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/common/widgets/app_button.dart';
import 'package:test_task/core/utils/constants/constants.dart';

import '../../../../common/widgets/app_fields.dart';
import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sub_header.dart';
import '../../../../core/router/routes_names.dart';
import '../../../../generated/locale_keys.g.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_outlined,
                        color: Colors.white),
                  ),
                  const _Header(),
                  25.0.verticalSpace,
                  const _UserDetailsFields(),
                  16.0.h.verticalSpace,
                  const _ResendButton(),
                  10.0.h.verticalSpace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.resendCodeAfter.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        5.horizontalSpace,
                        Text(
                          '(00:59)',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  const _ResendButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: AppButton(
          onPressed: () => Navigator.pushNamed(context,Routes.otpRoute,arguments: '01098084247'),
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
                  LocaleKeys.sendCode.tr(),
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
        ],
      ),
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
            Header(title: LocaleKeys.forgotPassword.tr()),
            4.0.h.verticalSpace,
            SubHeader(title: LocaleKeys.forget_password_title.tr()),
          ],
        ),
      ),
    );
  }
}
