import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

final locationDetailsProvider =
    ChangeNotifierProvider.autoDispose<WeatherReportController>((ref) {
  return WeatherReportController();
});

class WeatherReportController extends ChangeNotifier {
  List<LocationData>? _data;

  List<LocationData>? get data => _data;

  void updateLocationData({required List<LocationData>? data}) {
    _data = data;
    notifyListeners();
  }
}
