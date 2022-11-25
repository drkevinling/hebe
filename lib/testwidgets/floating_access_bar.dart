import 'package:flutter/material.dart';
import 'package:hebe/testwidgets/inkwelltest.dart';
import 'package:hebe/testwidgets/app_bar_item.dart';

class FloatingAppBar extends StatefulWidget {
  const FloatingAppBar({Key? key}) : super(key: key);

  @override
  State<FloatingAppBar> createState() => _FloatingAppBarState();
}

class _FloatingAppBarState extends State<FloatingAppBar> {
  final List _isHovering = [false, false, false, false];

  List<Widget> rowElements = [];
  List<String> items = ['History', 'science', 'philosophy', 'ovel'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        key: ValueKey(i),
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
              color: _isHovering[i] ? Colors.yellow : Colors.black),
        ),
      );

      rowElements.add(elementTile);
      rowElements.add(const SizedBox(
        width: 20,
      ));
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      appBarStat.length,
      (index) => InkWellTest(title: appBarStat[index].statName),
    ));
  }
}
