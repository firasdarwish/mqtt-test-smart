// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';

class Features extends StatelessWidget {
  const Features({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height / 60,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Funktionen',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263b5e)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Aktuell verfügbar',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                      ),
                    )
                  ],
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Funktionen',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263b5e)),
                ),
                Expanded(
                  child: Text(
                    'Aktuell verfügbar',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
