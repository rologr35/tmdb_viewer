
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/utils/extensions.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../data/repository/_base/result.dart';
import '../../res/R.dart';
import '../_widgets/tx_text_widget.dart';

mixin MessageHandler {
  void showErrorMessage(dynamic ex, {bool showMessageOnCancel = true}) {
    String message = "";
    if (ex is DioException && ex.message?.contains("400") == true) {
      message = "400 => ${R.string.badRequest}";
    } else if (ex is DioException && ex.message?.contains("401") == true) {
      message = "401 => ${R.string.unauthorized}";
    } else if (ex is DioException && ex.message?.contains("403") == true) {
      message = "403 => ${R.string.forbidden}";
    } else if (ex is DioException && ex.message?.contains("404") == true) {
      message = "404 => ${R.string.notFound}";
    } else if (ex is DioException && ex.message?.contains("409") == true) {
      message = "409 => ${R.string.conflicts}";
    } else if (ex is DioException && ex.message?.contains("500") == true) {
      message = "500 => ${R.string.internalServerError}";
    } else if (ex is ResultError) {
      message = ex.error.toString();
      if (message.contains("SocketException")) {
        message = R.string.noInternetConnection;
      } else if (!showMessageOnCancel &&
          message.contains("DioErrorType.CANCEL")) {
        return;
      }
    } else {
      message = R.string.someErrorOccurs;
    }
    _showErrorMessage(message);
  }

  void showErrorMessageFromString(String message) => _showErrorMessage(message);

  void showSuccessMessageFromString(String message) => Get.context!.showFlash(
      duration: const Duration(seconds: 3),
      builder: (_, c) => FlashBar(
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            controller: c,
            position: FlashPosition.bottom,
            content: TXTextWidget(message),
            icon: const Icon(Icons.check_circle_outline),
            indicatorColor: AppColors.info,
            backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          ));

  void showInfoMessageFromString(String message) => Get.context!.showFlash(
      duration: const Duration(seconds: 3),
      builder: (_, c) => FlashBar(
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            controller: c,
            position: FlashPosition.bottom,
            content: TXTextWidget(message),
            icon: const Icon(Icons.info_outline),
            indicatorColor: AppColors.blue,
            backgroundColor:
                Theme.of(Get.context!).scaffoldBackgroundColor.darken(),
          ));

  void _showErrorMessage(String message) {
    Get.context!.showFlash(
        duration: const Duration(seconds: 3),
        builder: (_, c) => FlashBar(
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              controller: c,
              position: FlashPosition.bottom,
              content: TXTextWidget(message),
              icon: const Icon(Icons.error_outline),
              indicatorColor: AppColors.alert,
              backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
            ));
  }
}
