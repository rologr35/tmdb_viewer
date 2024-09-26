

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';

class TrendingMoviesController extends BaseController {

  final PageController pageController = PageController(viewportFraction: 0.85);
  final double scaleFactor = 0.8;
  final double height = 300;

  final RxnDouble position = RxnDouble(0.0);
  final RxInt dotIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(onPageChanged);
  }

  @override
  void onClose() {
    pageController.removeListener(onPageChanged);
    super.onClose();
  }

  void onPageChanged() {
    position.value = pageController.page;
  }
}