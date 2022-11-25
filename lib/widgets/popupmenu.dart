import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/constants/others/keys.dart';
import 'package:hebe/cubit/cubit/popup_cubit_cubit.dart';
import 'package:hebe/screens/widgets/helper.dart';

import '../cubit/cubit/popup_cubit_state.dart';

class MyPopUp extends StatefulWidget {
  const MyPopUp({Key? key}) : super(key: key);

  @override
  State<MyPopUp> createState() => _MyPopUpState();
}

class _MyPopUpState extends State<MyPopUp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopUpCubit, TestPopUpState>(
      builder: (context, state) {
        return PopupMenuButton<String>(
            key: popUpKey,
            enabled: state.isPOP,
            padding: const EdgeInsets.all(2),
            offset: const Offset(0, 50),
            child: const Text("Real Menu Item"),
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    textStyle: const TextStyle(
                        color: Colors.red, fontSize: 10),
                    child: const Text("TPA"),
                    onTap: () {
                      MyScroll.scrollToItem(testKey);
                    },
                  ),
                  const PopupMenuItem(child: Text("EN")),
                  const PopupMenuItem(child: Text("MT")),
                ]);
      },
    );
  }
}
