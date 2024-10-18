import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

@singleton
class MessageService {
  @override
  static void showToast({
    required String msg,
    required ToastStates state,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.spMin,
      );

  static Color chooseToastColor(ToastStates state) {
    Color color;
    switch (state) {
      case ToastStates.SUCCESS:
        color = Colors.green;
        break;
      case ToastStates.ERROR:
        color = Colors.red;
        break;
      case ToastStates.WARNING:
        color = Colors.amber;
        break;
    }
    return color;
  }

  Future<dynamic>? showDecisionAlertDialog<T>(BuildContext context,{
    String? title,
    required String message,
    required String confirm,
    required String cancel,
    required Function() onConfirm,
    required Function() onCancel,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(title ?? ""),
            content: Text(
              message,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: onCancel,
                child: Text(
                  cancel,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: onConfirm,
                child: Text(
                  confirm,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
