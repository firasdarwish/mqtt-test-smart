// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names, unused_field, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Farbe.dart';
import 'package:flutter_application_1/HomePage-Wiedget/BottomBar.dart';

import 'package:flutter_application_1/HomePage-Wiedget/Responsive.dart';

import 'package:flutter_application_1/HomePage-Wiedget/TopBarContents.dart';

import 'package:flutter_application_1/HomePage-Wiedget/manu_drower.dart';
import 'package:flutter_application_1/MQTT/MqttManger.dart';

import 'package:flutter_application_1/MQTT/smartflowermqtt.dart';
import 'package:flutter_application_1/Smartflowr/Smartflowerdetails.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SmartFlowerOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SmartFlowerOverviewState();
}

class _SmartFlowerOverviewState extends State {
  String _identifier = '';
  String _host = 'mqtt.eclipse.org'; //192.102.154.75';

  int _port = 1883;
  MQTTManager manager = MQTTManager();
  late SmartFlowerDataState smartFlowerDataState;
  String _identifer = '';
  String borker = '';
  // late SmartFlowerDataState smartFlowerDataState1;

  String _subGaugeTopic = "app/SmartFlowerData/CurrentPower";
  String _subChartTopic = '';
  String _pubTopic = "app/getSmartFlowerData/EnergyBalance";
  String _respTopic = '';

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _identifer = manager.initIdentifier();
    print(_identifer);
    borker = manager.get_host('eu1.cloud.thethings.network');
    manager.get_port(1883);
    manager.initializeMQTTClient('elsys-co2-bms@ttn',
        'NNSXS.FVEBQTFJAUQ3WXISSIZL4PB5AYKG6BH6P55V6FY.ATRYMEXDHWVTJP24DGQAU2LXPL3UKYQ6ZET733A4KSY73U2AOKSA');
    print('mqtt broker is $borker');
    manager.connect();
    print('nach connect ');
    _subChartTopic = "app/SmartFlower/eDayChart/$_identifer";
    _respTopic = '{ "ResponseTopic":"$_identifer"}';

    //manager.subscribe(_subGaugeTopic, MqttQos.atLeastOnce);
    //manager.subscribe(_subChartTopic, MqttQos.atLeastOnce);

    // manager.publish(_pubTopic, _respTopic);

    super.initState();
  }

  @override
  void dispose() {
    //manager.unsubscribe(_subGaugeTopic);
    //manager.unsubscribe(_subChartTopic);

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
