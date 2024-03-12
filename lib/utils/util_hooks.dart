import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';

enum ToastType { error, success }

class UtilHooks {
  static useCustomToast({
    required BuildContext context,
    required String content,
    ToastType toastType = ToastType.error,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    var colors = context.colors;
    var textStyle = context.textStyle;

    Color bgColor =
        toastType == ToastType.success ? colors.success : colors.warning;
    IconData icon = toastType == ToastType.success
        ? Icons.check_box_outlined
        : Icons.error_outline;

    Widget toast = Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            content,
            style: textStyle.body['lg']!.copyWith(
              color: colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static useShowCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? successButtonText,
    void Function()? successButtonAction,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(
              title,
              style: Theme.of(context)
                  .extension<AppTextStyleExtension>()!
                  .heading['sm'],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  content,
                ),
              ],
            ),
            contentPadding: const EdgeInsets.only(left: 24, right: 24, top: 8),
            actionsAlignment: MainAxisAlignment.end,
            actionsPadding: const EdgeInsets.all(8),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  '취소',
                  style: TextStyle(
                    color: Theme.of(context)
                        .extension<AppColorsExtension>()!
                        .gray[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (successButtonText != null && successButtonAction != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    successButtonAction();
                  },
                  child: Text(
                    successButtonText,
                    style: TextStyle(
                      color: Theme.of(context)
                          .extension<AppColorsExtension>()!
                          .primary[500],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
