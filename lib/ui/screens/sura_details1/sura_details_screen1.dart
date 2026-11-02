import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraDetailsScreen1 extends StatelessWidget {
  const SuraDetailsScreen1({super.key});

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.souraDetailsBg)),
        ),
        child: Column(
          spacing: height * 0.068,
          children: [
            Text(QuranResources.arabicQuranSuraList[index], style: AppStyles.bold24Primary,),
            Expanded(
              child: Container(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: height * 0.066
              ,)
          ],
        ),
      )
    );
  }
}
