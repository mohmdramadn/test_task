import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.spMin),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
          backgroundColor: backgroundColor ?? Constant.appColors.blue),
      child: child,
    );
  }
}
