import 'package:get/get.dart';

class LiveInfo extends GetxController {
  num? _currentPerformance;

  num get currentPerformance => _currentPerformance ?? 0;

  void setCurrentPerformance(num cp) {
    _currentPerformance = cp;
    update();
  }
}
