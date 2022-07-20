// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, file_names, duplicate_ignore, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  // ignore: use_key_in_widget_constructors
  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: Container(
        // color: Colors.white.withOpacity(widget.opacity),
        color: kPrimaryColor,
        //color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 18,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/s11.png',
                          fit: BoxFit.contain,
                          //height: screenSize.height / 10,
                          //   width: screenSize.width / 10,
                          width: 300,
                          height: 60,
                        ),
                      ],
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Home Page',
                            style: TextStyle(
                                color: _isHovering[0]
                                    ? kisHovering
                                    : knotisHovering,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: kisHovering,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                                color: _isHovering[1]
                                    ? kisHovering
                                    : knotisHovering,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: kisHovering,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 15),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Kontakt',
                            style: TextStyle(
                                color: _isHovering[2]
                                    ? kisHovering
                                    : knotisHovering,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: kisHovering,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 15),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'English',
                            style: TextStyle(
                                color: _isHovering[3]
                                    ? kisHovering
                                    : knotisHovering,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: kisHovering,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
