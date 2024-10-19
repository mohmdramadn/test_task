import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/common/widgets/app_button.dart';
import 'package:test_task/gen/assets.gen.dart';

import '../../../../core/router/routes_names.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Assets.images.pngs.blackBg.image(
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: Assets.images.pngs.onboardingBg.image(
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _LangButton(theme: theme),
                  const Spacer(),
                  Text(
                    LocaleKeys.onboarding_tittle.tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: Constant.fonts.madaniExtraBold),
                    textAlign: TextAlign.center,
                  ),
                  40.verticalSpace,
                  SizedBox(
                    height: 48.spMin,
                    width: width,
                    child: AppButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.loginRoute),
                      borderRadius: BorderRadius.circular(12.r),
                      child: Text(
                        LocaleKeys.login.tr(),
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  SizedBox(
                    height: 48.spMin,
                    width: width,
                    child: AppButton(
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(12.r),
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      child: Text(
                        LocaleKeys.discover_first.tr(),
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  const _LangButton({
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 108.w,
        height: 32.h,
        child: AppButton(
          onPressed: () {},
          borderRadius: BorderRadius.circular(6.r),
          backgroundColor: Colors.transparent,
          borderColor: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 1, child: Assets.images.svgs.britishFlag.svg()),
              4.horizontalSpace,
              Expanded(
                flex: 4,
                child: Text(
                  LocaleKeys.english.tr(),
                  style:
                      theme.textTheme.bodySmall!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
