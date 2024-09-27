import 'package:flutter/material.dart';

void showTXModalBottomSheetAutoAdjustable(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool safeAreaBottom = true,
    bool safeAreaTop = false,
    bool safeAreaLeft = true,
    bool safeAreaRight = true}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
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
