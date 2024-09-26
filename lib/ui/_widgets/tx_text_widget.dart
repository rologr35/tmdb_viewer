import 'package:flutter/material.dart';

class TXTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? textOverFlow;
  final int? maxLines;
  final String? fontFamily;
  final TextDecoration? textDecoration;

  const TXTextWidget(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight,
    this.textColor,
    this.fontSize,
    this.textOverFlow,
    this.maxLines,
    this.fontFamily,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverFlow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          fontFamily: fontFamily,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: textDecoration),
    );
  }
}
