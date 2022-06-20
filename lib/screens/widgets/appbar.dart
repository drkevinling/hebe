import 'package:flutter/material.dart';
import 'package:hebe/routes/routes.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 50,
      backgroundColor: const Color.fromARGB(255, 15, 69, 89),
      actions: <Widget>[
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.airplanemode_inactive,
              color: Colors.black,
            )),
        const Spacer(),
        const Spacer()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
