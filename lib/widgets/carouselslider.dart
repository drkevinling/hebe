import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/images/images.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 300,
      decoration: const BoxDecoration(color: Colors.white30),
      child: CarouselSlider.builder(
          itemCount: carouselImages.length,
          itemBuilder: (context, index, realindex) {
            var image = carouselImages[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
              viewportFraction: 0.2,
              aspectRatio: 18 / 8,
              reverse: false,
              autoPlay: false,
              height: 300,
              enlargeCenterPage: true,
              pageSnapping: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayInterval: const Duration(seconds: 5))),
    );
  }
}
