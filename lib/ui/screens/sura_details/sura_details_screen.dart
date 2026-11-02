import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(QuranResources.englishQuranSuraList[index], style: AppStyles.bold20Primary,),
      ),
      body: Column(
        spacing: height * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04
            ),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.leftCorner),
                    Image.asset(AppAssets.rightCorner),
                  ],
                ),
                Text(QuranResources.arabicQuranSuraList[index], style: AppStyles.bold24Primary,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.primaryColor,
            ),
          ),
          Image.asset(AppAssets.bottomDecorationImage),
        ],
      ),
    );
  }
}
