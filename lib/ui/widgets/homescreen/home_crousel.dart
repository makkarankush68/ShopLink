import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constant/img_constants.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            // height: 220,
            aspectRatio: 2,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.82,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update _currentIndex
              });
            },
          ),
          items: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  homeCr1,
                  fit: BoxFit.fill,
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  homeCr2,
                  fit: BoxFit.fill,
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  homeCr3,
                  fit: BoxFit.fill,
                )),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  homeCr4,
                  fit: BoxFit.fill,
                )),
          ].map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: item,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentIndex
                    ? Colors.blue.withOpacity(0.9)
                    : Colors.grey.withOpacity(0.8),
              ),
            );
          }),
        ),
      ],
    );
  }
}
