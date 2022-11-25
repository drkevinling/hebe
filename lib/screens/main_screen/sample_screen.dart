import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: Container(
        constraints: const BoxConstraints(
            maxHeight: 850,
            maxWidth: 1100,
            minHeight: 800,
            minWidth: 1000),
        color: Colors.amber,
        child: Center(
          child: Text(width.toString() + height.toString()),
        ),
      ),
    ));
  }
}
