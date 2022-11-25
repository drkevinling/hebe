import 'package:flutter/material.dart';
import 'package:hebe/constants/images/images.dart';
import 'package:hebe/testwidgets/floating_access_bar.dart';

class TestLargeMain extends StatelessWidget {
  const TestLargeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final itemKey = GlobalKey();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("that's ok"),
            floating: false,
            actions: [
              const FloatingAppBar(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc_outlined))
            ],
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(mainImage),
                  Container(
                    key: itemKey,
                    height: 400,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
