
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_blur_dialog.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import '../../res/R.dart';

dynamic txShowWarningDialog({
      required String title,
      required String content,
      Widget? body,
      bool yesNo = true,
      ValueChanged<bool>? onAction,
      bool dismissible = true,
      bool backOnOk = true
    }) {
  return showBlurDialog(
      barrierDismissible: dismissible,
      builder: (context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return AlertDialog(
          // backgroundColor: R.color.dialogBackground,
          title: TXTextWidget(
            title,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          content: body ?? TXTextWidget(
            content,
            textAlign: TextAlign.start,
            textColor: isDarkMode ? AppColors.gray : AppColors.grayDarkest,
            textOverFlow: TextOverflow.visible,
          ),
          actions: <Widget>[
            yesNo
                ? TextButton(
              child: TXTextWidget(
                R.string.no,
                fontWeight: FontWeight.bold,
                textColor: AppColors.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if(onAction != null) onAction(false);
              },
            ) : Container(),
            TextButton(
              child: TXTextWidget(
                yesNo ? R.string.yes : R.string.ok,
                fontWeight: FontWeight.bold,
                textColor: AppColors.primary,
              ),
              onPressed: () {
                if(backOnOk) Navigator.of(context).pop();
                if(onAction != null) onAction(true);
              },
            ),
          ],
        );
      });
}