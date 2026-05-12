import 'dart:async';

import 'package:flutter/material.dart';
import '../../core/utils/live_sensor_service.dart';
import '../../shared/models/sensor_data.dart';
import '../../shared/models/prediction_result.dart';

class SensorProvider with ChangeNotifier {
  final LiveSensorService _sensorService = LiveSensorService();
  StreamSubscription<LiveSensorReading>? _readingSubscription;

  SensorData? _currentSensorData;
  PredictionResult? _currentPrediction;
  final List<SensorData> _sensorHistory = [];

  SensorData? get currentSensorData => _currentSensorData;
  PredictionResult? get currentPrediction => _currentPrediction;
  List<SensorData> get sensorHistory => _sensorHistory;

  bool _isStreaming = false;
  bool get isStreaming => _isStreaming;

  void startSensorStream() {
    if (_isStreaming) return;

    _isStreaming = true;
    _sensorService.connect();
    _readingSubscription = _sensorService.readingStream.listen((reading) {
      _currentSensorData = reading.sensorData;
      _sensorHistory.add(reading.sensorData);

      if (_sensorHistory.length > 60) {
        _sensorHistory.removeAt(0);
      }

      _currentPrediction = reading.prediction;
      notifyListeners();
    });

    notifyListeners();
  }

  void stopSensorStream() {
    _isStreaming = false;
    _readingSubscription?.cancel();
    _readingSubscription = null;
    _sensorService.disconnect();
    notifyListeners();
  }

  @override
  void dispose() {
    _readingSubscription?.cancel();
    _sensorService.dispose();
    super.dispose();
  }
}
