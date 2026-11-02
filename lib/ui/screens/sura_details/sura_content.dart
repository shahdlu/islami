import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_styles.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraContent extends StatelessWidget {
  final String content;

  const SuraContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Text(
        content,
        style: AppStyles.bold20Primary,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      ),
    );
  }
}
