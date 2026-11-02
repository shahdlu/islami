import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class MainLoadingWidget extends StatelessWidget {
  final Color? color;
  const MainLoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
