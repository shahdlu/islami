import 'package:flutter/material.dart';
import 'package:islami/core/shared_prefs_utils.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_styles.dart';
import 'package:islami/models/quran_resources.dart';
import 'package:islami/ui/screens/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islami/ui/screens/home/tabs/quran/widget/sura_item.dart';

import '../../../../../core/utils/app_size_utils.dart';

class QuranTab extends StatefulWidget {

  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  late double width;

  late double height;

  List<int> filterList = List.generate(114, (index) => index,);

  @override
  Widget build(BuildContext context) {
    width = context.width;
    height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * 0.02,
          children: [
            _builtSearchSection(),
            MostRecentWidget(),
            Text("Suras List", style: AppStyles.bold16OffWhite),
            _buildSuraSection(
              onSuraClick: (index) {
                Navigator.of(context)
                    .pushNamed(AppRoutes.suraDetails1, arguments: index);
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }

  Widget _builtSearchSection() {
    return TextField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        enabledBorder: _buildDecorationBorder(),
        focusedBorder: _buildDecorationBorder(),
        hintText: "Sura Name",
        hintStyle: AppStyles.bold16OffWhite,
        prefixIcon: Image.asset(AppAssets.searchIcon),
      ),
      style: AppStyles.bold16OffWhite,
      onChanged: (text) {
        searchBySuraName(text);
      },
    );
  }

  Widget _buildSuraSection({required void Function(int) onSuraClick}) {
    return filterList.isEmpty ?
        Center(child: Text("No Sura Name Found",style: AppStyles.bold24OffWhite,),)
        :
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            saveLastSuraIndex(filterList[index]);
            onSuraClick(filterList[index]);
          },
          child: SuraItem(index: filterList[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 2,
          height: height * 0.04,
          indent: width * 0.08,
          endIndent: width * 0.08,
        );
      },
      itemCount: filterList.length,
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(suraName.toLowerCase()) ||
          QuranResources.arabicQuranSuraList[i].contains(suraName)
      ) {
        searchList.add(i);
      }
      filterList = searchList;
      setState(() {

      });
    }
  }
}
