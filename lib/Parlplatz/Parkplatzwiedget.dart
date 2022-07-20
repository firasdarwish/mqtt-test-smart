// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';

import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Titelwidget.dart';
import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';

import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';
import 'package:flutter_application_1/Parlplatz/Parkbereich.dart';

class ParkingOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParkingOverviewState();
}

class _ParkingOverviewState extends State {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0;
  double _scrollPosition = 0;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitelWidget(text: 'Park Bereich'),
              Parkbereich(screenSize: screenSize),
              SizedBox(
                height: screenSize.height / 25,
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
