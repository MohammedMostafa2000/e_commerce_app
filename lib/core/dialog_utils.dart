import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoadingDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: ColorsManager.lightBlue,
            ),
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showDialogMessage(
      {required BuildContext context,
      required String message,
      required void Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(
                'OK',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
            )
          ],
          content: Container(
            alignment: Alignment.center,
            child: Text(
              message,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
