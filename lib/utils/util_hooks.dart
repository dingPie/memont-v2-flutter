import 'package:flutter/material.dart';

import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';

class UtilHooks {
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
