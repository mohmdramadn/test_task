import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/constants.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 8.0.w),
      child: Text(
        title,
        style: theme.textTheme.headlineSmall!.copyWith(
          color: Constant.appColors.greyHint,
          fontSize: 12.spMin,
        ),
      ),
    );
  }
}