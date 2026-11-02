import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';
import 'package:islami/ui/screens/home/common/main_loading_widget.dart';
import 'package:islami/ui/screens/home/common/content_item.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String verses = "";
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if(verses.isEmpty){
      loadSuraFile(index);
    }
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
            child: verses.isEmpty ?
                MainLoadingWidget()
                :
                SingleChildScrollView(child: ContentItem(content: verses))
          ),
          Image.asset(AppAssets.bottomDecorationImage),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async{
    String fileContent = await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> lines = fileContent.split("\n");
    for(int i = 0; i < lines.length; i++){
      lines[i] += "[${ i + 1}]";
    }
    verses = lines.join(' ');
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {

      });
    },);
  }
}
