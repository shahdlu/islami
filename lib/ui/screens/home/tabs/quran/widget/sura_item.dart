import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';

import '../../../../../../core/utils/app_size_utils.dart';

class SuraItem extends StatelessWidget {
  final int index;
  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Row(
      spacing: width * 0.06,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.vector),
            Text("${index + 1}", style: AppStyles.bold16White,),
          ],
        ),
        Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSuraList[index], style: AppStyles.bold20White,),
            Text("${QuranResources.verseNumberList[index]} verses", style: AppStyles.bold14White,),
          ],
        ),
        Spacer(),
        Text(QuranResources.arabicQuranSuraList[index], style: AppStyles.bold20White,),
      ],
    );
  }
}
