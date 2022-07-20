// ignore_for_file: avoid_print, unnecessary_this, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Rooms/Room.dart';

enum MsgType { roomValues, unknown }

extension ParseToString on MsgType {
  String getString() {
    return this.toString().split('.').last;
  }
}

class RoomDataState with ChangeNotifier {
  Room room = Room(roomname: "", temp: 0, co2: 0, humidity: 0, light: 0);

  late String selectedRoom;

  List<String> Room_0 = ["Besprechungsraum 1"];
  List<String> Room_1 = ["Kreativraum"];
  List<String> Room_2 = ["MeetingPoint"];

  void setReceivedMsg(String topic, String msg) {
    Map<String, dynamic> json = jsonDecode(msg);
    if (json['msgType'] == MsgType.roomValues.getString()) {
      print("MQTTAppState: $json");
      setRoom(json);
    } else {
      print("MQTTAppState: Unknown MsgType");
    }
  }

  void setRoom(Map<String, dynamic> json) {
    room = Room.fromJson(json);
    notifyListeners();
  }
}
