import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kmdha/constant/img_constants.dart';

class LoginCrousel extends StatefulWidget {
  const LoginCrousel({super.key});

  @override
  State<LoginCrousel> createState() => _LoginCrouselState();
}

class _LoginCrouselState extends State<LoginCrousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 350.0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            autoPlayCurve: Curves.linear,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update _currentIndex
              });
            },
          ),
          items: [
            Image.asset(
              loginImage1,
              fit: BoxFit.cover,
            ),
            Image.asset(
              loginImage2,
              fit: BoxFit.cover,
            ),
            Image.asset(
              loginImage3,
              fit: BoxFit.cover,
            ),
          ].map((item) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: item,
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex
                      ? Colors.blue.withOpacity(0.8)
                      : Colors.white.withOpacity(0.8),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
