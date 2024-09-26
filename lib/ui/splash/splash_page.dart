import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_noappbar_widget.dart';
import 'package:tmdb_viewer/ui/splash/splash_controller.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/images.dart';

class SplashPage extends GetResponsiveView<SplashController> {
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TXNoAppbarWidget(
        safeArea: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.splashLogo, width: 150),
              const SizedBox(height: 40),
              Container(
                constraints: const BoxConstraints(maxWidth: 160),
                padding: const EdgeInsets.all(2),
                height: 6,
                decoration: const BoxDecoration(
                    color: AppColors.grayLight,
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                child: const LinearProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.primary),
                  backgroundColor: AppColors.grayLight,
                ),
              ),
            ],
          ),
        ));
  }
}
