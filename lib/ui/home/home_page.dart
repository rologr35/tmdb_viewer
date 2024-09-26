import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/constants.dart';
import '../../res/R.dart';
import '../_widgets/tx_noappbar_widget.dart';
import 'home_controller.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final bottomNavItems = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.movie_creation_outlined),
        label: R.string.movies,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.local_fire_department),
        label: R.string.popular,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        label: R.string.favorites,
      )
    ];

    return TXNoAppbarWidget(
        body: GetRouterOutlet(
          initialRoute: AppPages.instance.movies,
          anchorRoute: AppPages.instance.homeRoot,
        ),
        bottomBar: IndexedRouteBuilder(
            builder: (context, routes, index) {
              final delegate = context.delegate;
              return Obx(() => BottomNavigationBar(
                items: bottomNavItems,
                currentIndex: controller.currentIndex.value,
                selectedItemColor: AppColors.primary,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedIconTheme:
                const IconThemeData(color: AppColors.primary),
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                isDarkMode ? AppColors.grayElementsDark : AppColors.grayLightest,
                showUnselectedLabels: true,
                onTap: (value) {
                  delegate.toNamed(routes[value], arguments: Get.arguments);
                  controller.currentIndex.value = value;
                },
              ));
            },
            routes: [
              AppPages.instance.movies,
              AppPages.instance.popular,
              AppPages.instance.myList
            ]));
  }
}
