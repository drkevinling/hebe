import 'package:flutter/material.dart';

import 'package:hebe/constants/images/images.dart';
import 'package:hebe/screens/widgets/appbar.dart';

class LargeMainScreen extends StatelessWidget {
  const LargeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Container(
                child: SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.asset(mainImage),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          color: Colors.white,
                          child: const Text(
                            "work in progress",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 30),
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: double.infinity,
                        height: 500,
                        color: Colors.white),
                  )
                ]),
          )
        ]),
      ),
      floatingActionButton:
          FloatingActionButton.large(onPressed: () {}),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        elevation: 10,
      ),
    );
  }
}
