import 'package:flutter/material.dart';
import 'package:hebe/constants/others/keys.dart';
import 'package:hebe/widgets/popupmenu.dart';

class SmallMainScreen extends StatefulWidget {
  const SmallMainScreen({Key? key}) : super(key: key);

  @override
  State<SmallMainScreen> createState() => _SmallMainScreenState();
}

class _SmallMainScreenState extends State<SmallMainScreen> {
  @override
  void didChangeDependencies() {
    if (popUpKey.currentState != null) {
      popUpKey.currentState!.deactivate();
      // popUpKey.currentState!.activate();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amber,
          child: const MyPopUp(),
        ),
      ),
    );
  }
}
