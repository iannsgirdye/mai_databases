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

--------

CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  middle_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  birthday DATE NOT NULL,
  sex VARCHAR(16) NOT NULL,
  phone_number VARCHAR(16) NOT NULL,
  email_address VARCHAR(64) NOT NULL,
  home_address TEXT NOT NULL
);

CREATE TABLE student (
  person_id INT REFERENCES person(person_id),
  study_group_id INT REFERENCES study_group(study_group_id),
  card_number VARCHAR(16) NOT NULL
);

CREATE TABLE teacher (
  person_id INT REFERENCES person(person_id),
  department_id INT REFERENCES department(department_id),
  position VARCHAR(64) NOT NULL,
  academic_degree VARCHAR(64),
  academic_title VARCHAR(64)
);

--------

CREATE TABLE faculty (
  faculty_id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL UNIQUE,
  phone_number VARCHAR(16) NOT NULL,
  room_id INT REFERENCES room(room_id) NOT NULL,
  director INT REFERENCES teacher(teacher_id) NOT NULL,
  temporary_director BOOLEAN NOT NULL
);