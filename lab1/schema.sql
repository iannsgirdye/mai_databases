CREATE TABLE building (
  building_id SMALLSERIAL PRIMARY KEY,
  number SMALLINT NOT NULL UNIQUE,
  address TEXT NOT NULL UNIQUE
);

CREATE TABLE room (
  room_id SERIAL PRIMARY KEY,
  building_id SMALLINT NOT NULL REFERENCES building(building_id),
  number SMALLINT NOT NULL,
  UNIQUE (building_id, number)
);

--------

CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  middle_name VARCHAR(64),
  last_name VARCHAR(64) NOT NULL,
  birthday DATE NOT NULL,
  sex VARCHAR(16) NOT NULL,
  phone_number VARCHAR(16) NOT NULL UNIQUE,
  email_address VARCHAR(64) NOT NULL UNIQUE,
  home_address TEXT NOT NULL
);

CREATE TABLE student (
  person_id INT PRIMARY KEY REFERENCES person(person_id),
  study_group_id INT NOT NULL REFERENCES study_group(study_group_id),
  card_number VARCHAR(16) NOT NULL UNIQUE
);

CREATE TABLE teacher (
  person_id INT PRIMARY KEY REFERENCES person(person_id),
  department_id INT NOT NULL REFERENCES department(department_id),
  position VARCHAR(64) NOT NULL,
  academic_degree VARCHAR(64),
  academic_title VARCHAR(64)
);

--------

CREATE TABLE faculty (
  faculty_id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL UNIQUE,
  room_id INT NOT NULL UNIQUE REFERENCES room(room_id),
  director INT NOT NULL UNIQUE REFERENCES teacher(person_id),
  temporary_director BOOLEAN NOT NULL DEFAULT FALSE,
  phone_number VARCHAR(16) NOT NULL UNIQUE
);

CREATE TABLE department (
  department_id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL UNIQUE,
  faculty_id INT NOT NULL REFERENCES faculty(faculty_id),
  room_id INT NOT NULL UNIQUE REFERENCES room(room_id),
  director INT NOT NULL UNIQUE REFERENCES teacher(person_id),
  temporary_director BOOLEAN NOT NULL DEFAULT FALSE,
  phone_number VARCHAR(16) NOT NULL UNIQUE
);

CREATE TABLE direction ( 
  direction_id VARCHAR(8) PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE,
  education_type VARCHAR(64) NOT NULL 
    CHECK (education_type IN ('Базовое высшее образование', 'Специализированное высшее образование', 'Аспирантура'))
);

CREATE TABLE program (
  program_id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE,
  department_id INT NOT NULL REFERENCES department(department_id),
  direction_id VARCHAR(8) NOT NULL REFERENCES direction(direction_id)
);

CREATE TABLE study_group(
  study_group_id SERIAL PRIMARY KEY,
  name VARCHAR(16) NOT NULL UNIQUE,
  program_id INT NOT NULL REFERENCES program(program_id),
  course SMALLINT NOT NULL
);

--------

CREATE TABLE subject(
  subject_id SERIAL PRIMARY KEY,
  department_id INT NOT NULL REFERENCES department(department_id),
  name VARCHAR(128) NOT NULL
);

CREATE TABLE subject_for_program (
  subject_id INT REFERENCES subject(subject_id),
  teacher_id INT REFERENCES teacher(person_id),
  program_id INT REFERENCES program(program_id),
  semester SMALLINT NOT NULL,
  PRIMARY KEY (subject_id, program_id, semester)
);

CREATE TABLE subject_for_study_group (
  subject_id INT REFERENCES subject(subject_id),
  teacher_id INT REFERENCES teacher(person_id),
  study_group_id INT REFERENCES study_group(study_group_id),
  semester SMALLINT NOT NULL,
  PRIMARY KEY (subject_id, study_group_id, semester)
);
