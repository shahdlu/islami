import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_styles.dart';

import '../../../../core/utils/app_size_utils.dart';

class ContentItem extends StatelessWidget {
  final String content;
  final double? horizontalPadding;
  final TextStyle? textStyle;

  const ContentItem({
    super.key,
    required this.content,
    this.horizontalPadding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? width * 0.04,
      ),
      child: Text(
        content,
        style: textStyle ?? AppStyles.bold20Primary,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      ),
    );
  }
}
