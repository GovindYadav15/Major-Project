const asyncHandler = require("../utils/asyncHandler");
const { success } = require("../utils/apiResponse");
const {
  broadcastSensorReading,
  getLatestSensorReading,
} = require("../config/websocketHub");
const { createSensorReading } = require("../services/sensorSimulator.service");
const { sensorDataSchema } = require("../validators/sensor.validator");

const receiveSensorData = asyncHandler(async (req, res) => {
  const sensorData = sensorDataSchema.parse(req.body);
  const reading = createSensorReading(sensorData);

  broadcastSensorReading(reading);

  success(
    res,
    reading,
    "Sensor reading broadcasted to websocket clients.",
    201,
  );
});

const getLatest = asyncHandler(async (req, res) => {
  const latest = getLatestSensorReading();

  success(
    res,
    latest,
    latest
      ? "Latest sensor reading fetched."
      : "No sensor reading generated yet.",
  );
});

module.exports = {
  receiveSensorData,
  getLatest,
};
