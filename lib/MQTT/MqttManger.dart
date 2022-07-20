// ignore_for_file: prefer_final_fields, avoid_print, file_names, unused_field, unnecessary_null_comparison, curly_braces_in_flow_control_structures, deprecated_member_use, unused_local_variable, prefer_const_constructors, non_constant_identifier_names, unnecessary_this, prefer_typing_uninitialized_variables, unused_import, unused_element

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'package:uuid/uuid.dart';

/* 
class MQTTManager {
  // Private instance of client



  

  Future<MqttClient> connect() async {
    MqttServerClient client =
        MqttServerClient.withPort(_host, _identifier, _port);
    client.logging(on: true);

    client.port = _port;
    client.keepAlivePeriod = 20;

    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed as UnsubscribeCallback?;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier("flutter_client")
        .authenticateAs("test", "test")
        .keepAliveFor(60)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      print('Connecting');
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      print('EMQX client connected');
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        print(
            'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      });

      client.published!.listen((MqttPublishMessage message) {
        print('published');
        final payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print(
            'Published message: $payload to topic: ${message.variableHeader!.topicName}');
      });
    } else {
      print(
          'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    return client;
  }

  void onConnected() {
    print('Connected');
  }

  void onDisconnected() {
    print('Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

  void onSubscribeFail(String topic) {
    print('Failed to subscribe topic: $topic');
  }

  void onUnsubscribed(String topic) {
    print('Unsubscribed topic: $topic');
  }

  void pong() {
    print('Ping response client callback invoked');
  }
/* 
  Future<void> initializeMQTTClient(String _identifier) async {
    if (_identifier != null) {
      print("MQTTManger: InitMQTTClient with Identifier: $_identifier");
      _client = MqttServerClient.withPort(_host, _identifier, _port);
      _client.logging(on: true);
      _client.port = _port;
      _client.keepAlivePeriod = 20;
      _client.onConnected = onConnected;
      _client.onDisconnected = onDisconnected;
      _client.onUnsubscribed = onUnsubscribed as UnsubscribeCallback?;
      _client.onSubscribed = onSubscribed;
      _client.onSubscribeFail = onSubscribeFail;
      _client.pongCallback = pong;

      /// Add the successful connection callback
      // _client!.onConnected = onConnected;

      MqttConnectMessage connMess = MqttConnectMessage()
          .withClientIdentifier(_identifier)
          .keepAliveFor(30)
          .withWillTopic('willtopic')
          .withWillMessage('Will message')
          .startClean() // Non persistent session for testing
          .withWillQos(MqttQos.atLeastOnce);
      print('client  try to connecting....');
      _client.connectionMessage = connMess;
      try {
        print('Connecting');
        await _client.connect();
      } catch (e) {
        print('Exception: $e');
        _client.disconnect();
      }

      _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        print(
            'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      });
      _client.published?.listen((MqttPublishMessage message) {
        print('published');
        final payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print(
            'Published message: $payload to topic: ${message.variableHeader?.topicName}');
      });
    } else
      print('MQTTManager: UUID is a null Object');
  } */

  // Established connection to MQTT Broker
  /* void connect() async {
    assert(_client != null);
    try {
      print("MQTTManager: MQTT client start connecting ...");

      await _client.connect();
    } on Exception catch (e) {
      print("MQTTManager: Connection failed: ${e.toString()}");

      disconnect();
    }
  } */

/*   void publish(String topic, String msg) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello MQTT');
    _client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  } */
} */

class MQTTManager {
  static final MQTTManager _instance = MQTTManager._internal(state: null);
  factory MQTTManager() => _instance;
  MQTTManager._internal({@required dynamic state}) : _currentState = state;
  dynamic _currentState;
  bool isMQTTClientInitialized = false;
  String _identifier = '';
  String _host = 'eu1.cloud.thethings.network'; //192.102.154.75';

  int _port = 1883;

  String get_host(String _Borker) {
    this._host = _Borker;
    print(_host);
    return _host;
  }

  int get_port(int _port1) {
    this._port = _port1;
    return _port;
  }

  // Get UUID for the user
  String initIdentifier() {
    var uuid = Uuid();
    String _id;
    _id = uuid.v4();
    this._identifier = _id;
    print('iid ist on ordnung $_id');
    return _id;
  }

  MqttBrowserClient client = MqttBrowserClient.withPort(
      'eu1.cloud.thethings.network', 'flutter_client', 1883);
  get getIndentifier => _identifier;

  Future<MqttBrowserClient> initializeMQTTClient(
      [String? username, String? password]) async {
    client = MqttBrowserClient.withPort(_host, _identifier, _port);
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed as UnsubscribeCallback?;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    // client.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .keepAliveFor(60)
        .withClientIdentifier(_identifier)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;
    isMQTTClientInitialized = true;
    print('$isMQTTClientInitialized ssssssssssssss');
    // Established connection to MQTT Broker
    try {
      print("MQTTManager: MQTT client start connecting ...");
      await client.connect(username, password);
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final recMess = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('Received message:$payload from topic: ${c[0].topic}>');
    });

    return client;
  }

  // Established connection to MQTT Broker
  void connect([String? username, String? password]) async {
    assert(client != null);
    try {
      print("MQTTManager: MQTT client start connecting ...");

      await client.connect(username, password);
    } on Exception catch (e) {
      print("MQTTManager: Connection failed: ${e.toString()}");

      client.disconnect();
    }
  }

// connection succeeded
  void onConnected() {
    print('Connected');
  }

  void subscribe(String topic, MqttQos lvl) {
    client.subscribe(topic, lvl);
  }

// unconnected
  void onDisconnected() {
    print('Disconnected');
  }

// subscribe to topic succeeded
  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

// subscribe to topic failed
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

// unsubscribe succeeded
  void onUnsubscribed(String topic) {
    print('Unsubscribed topic: $topic');
  }

// PING response received
  void pong() {
    print('Ping response client callback invoked');
  }
}
