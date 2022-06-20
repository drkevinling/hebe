import 'package:flutter/material.dart';

class SmallMainScreen extends StatelessWidget {
  const SmallMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.amber,
      ),
    );
  }
}
