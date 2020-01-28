DROP TABLE IF EXISTS propertytracker;

CREATE TABLE propertytracker  (

  address VARCHAR(255),
  value INT,
  bedrooms INT,
  build VARCHAR(255),
  id SERIAL PRIMARY KEY
);
