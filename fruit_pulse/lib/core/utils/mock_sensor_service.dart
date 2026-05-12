import 'dart:async';
import 'dart:math';
import '../../shared/models/sensor_data.dart';

class MockSensorService {
  final StreamController<SensorData> _sensorStreamController =
      StreamController<SensorData>.broadcast();

  Stream<SensorData> get sensorStream => _sensorStreamController.stream;

  Timer? _timer;
  double _vocValue = 45.0;
  double _chemicalRipeningValue = 0.0;

  void startMockDataStream() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Simulate VOC changes
      double vocChange = (Random().nextDouble() - 0.5) * 2; // -1 to 1
      _vocValue = (_vocValue + vocChange).clamp(0, 100);

      // Simulate chemical ripening
      _chemicalRipeningValue =
          (_chemicalRipeningValue + Random().nextDouble() * 0.1).clamp(0, 1);

      final sensorData = SensorData(
        r: Random().nextInt(256),
        g: Random().nextInt(256),
        b: Random().nextInt(256),
        humidity: 40 + Random().nextDouble() * 20, // 40-60%
        temperature: 20 + Random().nextDouble() * 10, // 20-30°C
        voc: _vocValue,
        chemicalRipening: _chemicalRipeningValue,
        timestamp: DateTime.now(),
      );

      _sensorStreamController.add(sensorData);
    });
  }

  void stopMockDataStream() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _timer?.cancel();
    _sensorStreamController.close();
  }
}
