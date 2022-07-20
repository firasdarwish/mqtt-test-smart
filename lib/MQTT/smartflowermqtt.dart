// ignore_for_file: unnecessary_this, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';

enum MsgType { powerGauge, eDayChart, unknown }

extension ParseToString on MsgType {
  String getString() {
    return this.toString().split('.').last;
  }
}

class SmartFlowerDataState with ChangeNotifier {
  int currentPower = 0;
  int inverterLoad = 0;
  double eDay = 0.0;
  double eYear = 0.0;
  double eTotal = 0.0;
  final int maxPower = 3000;
  late List<ChartItem> powerSeries;

  void setReceivedMsg(String topic, String msg) {
    Map<String, dynamic> json = jsonDecode(msg);
    print(json['msgType']);

    if (json['msgType'] == MsgType.powerGauge.getString()) {
      _setGaugeData(json);
    } else if (json['msgType'] == MsgType.eDayChart.getString()) {
      _setEDayChart(json);
    } else {
      print("ParkingDataState: Unknown MsgType");
    }
  }

  void _setGaugeData(Map<String, dynamic> json) {
    currentPower = json['currentPower'];
    print("SmartFlowerData: Current Power is $currentPower W}");
    inverterLoad = json['inverterLoad'].toInt();
    eDay = json['eDay'];
    eYear = json['eYear'];
    eTotal = json['eTotal'];
    notifyListeners();
  }

  void _setEDayChart(Map<String, dynamic> json) {
    var listJson = json['values'] as List;
    print(listJson);
    powerSeries = listJson.map((item) => ChartItem.fromJson(item)).toList();
    print("SmartFlowerData: $powerSeries");
    notifyListeners();
  }
}

class ChartItem {
  final DateTime hour;
  final int power;

  ChartItem(this.hour, this.power);

  factory ChartItem.fromJson(dynamic json) {
    return ChartItem(DateTime.parse(json['timestamp']), json['value'] as int);
  }

  @override
  String toString() {
    return '{ ${this.hour}, ${this.power} }';
  }
}
