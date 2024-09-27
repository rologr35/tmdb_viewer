import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_gesture_hide_key_board.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_icon_button_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_textfield.dart';
import 'package:tmdb_viewer/ui/search/search_controller.dart' as sc;
import 'package:tmdb_viewer/utils/extensions.dart';
import '../../data/api/_remote/endpoints.dart';
import '../../res/R.dart';
import '../../res/values/colors.dart';
import '../../res/values/images.dart';
import '../../utils/logger.dart';
import '../_widgets/tx_bottom_sheet.dart';
import '../_widgets/tx_button.dart';
import '../_widgets/tx_cached_image.dart';
import '../_widgets/tx_text_widget.dart';

class SearchPage extends GetResponsiveView<sc.SearchController> {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TXGestureHideKeyBoard(
        collapseOnPan: true,
        child: TXStandardAppbarWidget(
            useBackNav: false,
            actions: [
              TXIconButtonWidget(
                  icon: const Icon(Icons.search,
                      size: 30, color: AppColors.primary),
                  onPressed: () {
                    Get.back();
                  })
            ],
            leadingWidth: 30,
            titleWidget: Obx(() => TXTextField(
                  autofocus: true,
                  hintText: R.string.search,
                  controller: controller.textController,
                  onChanged: (t) {
                    controller.onTextChange(t);
                  },
                  prefixIcon: TXIconButtonWidget(
                      icon: Icon(
                        controller.currentGenreFilter.isNotEmpty
                            ? Icons.filter_alt
                            : Icons.filter_alt_off,
                        size: 20,
                        color: isDarkMode
                            ? AppColors.grayDark
                            : AppColors.grayDarkest,
                      ),
                      onPressed: () {
                        controller.selectedGenreFilter.value = controller
                            .movieGenres
                            .map((e) => sc.Selectable<Genre>(e,
                                isSelected: controller.currentGenreFilter
                                    .contains(e.id)))
                            .toList();
                        return showTXModalBottomSheetAutoAdjustable(
                            context: context,
                            builder: (context) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TXTextWidget(R.string.genre, fontSize: 16),
                                    const SizedBox(height: 10),
                                    Obx(() => Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          alignment: WrapAlignment.start,
                                          direction: Axis.horizontal,
                                          runSpacing: 15,
                                          spacing: 15,
                                          children: [
                                            ...controller
                                                .selectedGenreFilter.value
                                                .map((e) => InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      onTap: () {
                                                        controller
                                                            .onSelectFilter(
                                                                e.model);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                        color: e
                                                                                .isSelected
                                                                            ? AppColors
                                                                                .primary
                                                                            : isDarkMode
                                                                                ? AppColors
                                                                                    .grayDarkest
                                                                                : AppColors
                                                                                    .grayDark),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                color: e.isSelected
                                                                    ? AppColors
                                                                        .primary
                                                                        .withOpacity(
                                                                            .2)
                                                                    : Colors
                                                                        .transparent),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: TXTextWidget(
                                                              e.model.name,
                                                              textColor: e
                                                                      .isSelected
                                                                  ? Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .color
                                                                  : isDarkMode
                                                                      ? AppColors
                                                                          .grayDarkest
                                                                      : AppColors
                                                                          .grayDark),
                                                        ),
                                                      ),
                                                    ))
                                          ],
                                        )),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: TXButton(
                                          text: R.string.resetFilter,
                                          onPressed: controller.onResetFilter,
                                          backgroundColor: AppColors.blue,
                                        )),
                                        const SizedBox(width: 10),
                                        Expanded(
                                            child: TXButton(
                                                text: R.string.accept,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  controller.applyFilter();
                                                }))
                                      ],
                                    )
                                  ],
                                )));
                      }),
                  suffixIcon: controller.showClearIcon.value
                      ? TXIconButtonWidget(
                          icon: Icon(Icons.close,
                              size: 20,
                              color: isDarkMode
                                  ? AppColors.grayDark
                                  : AppColors.grayDarkest),
                          onPressed: () {
                            controller.onClear();
                          })
                      : null,
                )),
            titleSpacing: 15,
            body: Obx(() => GridView.builder(
                itemCount: controller.results.length,
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (120.0 / 185.0),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child:
                          controller.results[index].posterPath.isNullOrEmpty()
                              ? Container(
                                  decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(AppImages.splashLogo),
                                      fit: BoxFit.cover),
                                  color: isDarkMode
                                      ? AppColors.grayDark
                                      : AppColors.grayLight,
                                ))
                              : TXCachedNetworkImage(
                                  placeholder: Container(
                                      decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(AppImages.splashLogo),
                                        fit: BoxFit.cover),
                                    color: isDarkMode
                                        ? AppColors.grayDark
                                        : AppColors.grayLight,
                                  )),
                                  imageUrl:
                                      "${Endpoint.imageUrl500}${controller.results[index].posterPath}",
                                ),
                    ),
                  );
                }))));
  }
}
