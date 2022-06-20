import 'package:flutter/material.dart';
import 'package:hebe/responsive.dart';
import 'package:hebe/screens/main_screen/large_main_screen.dart';
import 'package:hebe/screens/main_screen/small_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TPA Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const Responsive(
          largeScreen: LargeMainScreen(),
          smallScreen: SmallMainScreen(),
        ));
  }
}
