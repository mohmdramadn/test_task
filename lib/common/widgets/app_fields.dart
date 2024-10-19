import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/constants.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.inputType,
  });

  final String labelText;
  final String? Function(dynamic value) validator;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 16.h,
      keyboardType: inputType ?? TextInputType.text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.white,fontSize: 20.spMin),
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Constant.appColors.textFieldHintColor, fontSize: 11.spMin),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
