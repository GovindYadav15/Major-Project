const { broadcastSensorReading } = require('../config/websocketHub');
const { predictFromSensorData } = require('./ml.service');

const intervalMs = Number(process.env.SIMULATOR_INTERVAL_MS || 5000);

let timer = null;
let vocValue = 45;
let chemicalRipeningValue = 0.05;

const randomBetween = (min, max) => min + Math.random() * (max - min);
const randomInt = (min, max) => Math.floor(randomBetween(min, max + 1));
const round = (value, digits = 2) => Number(value.toFixed(digits));

const generateSensorData = () => {
  vocValue = Math.max(5, Math.min(85, vocValue + randomBetween(-4, 3)));
  chemicalRipeningValue = Math.max(
    0,
    Math.min(1, chemicalRipeningValue + randomBetween(0.015, 0.055)),
  );

  if (chemicalRipeningValue >= 0.98) {
    chemicalRipeningValue = randomBetween(0.05, 0.18);
    vocValue = randomBetween(55, 75);
  }

  return {
    deviceId: 'backend-simulator-1',
    fruitType: 'banana',
    r: randomInt(95, 225),
    g: randomInt(75, 190),
    b: randomInt(25, 95),
    humidity: round(randomBetween(42, 68)),
    temperature: round(randomBetween(21, 31)),
    voc: round(vocValue),
    chemicalRipening: round(chemicalRipeningValue, 3),
    timestamp: new Date(),
  };
};

const createSensorReading = (sensorData = generateSensorData()) => ({
  sensorData,
  prediction: predictFromSensorData(sensorData),
});

const publishSimulatedReading = () => {
  const reading = createSensorReading();
  broadcastSensorReading(reading);
  return reading;
};

const startSensorSimulator = () => {
  if (timer) return;

  publishSimulatedReading();
  timer = setInterval(publishSimulatedReading, intervalMs);
};

const stopSensorSimulator = () => {
  if (!timer) return;

  clearInterval(timer);
  timer = null;
};

module.exports = {
  createSensorReading,
  generateSensorData,
  startSensorSimulator,
  stopSensorSimulator,
};
