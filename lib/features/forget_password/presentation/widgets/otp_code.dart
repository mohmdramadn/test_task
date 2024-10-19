import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/constants/constants.dart';

class OtpCode extends StatelessWidget {
  const OtpCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: PinCodeTextField(
          controller: TextEditingController(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          appContext: context,
          length: 5,
          obscureText: false,
          animationType: AnimationType.fade,
          autoFocus: true,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderWidth: 10.w,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            selectedColor: Constant.appColors.yellowActiveColor,
            activeFillColor: Colors.transparent,
            inactiveFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            errorBorderColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 50.h,
            fieldWidth: 50.w,
          ),
          animationDuration: const Duration(milliseconds: 300),
          keyboardType: TextInputType.phone,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.spMin,
          ),
          enableActiveFill: true,
          autoDismissKeyboard: true,
          cursorColor: Colors.white,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onCompleted: (value) {},
          onChanged: (value) {},
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
