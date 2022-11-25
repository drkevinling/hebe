import 'package:flutter/material.dart';

List<String> treatmentList = [
  "Peeling",
  "Masks",
  "Infusion",
  "Botox",
  "Filler",
  "Meso",
  "Thread"
];

class TreatmentListTile extends StatefulWidget {
  const TreatmentListTile({Key? key, required this.treatmentName})
      : super(key: key);

  final String treatmentName;

  @override
  State<TreatmentListTile> createState() => _TreatmentListTileState();
}

class _TreatmentListTileState extends State<TreatmentListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: MouseRegion(
            child: AnimatedContainer(
              height: 50,
              width: 200,
              duration: const Duration(seconds: 3),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.treatmentName,
                          style:
                              Theme.of(context).textTheme.headline3,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 180,
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
