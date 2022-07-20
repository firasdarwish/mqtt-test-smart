// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, file_names, prefer_initializing_formals, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, camel_case_types, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Titelwidget.dart';
import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';
import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';
import 'package:flutter_application_1/Rooms/Room.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoomInfo extends StatefulWidget {
  final Size screenSize;

  const RoomInfo({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  State<RoomInfo> createState() => _RoomInfoState();
}

Room room =
    Room(roomname: "room Name", temp: 37, co2: 10, humidity: 0120, light: 1110);

double _scrollPosition = 0;
// ignore: unused_field
double _opacity = 0;

class _RoomInfoState extends State<RoomInfo> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    double cardWidth = (MediaQuery.of(context).size.width - 40) / 2;
    double cardHeight = cardWidth * 1.3;
    return Scaffold(
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
      body: ResponsiveWidget.isSmallScreen(context)
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitelWidget(text: "Room"),
                    buildRoomInfoCard(room),
                    buildRoomInfoCard(room),
                    buildRoomInfoCard(room),
                    SizedBox(
                      height: screenSize.height / 2.5,
                    ),
                    BottomBar(),
                  ],
                ),
              ),
            )
          : ResponsiveWidget.isMediumScreen(context)
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TitelWidget(text: "Room"),
                        buildRoomInfoCard(room),
                        buildRoomInfoCard(room),
                        buildRoomInfoCard(room),
                        SizedBox(
                          height: screenSize.height / 2.5,
                        ),
                        BottomBar(),
                      ],
                    ),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TitelWidget(text: "Room"),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: buildRoomInfoCard(room),
                            ),
                            Expanded(
                              child: buildRoomInfoCard(room),
                            ),
                            Expanded(
                              child: buildRoomInfoCard(room),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 2.5,
                        ),
                        BottomBar(),
                      ],
                    ),
                  ),
                ),
    );
  }
}

dynamic buildRoomInfoCard(Room room1) {
  return Padding(
      padding: EdgeInsets.all(20),
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
                    "${room1.roomname}",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.thermostat_rounded,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                  minLeadingWidth: 0,
                  title: AutoSizeText(
                    "Temperatur",
                    maxLines: 1,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 16, 0),
                    child: Text(
                      (room1.temp == null) ? "-" : "${room1.temp} C°",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Divider(
                    height: 0,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    MdiIcons.moleculeCo2,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                  minLeadingWidth: 0,
                  title: AutoSizeText(
                    "CO2-Gehalt",
                    maxLines: 1,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 16, 0),
                    child: Text(
                      (room1.co2 == null) ? "-" : "${room1.co2} ppm",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Divider(
                    height: 0,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    MdiIcons.waterPercent,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                  minLeadingWidth: 0,
                  title: AutoSizeText(
                    "Luftfeuchtigkeit",
                    maxLines: 1,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 16, 0),
                    child: Text(
                      (room1.humidity == null) ? "-" : "${room1.humidity} %",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Divider(
                    height: 0,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    MdiIcons.brightness6,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                  minLeadingWidth: 0,
                  title: AutoSizeText(
                    "Raumhelligkeit",
                    maxLines: 2,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 16, 0),
                    child: Text(
                      (room1.light == null) ? "-" : "${room1.light} lux",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Divider(
                    height: 0,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
