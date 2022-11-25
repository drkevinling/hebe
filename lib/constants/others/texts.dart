import 'package:flutter/material.dart';
import 'package:hebe/constants/colors/colors.dart';

const hebeExplain =
    "Hebe in ancient Greek religion and mythology,\n is the goddess of youth or the prime of life[1]\n (Roman equivalent: Juventas).[2] She is the\n beautiful daughter of Zeus and his wife, Hera.[3] Hebe was the cupbearer \n for the gods and goddesses of Mount Olympus, ";
const contact = "+959 977747333";

class TextWidgets {
  static Widget hebeExplain(BuildContext context) => RichText(
          text: TextSpan(
              style: const TextStyle(fontSize: 28),
              children: [
            const TextSpan(
                text: "HEBE is an Greek goddess of Youth\n\n"),
            TextSpan(
                text: "ဟီဘီ - ငယ်ရွယ်နုပျိုမှု ဂရိနတ်ဘုရားမ",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: appBarColor1))
          ]));
}
