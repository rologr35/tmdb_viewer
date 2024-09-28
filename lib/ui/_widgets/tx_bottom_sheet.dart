import 'package:flutter/material.dart';
import 'package:tmdb_viewer/res/values/colors.dart';

void showTXModalBottomSheetAutoAdjustable(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool safeAreaBottom = true,
    bool safeAreaTop = false,
    bool safeAreaLeft = true,
    bool safeAreaRight = true}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDarkMode ? AppColors.grayElementsDark : null,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (b) => Container(
      color: Colors.transparent,
      width: double.infinity,
      child: SafeArea(
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        right: safeAreaRight,
        top: safeAreaTop,
        child: SingleChildScrollView(
          child: builder(context),
        ),
      ),
    ),
  );
}
