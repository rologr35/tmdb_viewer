

import 'package:get/get.dart';

mixin LoadingHandler {

  final RxBool _isLoading = false.obs;

  RxBool get loadingController => _isLoading;

  bool get isLoading => _isLoading.value;

  set isLoading(bool loading) {
    _isLoading.value = loading;
  }

  void disposeLoadingHandler() {
    _isLoading.close();
  }
}