import 'package:flutter/material.dart';

class TXGestureHideKeyBoard extends StatelessWidget {
  final Widget child;
  final bool collapseOnPan;
  final bool collapseOnTapDown;

  const TXGestureHideKeyBoard({super.key, required this.child, this.collapseOnPan = false, this.collapseOnTapDown = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: collapseOnTapDown ? (_) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        } : null,
        onTapUp: (_) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        onPanDown: collapseOnPan ? (_) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        } : null,
        child: child);
  }
}
