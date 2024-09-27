
import 'package:get/get.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';

class HomeController extends BaseController {

  final routes = <String>[
    AppPages.instance.movies,
    AppPages.instance.popular,
    AppPages.instance.favorites
  ];

  final RxInt currentIndex = 0.obs;
  final RxBool searchBar = false.obs;
}
