
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_icon_button_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';

class TXStandardAppbarWidget extends StatelessWidget {
  final Widget? leadingWidget;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final String? title;
  final double? titleFontSize;
  final Widget body;
  final bool useBackNav;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final double? titleSpacing;
  final Widget? bottomBar;
  final double? leadingWidth;
  final Widget? titleWidget;

  const TXStandardAppbarWidget(
      {super.key,
      this.leadingWidget,
      this.onLeadingTap,
        this.titleWidget,
      this.actions,
      this.title,
      this.titleFontSize,
      required this.body,
      this.useBackNav = true,
      this.floatingActionButton,
        this.floatingActionButtonLocation,
      this.bottomBar,
        this.leadingWidth,
      this.titleSpacing});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final leading = leadingWidget ??
        (useBackNav
            ? TXIconButtonWidget(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: onLeadingTap ??
                    () {
                      Get.back();
                    })
            : null);
    return Scaffold(
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      appBar: AppBar(
        centerTitle: false,
        actions: actions,
        elevation: 0,
        title: titleWidget ?? (title != null ? Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width *
                      0.20533333333333334)),
          child: TXTextWidget(
            title!,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            maxLines: 1,
            textOverFlow: TextOverflow.ellipsis,
            textColor: isDarkMode ? AppColors.white : AppColors.black,
          ),
        ) : null),
        titleSpacing: titleSpacing ?? (leading == null ? null : -15),
        leading: leading,
        leadingWidth: leadingWidth ?? 56,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: bottomBar,
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        top: false,
        child: body,
      ),
    );
  }
}
