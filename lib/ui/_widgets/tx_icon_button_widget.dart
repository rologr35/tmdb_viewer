import 'package:flutter/material.dart';

class TXIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const TXIconButtonWidget(
      {super.key, required this.icon, required this.onPressed, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      splashRadius: 15,
      color: color,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
