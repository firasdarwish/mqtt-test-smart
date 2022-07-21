// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names, unused_field, prefer_final_fields, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';

import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';

import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';

import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';
import 'package:flutter_application_1/MQTT/MqttManger.dart';

import 'package:flutter_application_1/MQTT/smartflowermqtt.dart';
import 'package:flutter_application_1/Smartflowr/Smartflowerdetails.dart';
import 'package:flutter_application_1/live_info.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SmartFlowerOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SmartFlowerOverviewState();
}

class _SmartFlowerOverviewState extends State {
  // MUST START WITH ws://  OR  wss://
  final _host = 'ws://mqtt.flespi.io';

  final _port = 80;

  final _clientId = 'mqtt-board-659d41d0';

  final _username =
      'FlespiToken 9Bj1sF2Jd2GuM3iWDtWtin1xb5YvdgWbH50ZySwAI0SlTY5mfSDl5uI4ouprAaq7';

  final _password = '';

  final _topic = 'my/topic';

  late MQTTManager mqttManager;
  LiveInfo liveInfo = Get.put(LiveInfo());

  void onNewData(String data) {
    try {
      // decode incoming data (JSON)
      var dataMap = jsonDecode(data);
      num? currentPerformance = dataMap['current_performance'];

      if (currentPerformance != null) {
        // set new value for 'current_performance'
        // and refresh the UI to display the new data.
        liveInfo.setCurrentPerformance(currentPerformance);
        setState(() {});
      }
    } catch (e) {
      print("error: couldnt jsonDecode incoming msg: $e");
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    mqttManager = MQTTManager(host: _host, port: _port, clientId: _clientId);

    mqttManager.connectAndSub(_username, _password, _topic, onNewData);

    super.initState();
  }

  @override
  void dispose() {
    /** NOT REQUIRED, BUT RECOMMENDED FOR GOOD PERFORMANCE **/
    mqttManager.disconnect();

    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              title: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    'assets/Logo2.png',
                    fit: BoxFit.fill,
                    width: screenSize.width / 2.5,
                    height: screenSize.height / 12,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 80),
              child: TopBarContents(_opacity),
            ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*      Text('"Auslastung:  ${smartFlowerDataState1.inverterLoad} %'),
                Text(
                 '"Auslastung:   ${smartFlowerDataState1.eDay.toStringAsFixed(1)} %'), */
              SmartFlowerdetails(screenSize: screenSize),
              SizedBox(
                height: screenSize.height / 25,
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
