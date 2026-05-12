const express = require('express');
const sensorController = require('../controllers/sensor.controller');
const requireApiKey = require('../middleware/apiKey');

const router = express.Router();

router.post('/', requireApiKey, sensorController.receiveSensorData);
router.get('/latest', sensorController.getLatest);

module.exports = router;
