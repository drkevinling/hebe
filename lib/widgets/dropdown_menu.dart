import 'package:flutter/material.dart';

class DropDM extends StatefulWidget {
  const DropDM({Key? key}) : super(key: key);

  @override
  State<DropDM> createState() => _DropDMState();
}

class _DropDMState extends State<DropDM> {
  late String test;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: test,
        items: const [
          DropdownMenuItem(child: Text("Ok")),
          DropdownMenuItem(child: Text("not ok"))
        ],
        onChanged: (t) {
          setState(() {
            test = t.toString();
          });
        });
  }
}
