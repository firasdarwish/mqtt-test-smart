// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';

class InfoText extends StatelessWidget {
  String type;
  String text;

  InfoText({required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.blueGrey[200],
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: kDrawerkleinTextColor,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
