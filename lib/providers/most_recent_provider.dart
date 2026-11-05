import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/shared_prefs_utils.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];
  void getLastSuraIndex() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndexAsStringList = prefs.getStringList(
        SharedPrefsKeys.key) ?? [];
    mostRecentList = mostRecentIndexAsStringList.map(
            (index) => int.parse(index)
    ).toList();
    notifyListeners();
  }
}