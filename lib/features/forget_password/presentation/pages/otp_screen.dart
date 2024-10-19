import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sub_header.dart';
import '../../../../core/router/routes_names.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/otp_code.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.phoneSentTo,
  });

  final String phoneSentTo;

  @override
  Widget build(BuildContext context) {
    return _Body(phoneSentTo: phoneSentTo);
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.phoneSentTo,
  }) : super(key: key);

  final String phoneSentTo;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Constant.appColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              50.verticalSpace,
              _Header(phoneNumber: phoneSentTo),
              const OtpCode(),
              const _ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: AppButton(
          onPressed: () => Navigator.pushNamed(
            context,
            Routes.resetPasswordRoute,
          ),
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
                  LocaleKeys.confirm.tr(),
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

class _Header extends StatelessWidget {
  const _Header({required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0.h, right: 8.0.w, left: 8.0.w),
      child: Center(
        child: Column(
          children: [
            Header(title: LocaleKeys.resetPassword.tr()),
            4.0.h.verticalSpace,
            SubHeader(title: '${LocaleKeys.enterCodeSentTo.tr()} $phoneNumber'),
          ],
        ),
      ),
    );
  }
}
