import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';

import '../../res/values/colors.dart';

class TXGenreChip extends StatelessWidget {
  final String genre;
  const TXGenreChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: TXTextWidget(genre),
      backgroundColor: AppColors.grayLightBorder,
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    );
  }
}