import 'package:flutter/material.dart';

class CalculateWidgetPosition {
  static double getOffset(GlobalKey key) {
    double x = 200;

    RenderBox? box =
        key.currentContext!.findRenderObject() as RenderBox?;

    x = box!.localToGlobal(Offset.zero).dx;

    return x;
  }
}

class MyScroll {
  static Future scrollToItem(GlobalKey k) async {
    final context = k.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 3));
  }
}
