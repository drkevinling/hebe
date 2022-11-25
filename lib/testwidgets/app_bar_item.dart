import 'package:flutter/material.dart';

class AppBarStat {
  String _name;
  AppBarStat({required String name, required IconData iconData})
      : _name = name;

  AppBarStat.empty() : this(name: "", iconData: const IconData(34));
  String get statName => _name;
}

List<String> items = ['History', 'science', 'philosophy', 'success'];

List<IconData> icons = [
  Icons.location_on,
  Icons.date_range,
  Icons.people,
  Icons.wb_sunny
];

List<AppBarStat> appBarStat = List.generate(
    items.length,
    (index) =>
        AppBarStat(name: items[index], iconData: icons[index]));
