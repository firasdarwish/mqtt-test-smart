// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;

  void setReceivedText(String text) {
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  void initConnectionState(MQTTAppConnectionState state) =>
      _appConnectionState = state;

  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
