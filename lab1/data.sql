BEGIN;

INSERT INTO building (number, address) VALUES
(1, 'Москва, улица Университетская, дом 1'),
(2, 'Москва, улица Университетская, дом 2');

INSERT INTO room (building_id, number) VALUES
(1, 101),
(1, 102),
(2, 201),
(2, 202);

INSERT INTO faculty (name, room_id, director, temporary_director, phone_number) VALUES
('Факультет информационных технологий', 1, 'Иванов Иван Иванович', FALSE, '+74950000001'),
('Факультет прикладной математики',    2, 'Петров Пётр Петрович', TRUE,  '+74950000002');

INSERT INTO department (name, faculty_id, room_id, director, temporary_director, phone_number) VALUES
('Кафедра программной инженерии',     1, 3, 'Сидоров Сергей Сергеевич',   FALSE, '+74950000003'),
('Кафедра вычислительной математики', 2, 4, 'Кузнецов Алексей Алексеевич', TRUE,  '+74950000004');

INSERT INTO direction (direction_id, name, education_type) VALUES
('09.03.01', 'Информатика и вычислительная техника', 'Базовое высшее образование'),
('01.03.02', 'Прикладная математика и информатика',  'Базовое высшее образование');

INSERT INTO program (name, department_id, direction_id) VALUES
('Разработка программного обеспечения', 1, '09.03.01'),
('Информационные системы',              1, '09.03.01'),
('Вычислительная математика',           2, '01.03.02');

INSERT INTO study_group (name, program_id, course) VALUES
('ИТ-101',  1, 1),
('ИТ-201',  2, 2),
('МАТ-301', 3, 3);

INSERT INTO person (first_name, middle_name, last_name, birthday, sex, phone_number, email_address, home_address) VALUES
('Анна',    'Сергеевна', 'Смирнова',   DATE '1980-04-12', 'Женский', '+79000000001', 'anna.smirnova@example.edu',   'Москва, улица Лесная, дом 10'),
('Дмитрий', 'Иванович',  'Волков',     DATE '1975-09-03', 'Мужской', '+79000000002', 'dmitry.volkov@example.edu',   'Москва, улица Садовая, дом 15'),
('Елена',   'Андреевна', 'Морозова',   DATE '1987-01-25', 'Женский', '+79000000003', 'elena.morozova@example.edu',  'Москва, проспект Мира, дом 20'),
('Максим',  'Олегович',  'Орлов',      DATE '2006-06-14', 'Мужской', '+79000000004', 'maxim.orlov@example.edu',     'Москва, улица Новая, дом 7'),
('Полина',  'Денисовна', 'Васильева',  DATE '2005-11-22', 'Женский', '+79000000005', 'polina.vasileva@example.edu', 'Москва, улица Центральная, дом 3');

INSERT INTO teacher (person_id, department_id, position, academic_degree, academic_title) VALUES
(1, 1, 'Доцент',                'Кандидат технических наук',         'Доцент'),
(2, 1, 'Старший преподаватель', NULL,                                NULL),
(3, 2, 'Профессор',             'Доктор физико-математических наук', 'Профессор');

INSERT INTO student (person_id, study_group_id, card_number) VALUES
(4, 1, 'ST-2026-001'),
(5, 2, 'ST-2025-014');

INSERT INTO subject (department_id, name) VALUES
(1, 'Базы данных'),
(1, 'Программирование'),
(2, 'Математический анализ'),
(2, 'Численные методы');

INSERT INTO subject_for_program (subject_id, program_id, teacher_id, semester) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(1, 2, 1, 2),
(3, 3, 3, 1),
(4, 3, 3, 3);

INSERT INTO subject_for_study_group (subject_id, study_group_id, teacher_id, semester) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 1, 1),
(4, 3, 3, 3);

COMMIT;