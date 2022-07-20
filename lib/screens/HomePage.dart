// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Carousel.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Features.dart';
import 'package:flutter_application_1/HomePage-Wiedget/FloatingAccesBar.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';
import 'package:flutter_application_1/HomePage-Wiedget/featured_tiles.dart';
import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  // ignore: unused_field
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      // backgroundColor: Color.fromARGB(52, 198, 233, 194),
      backgroundColor: kBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              //  backgroundColor: Color.fromARGB(255, 131, 160, 144),
              backgroundColor: kPrimaryColor,
              // backgroundColor: Colors.white.withOpacity(_opacity),
              title: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    'assets/Logo2.png',
                    fit: BoxFit.fill,
                    width: screenSize.width / 2.5,
                    height: screenSize.height / 12,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 80),
              child: TopBarContents(_opacity),
            ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.height / 80,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.8,
                        child: Image.asset(
                          'assets/Background.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 50,
                    ),
                    FloatingAccessBar(screenSize: screenSize),
                    Features(screenSize: screenSize),
                    Parts(screenSize: screenSize),
                    SizedBox(
                      height: screenSize.height / 50,
                    ),
                    MainCarousel(),
                    SizedBox(
                      height: screenSize.height / 25,
                    ),
                    BottomBar()
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
