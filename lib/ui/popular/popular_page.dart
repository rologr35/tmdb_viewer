

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_noappbar_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';

import '../../res/values/images.dart';
import '../_widgets/tx_icon_button_widget.dart';

class PopularPage extends GetResponsiveView<PopularController> {
  PopularPage({super.key});

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return TXStandardAppbarWidget(
      leadingWidth: 70,
      leadingWidget: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Image.asset(AppImages.splashLogo),
      ),
      actions: [
        TXIconButtonWidget(
            icon: const Icon(Icons.search, size: 30), onPressed: () {})
      ],
      body: Obx(() => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Skeletonizer(
            enabled: controller.isLoading,
            child: Container()),
      ))),
    );
  }
}