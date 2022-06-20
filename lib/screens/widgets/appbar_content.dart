import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(name));
  }
}
