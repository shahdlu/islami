import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/hadeth.dart';
import 'package:islami/ui/screens/home/common/content_item.dart';
import 'package:islami/ui/screens/home/common/main_loading_widget.dart';

import '../../../../../core/utils/app_size_utils.dart';

class HadethCard extends StatefulWidget {
  final int index;

  HadethCard({super.key, required this.index});

  @override
  State<HadethCard> createState() => _HadethCardState();
}

class _HadethCardState extends State<HadethCard> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(AppAssets.hadethCardBg)),
      ),
      child: hadeth == null
          ? MainLoadingWidget(color: AppColors.black)
          : Column(
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppAssets.leftCornerHadeth),
                          Image.asset(AppAssets.rightCornerHadeth),
                        ],
                      ),
                    ),
                    ContentItem(
                      content: hadeth?.title ?? " ",
                      textStyle: AppStyles.bold24Black,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ContentItem(
                      content: hadeth?.content ?? " ",
                      textStyle: AppStyles.bold16Black,
                    ),
                  ),
                ),
                Image.asset(AppAssets.mosqueHadeth),
              ],
            ),
    );
  }

  Future<void> loadHadethFile() async {
    String hadethFile = await rootBundle.loadString(
      "assets/files/hadeth/h${widget.index}.txt",
    );
    int newLineIndex = hadethFile.indexOf("\n");
    String title = hadethFile.substring(0, newLineIndex);
    String content = hadethFile.substring(newLineIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {});
    });
  }
}
