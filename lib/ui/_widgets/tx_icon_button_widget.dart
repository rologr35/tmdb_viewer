import 'package:flutter/material.dart';

class TXIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? color;

  const TXIconButtonWidget(
      {super.key, required this.icon, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 15,
      color: color,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
