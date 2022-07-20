// ignore_for_file: prefer_const_constructors, prefer_initializing_formals, unnecessary_this, prefer_final_fields, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/items.dart';
import 'package:flutter_application_1/Licht/LichtOverview.dart';
import 'package:flutter_application_1/Parlplatz/Parkplatzwiedget.dart';
import 'package:flutter_application_1/Rooms/RoomInfo.dart';

import 'package:flutter_application_1/Smartflowr/Smartflowr.dart';

var homeItems = Items();
var gridList = Items().list;

class Parts extends StatelessWidget {
  Parts({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double cardWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double cardHeight = cardWidth * 1.3;
    return ResponsiveWidget.isSmallScreen(context)
        ? SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 30),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: List.generate(gridList.length,
                      (index) => buildGridChild(context, index, cardHeight)),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(gridList.length).map(
                  (int pageIndex) => Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 1,
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: screenSize.width / 6,
                            width: screenSize.width / 5,
                            child: Ink.image(
                              height: cardHeight / 2,
                              image: AssetImage(
                                gridList[pageIndex].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6, 16, 6, 4),
                            child: FittedBox(
                              child: Row(children: [
                                Container(
                                    child:
                                        buildIconForItem(gridList[pageIndex])),
                                SizedBox(width: 4),
                                Text(
                                  gridList[pageIndex].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        switch (gridList[pageIndex].name) {
                          case "SmartFlower":
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SmartFlowerOverview()));
                            }
                            break;
                          case "Außenbeleuchtung":
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LichtOverview()));
                            }
                            break;
                          case "Parken":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParkingOverview()));

                            break;
                          case "Räume":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoomInfo(
                                          screenSize: screenSize,
                                        )));

                            break;
                          default:
                            return null;
                        }
                        //    Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        //  builder: (context) => getRoute(gridList[index].name)));
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
  // ignore: constant_identifier_names

  dynamic buildGridChild(BuildContext context, int index, double cardHeight) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(
              height: cardHeight / 1.7,
              image: AssetImage(
                gridList[index].image,
              ),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 20, 7, 6),
              child: FittedBox(
                child: Row(children: [
                  Container(child: buildIconForItem(gridList[index])),
                  SizedBox(width: 4),
                  Text(
                    gridList[index].name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
          ],
        ),
        onTap: () {
          switch (gridList[index].name) {
            case "SmartFlower":
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SmartFlowerOverview()));
              }
              break;
            case "Außenbeleuchtung":
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LichtOverview()));
              }
              break;
            case "Parken":
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParkingOverview()));

              break;
            case "Räume":
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoomInfo(
                            screenSize: screenSize,
                          )));

              break;
            default:
              return null;
          }

          //   Navigator.push(
          //     context,
          //   MaterialPageRoute(
          //      builder: (context) => getRoute(gridList[index].name)));
        },
      ),
    );
  }
}

Icon? buildIconForItem(Item item) {
  var _Size = 22.0;
  switch (item.name) {
    case "SmartFlower":
      {
        return Icon(
          Icons.wb_sunny_rounded,
          color: kPrimaryColor.withOpacity(0.8),
          size: _Size,
        );
      }
    case "Außenbeleuchtung":
      {
        return Icon(
          Icons.lightbulb,
          color: kPrimaryColor.withOpacity(0.8),
          size: _Size,
        );
      }
    case "Parken":
      {
        return Icon(
          Icons.local_parking_rounded,
          color: kPrimaryColor.withOpacity(0.8),
          size: _Size,
        );
      }
    case "Räume":
      {
        return Icon(
          Icons.meeting_room_rounded,
          color: kPrimaryColor.withOpacity(0.8),
          size: _Size,
        );
      }
    default:
      return null;
  }
}
