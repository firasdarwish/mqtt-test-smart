// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';

class TitelWidget extends StatelessWidget {
  const TitelWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kSecondaryColor, kPrimaryColor],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ]),
          child: Center(
            child: AutoSizeText(
              'Aktuelle $text -Details',
              style: TextStyle(fontSize: 24),
              maxLines: 1,
            ),
          ),
        ),
      ),
    ));
  }
}
