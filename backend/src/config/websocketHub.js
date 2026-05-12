const { WebSocket, WebSocketServer } = require('ws');

let wss;
let latestSensorReading = null;

const sendJson = (client, event, data) => {
  if (client.readyState !== WebSocket.OPEN) return;
  client.send(JSON.stringify({ event, data }));
};

const initWebSocket = (server) => {
  wss = new WebSocketServer({
    server,
    path: '/ws',
  });

  wss.on('connection', (client) => {
    sendJson(client, 'connected', {
      message: 'Connected to Fruit Pulse live sensor stream.',
    });

    if (latestSensorReading) {
      sendJson(client, 'sensor:reading', latestSensorReading);
    }
  });

  return wss;
};

const broadcastSensorReading = (reading) => {
  latestSensorReading = reading;

  if (!wss) return;

  wss.clients.forEach((client) => {
    sendJson(client, 'sensor:reading', reading);
  });
};

const getLatestSensorReading = () => latestSensorReading;

module.exports = {
  initWebSocket,
  broadcastSensorReading,
  getLatestSensorReading,
};
