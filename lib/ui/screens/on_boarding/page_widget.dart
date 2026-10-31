import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_styles.dart';
import '../../../core/utils/app_size_utils.dart';

class PageWidget extends StatelessWidget {
  final bool isPageOne;
  final String? image;
  final String? title;
  final String? body;
  const PageWidget({
    super.key,
    this.isPageOne = false,
    this.image,
    this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return (isPageOne) ? Column(
      spacing: height * 0.14,
      children: [
        SizedBox(height: height * 0.16,),
        Image.asset(AppAssets.intro1),
        Text(
            "Welcome To Islami App",
          style: AppStyles.bold24Primary,
        )
      ],
    )
    : Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02
      ),
      child: Column(
        spacing: height * 0.04,
        children: [
          SizedBox(height: height * 0.2,),
          Image.asset(image!),
          Text(
            title!,
            style: AppStyles.bold24Primary,
          ),
          Text(
            body!,
            style: AppStyles.bold20Primary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
