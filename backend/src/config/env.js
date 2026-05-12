const dotenv = require('dotenv');

dotenv.config();

const parseOrigins = (value) => {
  if (!value || value === '*') return '*';
  return value.split(',').map((origin) => origin.trim()).filter(Boolean);
};

const env = {
  nodeEnv: process.env.NODE_ENV || 'development',
  port: Number(process.env.PORT || 5000),
  corsOrigin: parseOrigins(process.env.CORS_ORIGIN || '*'),
  apiKey: process.env.API_KEY || '',
};

module.exports = env;
