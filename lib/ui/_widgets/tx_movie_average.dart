

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';

import '../../res/values/colors.dart';

class TXMovieAverage extends StatelessWidget {
  final double avg;

  const TXMovieAverage(this.avg);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star,
              color: AppColors.white, size: 13),
          TXTextWidget(
            avg.toStringAsFixed(1),
            textColor: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}