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

class MitarbeiterPark extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MitarbeiterParkState();
}

class _MitarbeiterParkState extends State {
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
              backgroundColor: kPrimaryColor,
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
              TitelWidget(text: 'Mitarbeiter Parkplatz'),
              buildMitarbeiterParkInfoCard(screenSize, context),
              Row(
                children: [
                  buildMitarbeiterParkPlatzInfoCard(screenSize, context),
                  buildMitarbeiterParkPlatzInfoCard1(screenSize, context),
                  buildMitarbeiterParkPlatzInfoCard2(screenSize, context),
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
}

dynamic buildMitarbeiterParkInfoCard(Size screenSize, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: screenSize.height / 1.5,
      width: screenSize.width / 1.1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: Image(
          image: AssetImage('parkdesgin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

dynamic buildMitarbeiterParkPlatzInfoCard(
    Size screenSize, BuildContext context) {
  List<ParkingSlot> slotItemsP1 = [];
  for (int i = 1; i < 14; i++)
    slotItemsP1.add(ParkingSlot('$i', 'frei', ' E-mitLadestation'));

  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
    child: SizedBox(
        height: screenSize.height,
        width: screenSize.width / 4,
        child: Column(
          children: [
            ...Iterable<int>.generate(slotItemsP1.length).map(
              (int pageIndex) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
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

dynamic buildMitarbeiterParkPlatzInfoCard1(
    Size screenSize, BuildContext context) {
  List<ParkingSlot> slotItemsP1 = [];
  for (int i = 14; i < 27; i++)
    slotItemsP1.add(ParkingSlot('$i', 'Frei', 'mit E-Ladestation'));

  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
    child: Container(
      child: SizedBox(
          height: screenSize.height,
          width: screenSize.width / 4,
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
    ),
  );
}

dynamic buildMitarbeiterParkPlatzInfoCard2(
    Size screenSize, BuildContext context) {
  List<ParkingSlot> slotItemsP1 = [];
  for (int i = 27; i < 35; i++)
    slotItemsP1.add(ParkingSlot('$i', 'frei', 'mit E-Ladestation'));

  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
    child: SizedBox(
        height: screenSize.height,
        width: screenSize.width / 3.5,
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
