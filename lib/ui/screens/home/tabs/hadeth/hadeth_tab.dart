import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/hadeth/hadeth_card.dart';

import '../../../../../core/utils/app_size_utils.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});

  List<int> itemsIndex = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return CarouselSlider(
      options: CarouselOptions(height: height * 0.60,
      enlargeCenterPage: true),
      items: itemsIndex.map((index) => HadethCard(index: index)).toList(),
    );
  }
}
