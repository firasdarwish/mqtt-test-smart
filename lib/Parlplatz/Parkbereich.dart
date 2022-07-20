// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, file_names, prefer_initializing_formals, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_returning_null_for_void

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/Parlplatz/Besucherpark.dart';
import 'package:flutter_application_1/Parlplatz/Mitarbeiterpark.dart';

class Parkbereich extends StatelessWidget {
  Parkbereich({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final List<String> ParkImage = [
    'assets/ParkPBesucher.jpg',
    'assets/ParkPmitarbeiter.jpg',
  ];
  final List<String> ParkNames = [
    'ParkPlatz für Besucher',
    'ParkPlatz für Mitarbeiter',
  ];
  @override
  Widget build(BuildContext context) {
    double cardWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double cardHeight = cardWidth * 1.3;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            alignment: Alignment.center,
            child: AutoSizeText(
              'Auf dem Besucherparkplatz gibt es 13 Stellplätze inklusive 4 Stellplätze zum Aufladen von Elektroautos, und auf dem Mitarbeiterparkplatz 34 Stellplätze.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              maxLines: 3,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: screenSize.width / 15,
            right: screenSize.width / 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...Iterable<int>.generate(ParkImage.length).map(
                (int pageIndex) => Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 1,
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: screenSize.width / 3,
                          width: screenSize.width / 2.5,
                          child: Ink.image(
                            height: cardHeight / 2,
                            image: AssetImage(
                              ParkImage[pageIndex],
                            ),
                            fit: BoxFit.cover,
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
                                ParkNames[pageIndex],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      switch (ParkNames[pageIndex]) {
                        case "ParkPlatz für Besucher":
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BesucherPark()));
                          }
                          break;
                        case "ParkPlatz für Mitarbeiter":
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MitarbeiterPark()));
                          }
                          break;

                        default:
                          return null;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
