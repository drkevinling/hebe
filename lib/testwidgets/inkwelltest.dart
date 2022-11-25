import 'package:flutter/material.dart';

class InkWellTest extends StatefulWidget {
  const InkWellTest({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<InkWellTest> createState() => _InkWellTestState();
}

class _InkWellTestState extends State<InkWellTest> {
  // ignore: unused_field
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              _isHover = value;
              print("rebuild");
            });
          },
          child: Text(
            widget.title,
            style: TextStyle(
                color: _isHover ? Colors.purple : Colors.black),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
