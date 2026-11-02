import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraContent1 extends StatelessWidget {
  final String content;
  final int index;

  const SuraContent1({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: AppColors.primaryColor),
      ),
      child: Text(
        "$content [${index + 1}]",
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
