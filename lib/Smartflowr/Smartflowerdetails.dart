// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, file_names, prefer_initializing_formals, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Titelwidget.dart';

import 'package:flutter_application_1/Smartflowr/GaugeWidget.dart';

import '../Farbe.dart';

class SmartFlowerdetails extends StatelessWidget {
  SmartFlowerdetails({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  String s = "ss";
  @override
  Widget build(BuildContext context) {
    double cardWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double cardHeight = cardWidth * 1.3;
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TitelWidget(text: 'Smart Flower'),
              SizedBox(height: 10),
              Column(
                children: [
                  SmartFlowerLeistung(),
                  buildEnergy(),
                  buildjahre(),
                  buildETotalCard(),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.06,
                    left: screenSize.width / 15,
                    right: screenSize.width / 15,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [])),
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TitelWidget(text: 'SmartFlower'),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: screenSize.width / 3.5,
                          width: screenSize.width / 3,
                          child: Ink.image(
                            height: cardHeight / 2,
                            image: AssetImage(
                              'assets/Flower2.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SmartFlowerLeistung(),
                    ],
                  ),
                  Row(
                    children: [
                      buildEnergy(),
                      buildjahre(),
                      buildETotalCard(),
                    ],
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.06,
                    left: screenSize.width / 15,
                    right: screenSize.width / 15,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [])),
            ],
          );
  }
}

dynamic SmartFlowerLeistung() {
  double _Value = 1560;
  int Prozentwert = 15;
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Column(children: [
        Container(
          height: 45,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Center(
              child: Text(
                "AKTUELLE LEISTUNG",
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        GaugeWidget(),
        Divider(
          indent: 16,
          endIndent: 16,
          height: 0,
          thickness: 1.5,
        ),
        Padding(
            padding: EdgeInsets.all(16),
            child: Text("Auslastung: $Prozentwert %",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)))
      ]),
    ),
  );
}

dynamic buildEnergy() {
  return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Center(
                  child: Text(
                    "ENERGIEBILANZ HEUTE",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                " kWh",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ));
}

dynamic buildjahre() {
  return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Center(
                  child: Text(
                    "Energiebilanz Jahr",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                " kWh",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ));
}

dynamic buildETotalCard() {
  return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Center(
                  child: Text(
                    "Energiebilanz Total",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                " kWh",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ));
}
