# Fruit Pulse Backend

Simple Node.js backend for live ESP32-style sensor data and ML predictions.

## Flow

Sensor source -> Backend simulator/ESP32 -> Backend ML -> WebSocket -> Flutter App

During development, the backend generates sensor readings every few seconds and broadcasts
them to every Flutter app connected to `/ws`. When the hardware is ready, the ESP32 can
still send readings using a normal HTTP `POST`; the backend will run the same prediction
logic and broadcast the integrated result.
No MongoDB or database is used.

## Setup

```bash
cd backend
npm install
copy .env.example .env
npm run dev
```

The server runs on port `5000` by default.

## WebSocket

Flutter connects here:

```text
ws://localhost:5000/ws
```

For Android emulator, the app uses:

```text
ws://10.0.2.2:5000/ws
```

For a physical phone, run Flutter with your computer's LAN IP:

```bash
flutter run --dart-define=API_HOST=192.168.1.10
```

## Send Data From ESP32

```http
POST /api/v1/sensor-data
Content-Type: application/json
x-api-key: change-this-secret

{
  "deviceId": "esp32-1",
  "fruitType": "banana",
  "r": 120,
  "g": 88,
  "b": 35,
  "humidity": 55.4,
  "temperature": 24.7,
  "voc": 48.2,
  "chemicalRipening": 0.42,
  "timestamp": "2026-05-11T13:30:00.000Z"
}
```

The backend broadcasts this websocket message:

```json
{
  "event": "sensor:reading",
  "data": {
    "sensorData": {
      "deviceId": "esp32-1",
      "fruitType": "banana",
      "r": 120,
      "g": 88,
      "b": 35,
      "humidity": 55.4,
      "temperature": 24.7,
      "voc": 48.2,
      "chemicalRipening": 0.42,
      "timestamp": "2026-05-11T13:30:00.000Z"
    },
    "prediction": {
      "isNaturalRipening": true,
      "status": "ripe",
      "confidence": 0.93,
      "recommendation": "Fruit is naturally ripened and currently ripe. Recommended for consumption within 2 days."
    }
  }
}
```

## Useful Endpoints

```http
GET /health
GET /api/v1/sensor-data/latest
POST /api/v1/sensor-data
```
