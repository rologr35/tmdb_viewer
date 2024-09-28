import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';

import '../../res/values/colors.dart';

class TXGenreChip extends StatelessWidget {
  final String genre;
  const TXGenreChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Chip(
      label: TXTextWidget(genre),
      backgroundColor: isDarkMode ? AppColors.grayDarkestPlus : AppColors.grayLightBorder,
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    );
  }
}