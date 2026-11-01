import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/ui/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/time/time_tab.dart';

import '../../../core/utils/app_size_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          buildBottomNavItem(
            icon: AppAssets.quranIcon,
            label: "Quran",
            index: 0,
          ),
          buildBottomNavItem(
            icon: AppAssets.hadethIcon,
            label: "Hadeth",
            index: 1,
          ),
          buildBottomNavItem(
            icon: AppAssets.sebhaIcon,
            label: "Sebha",
            index: 2,
          ),
          buildBottomNavItem(
            icon: AppAssets.radioIcon,
            label: "Radio",
            index: 3,
          ),
          buildBottomNavItem(icon: AppAssets.timeIcon, label: "Time", index: 4),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(AppAssets.appLogo),
                Expanded(child: tabList[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.Black60Opacity,
              ),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
