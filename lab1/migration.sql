CREATE TABLE lesson (
  lesson_id SERIAL PRIMARY KEY,
  type VARCHAR(32) NOT NULL CHECK (type IN ('Лекция', 'Практическое занятие', 'Лабораторная работа')),  
  room_id INT REFERENCES room(room_id) ON DELETE SET NULL,
  date DATE NOT NULL,
  time_start TIME NOT NULL,
  time_end TIME NOT NULL,
  status VARCHAR(16) NOT NULL DEFAULT 'Запланировано' CHECK (status IN ('Запланировано', 'Проведено', 'Отменено')),
  CHECK (time_end > time_start)
);

CREATE TABLE lesson_for_program (
  lesson_id INT NOT NULL REFERENCES lesson(lesson_id) ON DELETE CASCADE,
  subject_id INT NOT NULL,
  program_id INT NOT NULL,
  semester SMALLINT NOT NULL,
  PRIMARY KEY (lesson_id, subject_id, program_id, semester),
  FOREIGN KEY (subject_id, program_id, semester) REFERENCES subject_for_program(subject_id, program_id, semester) ON DELETE CASCADE
);

CREATE TABLE lesson_for_group (
  lesson_id INT NOT NULL REFERENCES lesson(lesson_id) ON DELETE CASCADE,
  subject_id INT NOT NULL,
  study_group_id INT NOT NULL,
  semester SMALLINT NOT NULL,
  PRIMARY KEY (lesson_id, subject_id, study_group_id, semester),
  FOREIGN KEY (subject_id, study_group_id, semester) REFERENCES subject_for_study_group(subject_id, study_group_id, semester) ON DELETE CASCADE
);