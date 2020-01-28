DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker(
  address VARCHAR(255),
  value INT,
  bedrooms INT,
  build VARCHAR(255),
  id SERIAL PRIMARY KEY
);
