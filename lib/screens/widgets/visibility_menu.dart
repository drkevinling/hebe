import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/cubit/menucontroller_cubit.dart';
import 'package:hebe/cubit/menustate.dart';
import 'package:hebe/widgets/treatments.dart';

class VisibilityMenu extends StatefulWidget {
  const VisibilityMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<VisibilityMenu> createState() => _VisibilityMenuState();
}

class _VisibilityMenuState extends State<VisibilityMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenucontrollerCubit, MenuState>(
      buildWhen: ((previous, current) =>
          previous.isVisible != current.isVisible),
      builder: (context, state) {
        return Visibility(
          visible: state.isVisible,
          child: Positioned(
              top: 50,
              left: state.offSet,
              child: AnimatedContainer(
                color: Colors.grey,
                duration: const Duration(seconds: 3),
                curve: Curves.easeIn,
                width: 200,
                height: 200,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: ScrollController(),
                  child: Column(
                    children: List.generate(
                        treatmentList.length,
                        (index) => TreatmentListTile(
                            treatmentName: treatmentList[index])),
                  ),
                ),
              )),
        );
      },
    );
  }
}
