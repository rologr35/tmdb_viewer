
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/utils/extensions.dart';


class TXSegmentedWidget extends StatelessWidget {
  final List<SelectionModel> list;
  final ValueChanged<SelectionModel> onTap;

  const TXSegmentedWidget({super.key, required this.list, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> map = {};
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    list.forEachIndexed((model, index) {
      map[index] = Expanded(
          flex: 1,
          child: SizedBox(
              width: double.infinity, child: _getItem(model, isDarkMode)));
    });
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: isDarkMode ? AppColors.grayDarkest : AppColors.grayLightBorder.lighten(.05),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [...map.values.toList()],
      ),
    );
  }

  Widget _getItem(SelectionModel model, bool isDarkMode) {
    return model.isSelected
        ? _getItemSelected(model, isDarkMode)
        : _getItemNotSelected(model, isDarkMode);
  }

  Widget _getItemSelected(SelectionModel model, bool isDarkMode) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {
        for (var element in list) {
          element.isSelected = model.key == element.key;
        }
        onTap(model);
      },
      child: Card(
        color: isDarkMode ? AppColors.grayDarkestPlus : AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(1),
        elevation: 1,
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: model.icon != null
              ? Icon(model.icon, color: AppColors.primary)
              : TXTextWidget(
                  model.name,
                  textColor: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }

  Widget _getItemNotSelected(SelectionModel model, bool isDarkMode) {
    return InkWell(
      onTap: () {
        for (var element in list) {
          element.isSelected = model.key == element.key;
        }
        onTap(model);
      },
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: model.icon != null
            ? Icon(model.icon,
                color: isDarkMode ? AppColors.grayLightest : AppColors.black)
            : TXTextWidget(
                model.name,
                textColor: isDarkMode ? AppColors.grayLightest : AppColors.black,
              ),
      ),
    );
  }
}

class SelectionModel {
  String name;
  IconData? icon;
  String key;
  bool isSelected;

  SelectionModel(
      {required this.name,
      required this.key,
      this.isSelected = false,
      this.icon});
}
