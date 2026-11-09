BEGIN;

INSERT INTO lesson (type, room_id, date, time_start, time_end, status) VALUES
('Лекция', 7, '2026-11-24', '09:00', '10:30', 'Запланировано'),
('Практическое занятие', 8, '2026-11-25', '10:45', '12:15', 'Запланировано'),
('Лабораторная работа', 9, '2026-11-26', '09:00', '12:00', 'Запланировано');

INSERT INTO lesson_for_program (lesson_id, subject_id, program_id, semester) VALUES
(37, 5, 4, 1),
(37, 5, 5, 1);

INSERT INTO lesson_for_group (lesson_id, subject_id, study_group_id, semester) VALUES
(38, 5, 4, 1),
(39, 5, 5, 1);

UPDATE lesson
SET status = 'Проведено'
WHERE lesson_id = 31 AND status = 'Запланировано';

UPDATE lesson
SET date = date + 7
WHERE date BETWEEN DATE '2026-11-10' AND DATE '2026-11-14' AND status = 'Запланировано';

SELECT *
FROM lesson_for_group
WHERE lesson_id = 9;

DELETE FROM lesson
WHERE lesson_id = 9 AND status = 'Отменено';

SELECT *
FROM lesson_for_group
WHERE lesson_id = 9;

COMMIT;

BEGIN;

UPDATE lesson
SET status = 'Отменено'
WHERE lesson_id = 37;

SELECT lesson_id, status
FROM lesson
WHERE lesson_id = 37;

ROLLBACK;

SELECT lesson_id, status
FROM lesson
WHERE lesson_id = 37;
