import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../shared/models/prediction_result.dart';
import '../../shared/models/sensor_data.dart';
import '../constants/api_config.dart';

class LiveSensorReading {
  const LiveSensorReading({
    required this.sensorData,
    required this.prediction,
  });

  final SensorData sensorData;
  final PredictionResult prediction;
}

class LiveSensorService {
  LiveSensorService({String? websocketUrl})
      : _websocketUrl = websocketUrl ?? ApiConfig.websocketUrl;

  final String _websocketUrl;
  final StreamController<LiveSensorReading> _readingStreamController =
      StreamController<LiveSensorReading>.broadcast();

  WebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;

  Stream<LiveSensorReading> get readingStream => _readingStreamController.stream;

  void connect() {
    if (_channel != null) return;

    _channel = WebSocketChannel.connect(Uri.parse(_websocketUrl));
    _channelSubscription = _channel!.stream.listen(
      _handleMessage,
      onError: _readingStreamController.addError,
      onDone: () {
        _channel = null;
        _channelSubscription = null;
      },
    );
  }

  void disconnect() {
    _channelSubscription?.cancel();
    _channelSubscription = null;
    _channel?.sink.close();
    _channel = null;
  }

  void _handleMessage(dynamic message) {
    final decoded = jsonDecode(message as String) as Map<String, dynamic>;

    if (decoded['event'] != 'sensor:reading') return;

    final data = Map<String, dynamic>.from(decoded['data'] as Map);
    final sensorData = Map<String, dynamic>.from(data['sensorData'] as Map);
    final prediction = Map<String, dynamic>.from(data['prediction'] as Map);

    _readingStreamController.add(
      LiveSensorReading(
        sensorData: SensorData.fromJson(sensorData),
        prediction: PredictionResult.fromJson(prediction),
      ),
    );
  }

  void dispose() {
    disconnect();
    _readingStreamController.close();
  }
}
