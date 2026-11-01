import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_styles.dart';

import '../../../../../core/utils/app_size_utils.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkarList = [
    "سبحان الله",
    "الحمد الله",
    "الله أكبر"
  ];
  int zekrCount = 0;
  int zekrIndex = 0;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Center(
      child: Column(
        spacing: height * 0.017,
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppStyles.bold36White),
          GestureDetector(
            onTap: onSebhaTab,
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Stack(
                  alignment: AlignmentGeometry.topCenter,
                  children: [
                    Image.asset(AppAssets.sebhaDecorative),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.084),
                      child: AnimatedRotation(
                        turns: turns,
                        duration: Duration(milliseconds: 100),
                        child: Image.asset(AppAssets.sebhaBeads),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: height * 0.13,
                  child: Column(
                    spacing: height * 0.03,
                    children: [
                      Text(azkarList[zekrIndex], style: AppStyles.bold36White),
                      Text("$zekrCount", style: AppStyles.bold36White),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaTab() {
    if (zekrCount < 33) {
      zekrCount++;
    } else {
      zekrCount = 1;
      zekrIndex++;
      if (zekrIndex >= azkarList.length) {
        zekrIndex = 0;
      }
    }
    turns += 0.033;
    setState(() {});
  }
}
