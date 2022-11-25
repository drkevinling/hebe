import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hebe/cubit/cubit/popup_cubit_cubit.dart';
import 'package:hebe/cubit/menucontroller_cubit.dart';
import 'package:hebe/responsive.dart';
import 'package:hebe/screens/main_screen/large_main_screen.dart';
import 'package:hebe/screens/main_screen/small_main_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPA Demo',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: GoogleFonts.gfsNeohellenicTextTheme()),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MenucontrollerCubit(),
          ),
          BlocProvider(
            create: (context) => PopUpCubit(),
          )
        ],
        // child: const Responsive(
        //   largeScreen: LargeMainScreen(),
        //   smallScreen: SmallMainScreen(),
        child: const Responsive(
          largeScreen: LargeMainScreen(),
          smallScreen: SmallMainScreen(),
        ),
      ),
    );
  }
}
