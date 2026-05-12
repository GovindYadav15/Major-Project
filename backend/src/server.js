const http = require('http');
const app = require('./app');
const env = require('./config/env');
const { initWebSocket } = require('./config/websocketHub');
const { startSensorSimulator, stopSensorSimulator } = require('./services/sensorSimulator.service');

const startServer = async () => {
  const server = http.createServer(app);
  initWebSocket(server);
  startSensorSimulator();

  server.listen(env.port, () => {
    console.log(`Fruit Pulse backend listening on port ${env.port}`);
    console.log(`WebSocket ready at ws://localhost:${env.port}/ws`);
  });

  const shutdown = (signal) => {
    console.log(`${signal} received. Closing server...`);
    stopSensorSimulator();
    server.close(() => {
      process.exit(0);
    });
  };

  process.on('SIGINT', () => shutdown('SIGINT'));
  process.on('SIGTERM', () => shutdown('SIGTERM'));
};

startServer().catch((error) => {
  console.error('Failed to start server:', error);
  process.exit(1);
});
