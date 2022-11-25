import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/cubit/cubit/popup_cubit_cubit.dart';

const largePixel = 950;
const smallPixel = 650;

//some = 1100, 850 Desktop/tablet/mobile

class Responsive extends StatelessWidget {
  const Responsive(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      required this.smallScreen})
      : super(key: key);

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= smallPixel;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > smallPixel &&
      MediaQuery.of(context).size.width < largePixel;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largePixel;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<PopUpCubit>();
    return LayoutBuilder(builder: ((context, constraints) {
      double width = constraints.maxWidth;
      if (width >= largePixel) {
        return largeScreen;
      } else if (width < largePixel && width > smallPixel) {
        return mediumScreen ?? smallScreen;
      } else {
        return smallScreen;
      }
    }));
  }
}
