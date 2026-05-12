import 'dart:math';
import '../../shared/models/prediction_result.dart';
import '../../shared/models/sensor_data.dart';

class MockMLService {
  PredictionResult predictFromSensorData(SensorData data) {
    // Simple mock logic based on sensor values
    bool isNatural = data.chemicalRipening < 0.5;
    String status;
    double confidence = 0.8 + Random().nextDouble() * 0.2; // 80-100%

    if (data.voc > 60) {
      status = 'unripe';
    } else if (data.voc > 30) {
      status = 'ripe';
    } else {
      status = 'overripe';
    }

    String recommendation;
    if (status == 'unripe') {
      recommendation =
          'Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently unripe. Wait for ripening.';
    } else if (status == 'ripe') {
      recommendation =
          'Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently ripe. Recommended for consumption within 2 days.';
    } else {
      recommendation =
          'Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently overripe. Consume immediately or discard.';
    }

    return PredictionResult(
      isNaturalRipening: isNatural,
      status: status,
      confidence: confidence,
      recommendation: recommendation,
    );
  }
}
