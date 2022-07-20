// ignore_for_file: file_names, prefer_final_fields, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Responsive.dart';

class FloatingAccessBar extends StatefulWidget {
  const FloatingAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  // ignore: library_private_types_in_public_api
  _FloatingAccessBarState createState() => _FloatingAccessBarState();
}

class _FloatingAccessBarState extends State<FloatingAccessBar> {
  List _isHovering = [false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Location', 'Kontakt', 'E-Bikes'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.people,
    Icons.electric_scooter_outlined,
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: widget.screenSize.width < 800
            ? Column(
                children: [
                  for (int i = 0; i < items.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: widget.screenSize.height / 40),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.width / 40,
                              bottom: widget.screenSize.width / 40,
                              left: widget.screenSize.width / 30),
                          child: Row(
                            children: [
                              Icon(
                                icons[i],
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: widget.screenSize.width / 50,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? _isHovering[i] = true
                                        : _isHovering[i] = false;
                                  });
                                },
                                onTap: () {},
                                child: Text(
                                  items[i],
                                  style: TextStyle(
                                    color: _isHovering[i]
                                        ? Colors.blueGrey[900]
                                        : Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: this.widget.screenSize.height / 50,
                      bottom: this.widget.screenSize.height / 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: generateRowElements()),
                ),
              ),
      ),
    );
  }
}
