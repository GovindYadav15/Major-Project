const express = require('express');
const sensorRoutes = require('./sensor.routes');

const router = express.Router();

router.use('/sensor-data', sensorRoutes);

module.exports = router;
