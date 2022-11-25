import 'package:flutter/material.dart';

class CenterMenuBar extends StatefulWidget {
  const CenterMenuBar({Key? key}) : super(key: key);

  @override
  State<CenterMenuBar> createState() => _CenterMenuBarState();
}

int _selectedIndex = 0;
int _hoverIndex = 0;

List<String> _menuItems = [
  "clinic",
  "treatment",
  "botox",
  "filler",
  "peeling"
];

class _CenterMenuBarState extends State<CenterMenuBar> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 3),
        color: Colors.amber,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("Test Button")),
              ...List.generate(
                  _menuItems.length,
                  (index) => Row(
                        children: [
                          InkWell(
                            onTap: (() {
                              setState(() {
                                _selectedIndex = index;
                              });
                            }),
                            onHover: (value) {
                              setState(() {
                                if (value) {
                                  _hoverIndex = index;
                                } else {
                                  _hoverIndex = _selectedIndex;
                                }
                              });
                            },
                            child: SizedBox(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _menuItems[index],
                                style: TextStyle(
                                    fontSize: _hoverIndex == index
                                        ? 20
                                        : 15,
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                            )),
                          ),
                          SizedBox(
                            width: index < _menuItems.length - 1
                                ? 10
                                : 0,
                            height: index < _menuItems.length - 1
                                ? 30
                                : 0,
                            child: const VerticalDivider(
                              width: 10,
                              thickness: 5,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )),
            ]),
      ),
    );
  }
}
