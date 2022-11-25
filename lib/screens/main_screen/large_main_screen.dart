import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/cubit/cubit/popup_cubit_cubit.dart';
import 'package:hebe/screens/widgets/visibility_menu.dart';
import 'package:hebe/widgets/mainbodywidget.dart';

import '../widgets/top_bar.dart';

class LargeMainScreen extends StatefulWidget {
  const LargeMainScreen({Key? key}) : super(key: key);

  @override
  State<LargeMainScreen> createState() => _LargeMainScreenState();
}

class _LargeMainScreenState extends State<LargeMainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // context.read<MenucontrollerCubit>().initFor();
    var controller = context.read<PopUpCubit>();
    // controller.changeFalse().then(
    //       (value) => controller.changeTrue(),
    //     );
    // .then((value) => context.read<PopUpCubit>().changeTrue());
    print(controller.state.isPOP);
    print("didchange");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  width: width,
                  height: height,
                ),
                MainBodyWidget(width: width),
              ],
            ),
            const VisibilityMenu(),
          ],
        ),
      ),
    );
  }
}
