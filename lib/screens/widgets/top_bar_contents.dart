import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({Key? key, required this.screenSize})
      : super(key: key);
  final Size screenSize;
  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(widget.screenSize.width, 70),
      child: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
