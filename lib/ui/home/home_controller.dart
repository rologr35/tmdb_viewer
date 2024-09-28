
import 'package:get/get.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';

class HomeController extends BaseController {

  final routes = <String>[
    AppPages.instance.movies,
    AppPages.instance.popular
  ];
  final movieDetailsRegex = RegExp(r'^/home/movies/(\d+)$');
  final RxInt currentIndex = 0.obs;
  final RxBool searchBar = false.obs;
  final RxBool bottomBar = true.obs;
}
