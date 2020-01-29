DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker(
  address VARCHAR(255),
  value INT,
  bedrooms INT,
  build VARCHAR(255),
  id SERIAL PRIMARY KEY
);


-- # It is a good idea to start by creating the SQL file, next the CLASS file and then the console file.  It doesnt really matter what order but this was a recommended order by Zolt.
