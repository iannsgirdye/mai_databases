CREATE TABLE building (
  building_id SERIAL PRIMARY KEY,
  number SMALLINT NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE room (
  room_id SERIAL PRIMARY KEY,
  building_id INT REFERENCES building(building_id),
  number SMALLINT NOT NULL,
);

----------

CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  middle_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  birthday DATE NOT NULL,
  sex VARCHAR(16) NOT NULL,
  phone_number VARCHAR(16) NOT NULL,
  email_address VARCHAR(64) NOT NULL,
  home_address TEXT NOT NULL,
);
