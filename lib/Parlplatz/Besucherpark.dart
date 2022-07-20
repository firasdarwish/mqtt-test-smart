// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names, unused_local_variable, unnecessary_string_interpolations, curly_braces_in_flow_control_structures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';

import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Titelwidget.dart';
import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';

import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';
import 'package:flutter_application_1/Parlplatz/Parkslot.dart';

class BesucherPark extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BesucherParkState();
}

class _BesucherParkState extends State {
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

  List<ParkingSlot> slotItemsP1 = [];
  @override
  Widget build(BuildContext context) {
    for (int i = 1; i < 14; i++)
      slotItemsP1.add(ParkingSlot('$i', 'frei', 'mit E-Ladestation'));
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
              TitelWidget(text: 'Besucher Parkplatz'),
              Row(
                children: [
                  buildBesucherParkPlatzInfoCard(screenSize, context),
                  SizedBox(
                    height: screenSize.height / 25,
                  ),
                  buildBesucherParkInfoCard(screenSize, context),
                ],
              ),
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

  dynamic buildBesucherParkPlatzInfoCard(
      Size screenSize, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 100, top: 10),
      child: SizedBox(
          height: screenSize.height / 1.05,
          width: screenSize.width / 6,
          child: Column(
            children: [
              ...Iterable<int>.generate(slotItemsP1.length).map(
                (int pageIndex) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                                (slotItemsP1[pageIndex].info ==
                                        "mit E-Ladestation")
                                    ? Icons.electric_car_rounded
                                    : Icons.local_parking_rounded,
                                color: Colors.blue[700]),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "${slotItemsP1[pageIndex].name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                          child: AutoSizeText(
                            "${slotItemsP1[pageIndex].state}",
                            style: TextStyle(
                                color: (slotItemsP1[pageIndex].state == "Frei")
                                    ? Colors.red[900]
                                    : Colors.green[500],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2.0),
                      child: Divider(
                        color: Colors.blueGrey.shade400,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

dynamic buildBesucherParkInfoCard(Size screenSize, BuildContext context) {
  double cardWidth = (MediaQuery.of(context).size.width - 40) / 2;
  double cardHeight = cardWidth * 1.3;
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            height: screenSize.width / 2.3,
            width: screenSize.width / 1.7,
            child: Ink.image(
              height: cardHeight / 2,
              image: AssetImage('park2design.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6, 16, 6, 4),
          child: FittedBox(
            child: Row(children: [
              Container(
                  child: Icon(
                Icons.local_parking_rounded,
                color: kPrimaryColor.withOpacity(0.8),
                size: 22.0,
              )),
              SizedBox(width: 8),
              Text(
                'ParkPlatz für Besucher',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )
            ]),
          ),
        ),
      ],
    ),
  );
}
