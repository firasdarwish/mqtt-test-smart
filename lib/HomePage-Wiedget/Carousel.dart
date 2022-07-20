// ignore_for_file: prefer_const_constructors, prefer_final_fields, file_names, unused_field, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';

class MainCarousel extends StatefulWidget {
  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  // final String imagePath = 'assets/images/';
// ignore: missing_required_param

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/Flower1.jpg',
    'assets/Außenbeleuchtung1.jpg',
    'assets/ParkPlatz.jpg',
    'assets/elektroauto aufladen.jpg',
    'assets/Eingang1.jpg'
  ];

  final List<String> places = [
    'Flower',
    'Außenbeleuchtung',
    'ParkPlatz für Besucher',
    'Elektroauto aufladen',
    'Eingang',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 16 / 8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                for (int i = 0; i < imageSliders.length; i++) {
                  if (i == index) {
                    _isSelected[i] = true;
                  } else {
                    _isSelected[i] = false;
                  }
                }
              });
            }),
        carouselController: _controller,
      ),
      AspectRatio(
        aspectRatio: 16 / 8,
        child: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 50,
                color: kDrawerTextColor,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
