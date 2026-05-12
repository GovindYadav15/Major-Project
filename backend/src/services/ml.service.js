const randomBetween = (min, max) => min + Math.random() * (max - min);

const predictFromSensorData = (data) => {
  const isNatural = data.chemicalRipening < 0.5;
  const confidence = Number(randomBetween(0.82, 0.98).toFixed(3));

  let status;
  if (data.voc > 60) {
    status = 'unripe';
  } else if (data.voc > 30) {
    status = 'ripe';
  } else {
    status = 'overripe';
  }

  let recommendation;
  if (status === 'unripe') {
    recommendation = `Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently unripe. Wait for ripening.`;
  } else if (status === 'ripe') {
    recommendation = `Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently ripe. Recommended for consumption within 2 days.`;
  } else {
    recommendation = `Fruit is ${isNatural ? 'naturally' : 'chemically'} ripened and currently overripe. Consume immediately or discard.`;
  }

  return {
    isNaturalRipening: isNatural,
    status,
    confidence,
    recommendation,
  };
};

module.exports = {
  predictFromSensorData,
};
