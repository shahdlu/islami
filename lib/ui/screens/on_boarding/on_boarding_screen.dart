import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_size_utils.dart';
import 'package:islami/ui/screens/on_boarding/page_widget.dart';

import '../../../core/utils/app_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: IntroductionScreen(
        rawPages: [
          PageWidget(isPageOne: true,),
          PageWidget(
            image: AppAssets.intro2,
            title: "Welcome To Islami",
            body: "We Are Very Excited To Have You In Our Community",
          ),
          PageWidget(
            image: AppAssets.intro3,
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
          ),
          PageWidget(
            image: AppAssets.intro4,
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
          ),
          PageWidget(
            image: AppAssets.intro5,
            title: "Holy Quran Radio",
            body: "You can listen to the Holy Quran Radio through the application for free and easily",
          ),
        ],
        globalHeader: Image.asset(AppAssets.appLogo),
        globalBackgroundColor: AppColors.black,
        showBackButton: true,
        back: Text(
            "Back",
          style: AppStyles.bold16Primary,
        ),
        next: Text(
            "Next",
          style: AppStyles.bold16Primary,
        ),
        done: Text(
            "Finish",
          style:AppStyles.bold16Primary,
        ),
        onDone: () {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        },
        dotsDecorator:DotsDecorator(
          size: Size(width * 0.016, height * 0.007),
          activeSize: Size(width*0.04, height * 0.007),
          activeColor: AppColors.primaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40)
          )
        ),
      ),
    );
  }
}
