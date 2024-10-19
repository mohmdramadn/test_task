// import 'dart:ui' as ui;
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../generated/locale_keys.g.dart';
//
//
// class Counter extends StatelessWidget {
//   const Counter({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Directionality(
//             textDirection: ui.TextDirection.rtl,
//             child: Center(
//               child: Text(
//                 false
//                     ? ''
//                     : state.isCounterEnded
//                         ? '00:00'
//                         : state.currentTime.toString(),
//                 style: TextStyle(fontSize: 14.sp, color: Colors.red[700]),
//               ),
//             ),
//           ),
//           Assets.svg.clock
//               .svg(height: SizeManager.sH16, width: SizeManager.sW16),
//         ].paddingSymmetric(horizontal: 5.w),
//       ),
//     );
//   }
// }
