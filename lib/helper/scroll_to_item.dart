import 'package:flutter/material.dart';

class ScrollToItem {
  static Future scrollToItem(GlobalKey key) async {
    final context = key.currentContext!;
    await Scrollable.ensureVisible(context,
        alignment: 0.5, duration: const Duration(seconds: 3));
  }
}
