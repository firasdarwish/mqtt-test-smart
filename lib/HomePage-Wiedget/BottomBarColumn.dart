// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: kDrawerkleinTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            s1,
            style: TextStyle(
              color: kDrawerkleinTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            s2,
            style: TextStyle(
              color: kDrawerkleinTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            s3,
            style: TextStyle(
              color: kDrawerkleinTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
