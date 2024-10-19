import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: 30.0.h, right: 8.0.w, left: 8.0.w),
      child: Center(
        child: Text(
          title,
          style: theme.textTheme.headlineMedium!
              .copyWith(color: Colors.white, fontSize: 16.spMin),
        ),
      ),
    );
  }
}