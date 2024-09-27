
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/images.dart';

import '../../enums.dart';

class TXTextField extends StatefulWidget {
  final String? labelText;
  final Color? fieldTextColor;
  final double labelTextSize;
  final FontWeight labelTextFont;
  final String? hintText;
  final bool? showErrorState;
  final String? errorMessage;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputAction? textInputActionCupertino;
  final TextInputType keyboardType;
  final bool requiredIndicator;
  final bool isPasswordField;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final Color? labelTextColor;
  final Color? errorColor;
  final Color? defaultBorderColor;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? autofocus;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool labelAlwaysOnTop;
  final bool enableInteractiveSelection;
  final BorderRadius? borderRadius;
  final TextFieldInputBorder border;
  final String? Function(String?)? functionValidator;
  final Color? fillColor;

  const TXTextField({
    super.key,
    this.maxLines = 1,
    this.fillColor,
    this.functionValidator,
    this.autofocus,
    this.labelTextFont = FontWeight.normal,
    this.labelTextSize = 13,
    this.fieldTextColor,
    this.suffixIcon,
    this.enabled,
    this.border = TextFieldInputBorder.outline,
    this.labelText,
    this.showErrorState,
    this.errorMessage,
    required this.controller,
    this.hintText,
    this.isPasswordField = false,
    this.requiredIndicator = false,
    this.textInputAction,
    this.currentFocus,
    this.nextFocus,
    this.labelTextColor,
    this.errorColor,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.onChanged,
    this.labelAlwaysOnTop = true,
    this.defaultBorderColor,
    this.enableInteractiveSelection = true,
    this.onSubmitted,
    this.textInputActionCupertino,
    this.borderRadius,
    this.prefixIcon
  });

  @override
  State<StatefulWidget> createState() => _TXTextFieldState();
}

class _TXTextFieldState extends State<TXTextField> {
  bool _hasErrors = false;
  bool _isPasswordRevealed = false;
  bool isDarkMode = false;

  Color get currentColor => _hasErrors
      ? (widget.errorColor ?? AppColors.alert)
      : (widget.labelTextColor ??
          (isDarkMode ? AppColors.gray : AppColors.grayDarkest));

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;
    BorderRadius borderRadius =
        widget.borderRadius ?? const BorderRadius.all(Radius.circular(10));
    return TextFormField(
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      autofocus: widget.autofocus ?? false,
      onChanged: widget.onChanged,
      cursorColor: isDarkMode ? Colors.white : Colors.black,
      style: TextStyle(
          color: (widget.fieldTextColor ??
              (isDarkMode ? Colors.white : Colors.black)),
          fontSize: widget.labelTextSize,
          fontWeight: widget.labelTextFont),
      controller: widget.controller,
      textInputAction:
          widget.textInputActionCupertino ?? widget.textInputAction,
      keyboardType: widget.keyboardType,
      keyboardAppearance: Theme.of(context).brightness,
      inputFormatters:
          widget.keyboardType.index == 2 ? [NumericTextFormatter()] : null,
      obscureText: widget.isPasswordField && !_isPasswordRevealed,
      focusNode: widget.currentFocus,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      textCapitalization: widget.textCapitalization,
      onFieldSubmitted: (term) {
        if (widget.onSubmitted != null) widget.onSubmitted!(term);
        widget.textInputAction == TextInputAction.done
            ? FocusScope.of(context).unfocus()
            : FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      validator: widget.functionValidator != null
          ? (value) {
              final validatorMessage = widget.functionValidator!(value!);
              setHasErrors(validatorMessage != null);
              return validatorMessage;
            }
          : null,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon ?? getSuffixIcon2(),
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: currentColor),
        labelText: widget.labelText,
        fillColor: widget.fillColor ?? (isDarkMode ? AppColors.grayDarkestPlus : AppColors.grayLightestPlus),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: currentColor,
          fontWeight: widget.labelTextFont,
          fontSize: 18,
        ),
        errorStyle: TextStyle(
          color: widget.errorColor,
        ),
        border: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: (widget.defaultBorderColor ??
                            (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                        width: 2),
                  )
                : InputBorder.none,
        focusedBorder: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                        color: (widget.defaultBorderColor ??
                            (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                        width: 2),
                  )
                : InputBorder.none,
        enabledBorder: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                        color: (widget.defaultBorderColor ??
                            (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                        width: 2),
                  )
                : InputBorder.none,
        disabledBorder: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                        color: (widget.defaultBorderColor ??
                            (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                        width: 2),
                  )
                : InputBorder.none,
        errorBorder: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                        color: (widget.errorColor ?? AppColors.alert),
                        width: 2),
                  )
                : InputBorder.none,
        focusedErrorBorder: widget.border == TextFieldInputBorder.outline
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                    color:
                        (widget.defaultBorderColor ?? (isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder)),
                    width: 1),
              )
            : widget.border == TextFieldInputBorder.underline
                ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                        color: (widget.errorColor ?? AppColors.alert),
                        width: 2),
                  )
                : InputBorder.none,
        alignLabelWithHint: false,
        isDense: true,
      ),
    );
  }

  setHasErrors(bool errors) => setState(() {
        _hasErrors = errors;
      });

  // Widget? getSuffixIcon() {
  //   if (widget.isPasswordField) {
  //     return GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           _isPasswordRevealed = !_isPasswordRevealed;
  //         });
  //       },
  //       child: Image.asset(
  //         _isPasswordRevealed ? R.image.eye : R.image.eyeSlash,
  //         color: AppColors.grayDarkest,
  //       ),
  //     );
  //   }
  //   if (_hasErrors)
  //     return Image.asset(
  //       R.image.error,
  //     );
  //   return null;
  // }

  Widget? getSuffixIcon2() {
    if (widget.isPasswordField) {
      return SizedBox(
        width: _hasErrors ? 70 : 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_hasErrors) Image.asset(AppImages.error),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordRevealed = !_isPasswordRevealed;
                });
              },
              child: Image.asset(
                _isPasswordRevealed ? AppImages.eye : AppImages.eyeSlash,
                color: isDarkMode ? AppColors.grayDark : AppColors.grayDarkest,
              ),
            ),
          ],
        ),
      );
    } else if (_hasErrors) {
      return Image.asset(
        AppImages.error,
      );
    }
    return null;
  }
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(',')) {
      return newValue.copyWith(text: newValue.text.replaceAll(',', '.'));
    }
    return newValue;
  }
}
