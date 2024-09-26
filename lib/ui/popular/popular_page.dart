

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_noappbar_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';

class PopularPage extends GetResponsiveView<PopularController> {
  PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TXNoAppbarWidget(body: TXTextWidget("Popular"));
  }
}