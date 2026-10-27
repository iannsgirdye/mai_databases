-- шаблон расписания на неделю
CREATE TABLE schedule_template (
  lesson_id SERIAL PRIMARY KEY,
  subject_id INT NOT NULL REFERENCES subject(subject_id) ON DELETE CASCADE,
  teacher_id INT REFERENCES teacher(person_id) ON DELETE SET NULL,
  room_id INT REFERENCES room(room_id) ON DELETE SET NULL,
  week_start SMALLINT NOT NULL DEFAULT 1,
  week_day SMALLINT NOT NULL CHECK (week_day BETWEEN 1 and 6),
  time_start TIME NOT NULL,
  time_end TIME NOT NULL,
  CHECK (time_end > time_start)
);

-- соотнесение занятий потокам
CREATE TABLE schedule_for_program (
  schedule_item_id SERIAL PRIMARY KEY,
  lesson_id INT NOT NULL REFERENCES schedule_template(lesson_id),
  program_id INT NOT NULL REFERENCES program(program_id)
);

-- соотнесение занятий группам
CREATE TABLE schedule_for_group (
  schedule_item_id SERIAL PRIMARY KEY,
  lesson_id INT NOT NULL REFERENCES schedule_template(lesson_id),
  study_group_id INT NOT NULL REFERENCES study_group(study_group_id)
);