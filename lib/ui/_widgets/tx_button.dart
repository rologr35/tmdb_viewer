
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';

class TXButton extends GetResponsiveView<TXButtonController> {
  final GestureTapCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final bool active;
  final bool loading;
  final Widget? child;

  TXButton({
    super.key,
    this.text = '',
    this.active = true,
    this.loading = false,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.only(top: 17, bottom: 17),
  }) : assert((text.isNotEmpty && child == null) ||
            (text.isEmpty && child != null));

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: !active
            ? null
            : loading
                ? () {}
                : onPressed,
        style: ElevatedButton.styleFrom(
            elevation: active ? 5 : 0,
            backgroundColor: backgroundColor ?? AppColors.primary,
            disabledForegroundColor: AppColors.gray.withOpacity(0.58),
            disabledBackgroundColor: AppColors.gray.withOpacity(0.32),
            padding: padding,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
        child: loading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: textColor, size: 18)
            : child ??
                TXTextWidget(
                  text,
                  fontWeight: fontWeight,
                  textColor: textColor,
                ));
  }
}

class TXButtonController extends GetxController {
  RxBool showLoading = false.obs;
}
