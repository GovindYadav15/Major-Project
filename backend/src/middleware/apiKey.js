const env = require('../config/env');

const requireApiKey = (req, res, next) => {
  if (!env.apiKey) return next();

  const apiKey = req.header('x-api-key');

  if (apiKey !== env.apiKey) {
    return res.status(401).json({
      success: false,
      message: 'Invalid or missing API key.',
    });
  }

  next();
};

module.exports = requireApiKey;
