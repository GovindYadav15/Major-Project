const { ZodError } = require('zod');

const errorHandler = (err, req, res, next) => {
  if (err instanceof ZodError) {
    return res.status(400).json({
      success: false,
      message: 'Validation failed.',
      errors: err.errors.map((error) => ({
        path: error.path.join('.'),
        message: error.message,
      })),
    });
  }

  if (err.name === 'CastError') {
    return res.status(400).json({
      success: false,
      message: 'Invalid identifier.',
    });
  }

  if (err.code === 11000) {
    return res.status(409).json({
      success: false,
      message: 'Duplicate record.',
      fields: Object.keys(err.keyPattern || {}),
    });
  }

  console.error(err);

  return res.status(err.statusCode || 500).json({
    success: false,
    message: err.message || 'Internal server error.',
  });
};

module.exports = errorHandler;
