import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class MQTTManager {
  String host = '';

  int port = 0;

  String clientId = '';

  String username = '';

  String password = '';

  late MqttBrowserClient _client;

  MQTTManager(
      {required this.host, required this.port, required this.clientId}) {
    /** REQUIRED **/
    _client = MqttBrowserClient.withPort(host, clientId, port);

    /** OPTIONAL **/
    _client.onSubscribed = (String? topic) {
      print("Subscribed to topic: $topic");
    };

    /** OPTIONAL **/
    _client.onUnsubscribed = (String? topic) {
      print("Unsubscribed from topic: $topic");
    };

    /** OPTIONAL **/
    _client.onConnected = () {
      print("Connected successfully to ${_client.server}");
    };

    /** OPTIONAL **/
    _client.onDisconnected = () {
      print("Disconnected from ${_client.server}");
    };

    /** OPTIONAL **/
    _client.onSubscribeFail = (String? topic) {
      print("Failed to subscribe to topic: $topic");
    };

    /** MAYBE REQUIRED, ACCORDING TO THE BROKER SETTINGS **/
    _client.websocketProtocols = [];
  }

  Future<bool> connectAndSub(String username, String password, String topic,
      void Function(String newData) onNewData) async {
    print("MQTT Client Connecting to: $host:$port  $username@$password ...");

    // 1: connect to MQTT broker
    try {
      var connResult = await _client.connect(username, password);
      if (connResult?.state != MqttConnectionState.connected) {
        print("error: couldnt connect");

        // DO NOT CONTINUE
        return false;
      }
    } catch (e) {
      print("couldnt connect: $e");

      // DO NOT CONTINUE
      return false;
    }

    // 2: subscribe to topic
    _client.subscribe(topic, MqttQos.atLeastOnce);

    // 3: handle new incoming data
    _client.updates!.listen((events) {
      for (var msg in events) {
        print("NEW DATA RECEIVED FROM: ${msg.topic}");
        var mqttMsg = msg.payload as MqttPublishMessage;
        var data =
            MqttPublishPayload.bytesToStringAsString(mqttMsg.payload.message);

        onNewData(data);
      }
    });

    return true;
  }

  void disconnect() {
    _client.disconnect();
  }
}
