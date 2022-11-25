import 'package:flutter/material.dart';
import 'package:hebe/constants/images/images.dart';
import 'package:hebe/constants/others/keys.dart';
import 'package:hebe/constants/others/texts.dart';
import 'package:hebe/widgets/carouselslider.dart';
import 'package:hebe/widgets/center_menu_widgets.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            // context.read<MenucontrollerCubit>().initFor();
          },
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.2,
                          image: AssetImage(
                            greekBackground5,
                          ))),
                  width: width,
                  height: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Card(
                              margin: const EdgeInsets.all(10),
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20)),
                              elevation: 20,
                              child: Image.asset(
                                hebeHorizontal,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              TextWidgets.hebeExplain(context)
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                width: width,
                height: width * 0.3,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 245, 240)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Colors.black,
                                blurRadius: 15),
                            BoxShadow(
                                offset: Offset(-5, -5),
                                color: Colors.white,
                                blurRadius: 15)
                          ],
                        ),
                        child: Image.asset(
                          room2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Text(hebeExplain,
                        style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    image: const DecorationImage(
                        opacity: 0.2,
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                        image: AssetImage(greekBackground8))),
              ),
              Container(
                width: width,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 245, 240)),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: PhysicalModel(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)),
                        elevation: 10,
                        clipBehavior: Clip.antiAlias,
                        shape: BoxShape.rectangle,
                        color: Colors.red,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                hebeHorizontal,
                              )),
                        ),
                      ),
                    ),
                    const AnimatedTPA()
                  ],
                ),
              ),
              Container(
                width: width,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 92, 200, 92)),
              ),
              Container(
                  width: width,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 245, 240)),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: const CenterMenuBar(),
                      ),
                    ],
                  )),
              Container(
                key: testKey,
                width: width,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 245, 240)),
              ),
              MyCarouselSlider(width: width),
              AspectRatio(
                aspectRatio: 16 / 2,
                child: Container(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedTPA extends StatefulWidget {
  const AnimatedTPA({Key? key}) : super(key: key);

  @override
  State<AnimatedTPA> createState() => AnimatedTPAState();
}

class AnimatedTPAState extends State<AnimatedTPA> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        height: isActive ? 200 : 100,
        width: isActive ? 200 : 100,
        color: Colors.red,
      ),
    );
  }
}
