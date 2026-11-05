import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/screens/home/common/main_loading_widget.dart';
import 'package:islami/ui/screens/sura_details1/sura_content1.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_size_utils.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  const SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of(context);
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.souraDetailsBg)),
        ),
        child: Column(
          spacing: height * 0.068,
          children: [
            Padding(
              padding: EdgeInsets.only(top:height * 0.02 ),
              child: Text(QuranResources.arabicQuranSuraList[index], style: AppStyles.bold24Primary,),
            ),
            Expanded(
              child: verses.isEmpty ?
                  MainLoadingWidget()
                  :
                  ListView.separated(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return SuraContent1(content: verses[index],index: index,);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.02);
                    },
                  )
            ),
            SizedBox(height: height * 0.066
              ,)
          ],
        ),
      )
    );
  }
  @override
  dispose(){
    super.dispose();
    mostRecentProvider.getLastSuraIndex();
  }
  Future<void> loadSuraFile(int index) async{
    String fileContent = await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> lines = fileContent.split("\n");
    verses = lines;
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {

      });
    },);
  }
}
