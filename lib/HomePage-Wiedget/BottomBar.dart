// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBarColumn.dart';
import 'package:flutter_application_1/HomePage-Wiedget/InfoBar.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        gradient: LinearGradient(
            colors: [kinfobarfirstColor, kinfobarscandColor],
            begin: const FractionalOffset(0.6, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(
                      type: 'Email',
                      text: 'mms-shaheen@live.com',
                    ),
                    SizedBox(height: 5),
                    InfoText(
                      type: 'Address',
                      text: 'Campusallee 1, 32657 Lemgo',
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: kDrawerkleinTextColor,
                ),
                Text(
                  'Copyright © 2022 | Fraunhofer',
                  style: TextStyle(
                    color: kDrawerTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'Facebook',
                      s1: 'YouTube',
                      s2: 'Twitter',
                      s3: 'Datenschutzerklärung',
                    ),
                    Container(
                      color: kDrawerkleinTextColor,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'mms-shaheen@live.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'Campusallee 1, 32657 Lemgo',
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: kDrawerkleinTextColor,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2022 | Fraunhofer',
                  style: TextStyle(
                    color: kDrawerTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
