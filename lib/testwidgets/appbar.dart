import 'package:flutter/material.dart';
import 'package:hebe/constants/images/images.dart';
import 'package:hebe/screens/widgets/top_bar.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 50,
      backgroundColor: const Color.fromARGB(255, 15, 69, 89),
      leading: const LeadingWid(),
      title: const AppbarTitle(),
      actions: appbarActions(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  List<Widget> appbarActions() => [
        Flexible(
          child: Center(
            child: MenuStats(title: "Home", fun: () {}),
          ),
        ),
      ];
}

class LeadingWid extends StatelessWidget {
  const LeadingWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Image.asset(
        hebeYoungGirl,
        // width: 45,
        // height: 45,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxHeight: kToolbarHeight, minWidth: 800),
      child: Row(children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "HEBE",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Medical Aesthetic Center",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
