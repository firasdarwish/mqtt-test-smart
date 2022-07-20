// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: const Color(0xffdff7ef),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
