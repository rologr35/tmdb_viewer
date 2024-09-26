import 'package:flutter/material.dart';

class TXNoAppbarWidget extends StatelessWidget{
  final Widget body;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? bottomBar;
  final bool safeArea;

  const TXNoAppbarWidget({super.key, required this.body, this.safeArea = true, this.bottomBar, this.backgroundColor, this.resizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomBar,
      body: SafeArea(
        top: safeArea,
        bottom: safeArea,
        left: true,
        right: true,
        child: body,
      ),
    );
  }

}