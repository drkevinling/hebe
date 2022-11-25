import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hebe/constants/colors/colors.dart';
import 'package:hebe/constants/images/images.dart';
import 'package:hebe/constants/others/keys.dart';
import 'package:hebe/constants/others/texts.dart';
import 'package:hebe/constants/styles/kstants.dart';
import 'package:hebe/cubit/menucontroller_cubit.dart';
import 'package:hebe/widgets/popupmenu.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: appBarColor3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            constraints: const BoxConstraints(maxWidth: 1220),
            height: 50,
            decoration:

                //Color.fromARGB(255, 11, 69, 86)
                //0xff083248
                const BoxDecoration(color: appBarColor3),
            child: Row(
              children: [
                Image.asset(hebeYoungGirl, width: 50, height: 50),
                const HebeTitle(),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Medical Aesthetic Center",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                MenuStats(
                  title: "Home",
                  fun: () {},
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kpadding),
                  child: InkWell(
                      key: servicekey,
                      onHover: (x) {},
                      onTap: () {
                        context.read<MenucontrollerCubit>().click();
                      },
                      child: Text(
                        "Services",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      )),
                ),
                MenuStats(
                  title: "Contacts",
                  fun: () {},
                ),
                const MyPopUp(),
                const Spacer(),
                const FaIcon(
                  Icons.phone_rounded,
                  color: white,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kpadding),
                  child: const Text(
                    contact,
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Welcome To HEBE Clinic",
              style: GoogleFonts.alegreyaSans().copyWith(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Best and Foremost Plastic Surgery Clinic",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class HebeTitle extends StatelessWidget {
  const HebeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "HEBE",
      style: TextStyle(
          color: Colors.grey,
          fontSize: 25,
          fontWeight: FontWeight.bold),
    );
  }
}

class MenuStats extends StatefulWidget {
  const MenuStats({
    Key? key,
    required this.title,
    required this.fun,
  }) : super(key: key);

  final String title;
  final VoidCallback fun;

  @override
  State<MenuStats> createState() => _MenuStatsState();
}

class _MenuStatsState extends State<MenuStats> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kpadding),
        child: InkWell(
          hoverColor: Colors.transparent,
          onHover: (v) {
            setState(() {
              onHover = v;
            });
          },
          onTap: widget.fun,
          child: Text(
            widget.title,
            style: GoogleFonts.fruktur(
              color: Colors.white,
              fontWeight:
                  onHover ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ));
  }
}
