import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselEachProduct extends StatelessWidget {
  final List image;
  const CarouselEachProduct(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 300,
        child: CarouselSlider(
            items: [
              for (var i = 0; i < image.length; i++) Image.network(image[i]),
            ],
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )));
  }
}
