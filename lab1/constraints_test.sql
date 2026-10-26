-- 1. Комната с несуществующим зданием (FK room.building_id)
INSERT INTO room (building_id, number) VALUES (9999, 1);

-- 2. Программа с несуществующей кафедрой (FK program.department_id)
INSERT INTO program (name, department_id, direction_id)
VALUES ('Тестовая программа', 9999, '09.03.01');

-- 3. Студент с несуществующим person (FK student.person_id)
INSERT INTO student (person_id, study_group_id, card_number)
VALUES (9999, 1, 'ST-FAKE-001');

-- 4. План группы с несуществующим program_subject_id (FK subject_for_study_group.program_subject_id)
INSERT INTO subject_for_study_group (program_subject_id, study_group_id, teacher_id)
VALUES (9999, 1, 1);

-- 5. Удалить кафедру, на которую ссылаются программы
DELETE FROM department WHERE department_id = 1;

-- 6. Удалить группу, в которой есть студенты
DELETE FROM study_group WHERE study_group_id = 1;

-- 7. Удалить преподавателя, на которого ссылается план программы
DELETE FROM teacher WHERE person_id = 1;

-- 8. Удалить предмет, на который ссылается план программы
DELETE FROM subject WHERE subject_id = 1;