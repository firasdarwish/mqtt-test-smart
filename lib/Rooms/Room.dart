// ignore_for_file: prefer_initializing_formals, unused_import, file_names

import 'package:flutter/cupertino.dart';

class Room {
  final String roomname;
  final int co2;
  final num temp;
  final int humidity;
  final int light;

  Room({
    required String roomname,
    required int co2,
    required num temp,
    required int humidity,
    required int light,
  })  : roomname = roomname,
        co2 = co2,
        temp = temp,
        humidity = humidity,
        light = light;

  Room.fromJson(Map<String, dynamic> json)
      : roomname = json['roomname'],
        co2 = json['co2'] as int,
        temp = json['temp'] as num,
        humidity = json['humidity'] as int,
        light = json['light'] as int;
}
