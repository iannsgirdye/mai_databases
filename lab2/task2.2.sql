-- 1. Количество студентов в каждой группе, включая пустые группы
SELECT
    study_group.name AS group_name,
    COUNT(student.person_id) AS student_count
FROM study_group
LEFT JOIN student
    ON study_group.study_group_id = student.study_group_id
GROUP BY
    study_group.study_group_id
ORDER BY study_group.name;

-- 2. Программы с двумя и более группами средней численностью более 4
SELECT
    program.name AS program_name,
    COUNT(DISTINCT study_group.study_group_id) AS study_group_count,
    COUNT(student.person_id) AS student_count,
    COUNT(student.person_id) * 1.0 / COUNT(DISTINCT study_group.study_group_id) AS average_student_count
FROM program
JOIN study_group
    ON program.program_id = study_group.program_id
LEFT JOIN student
    ON study_group.study_group_id = student.study_group_id
GROUP BY
    program.program_id
HAVING COUNT(DISTINCT study_group.study_group_id) >= 2
    AND COUNT(student.person_id) * 1.0 / COUNT(DISTINCT study_group.study_group_id) > 4
ORDER BY program.name DESC;

-- 3. Сравнение количества занятий по типам и статусам
SELECT
    lesson.type,
    lesson.status,
    COUNT(*) AS lesson_count,
    MIN(lesson.date) AS first_lesson_date,
    MAX(lesson.date) AS last_lesson_date
FROM lesson
GROUP BY
    lesson.type,
    lesson.status
ORDER BY
    lesson.type,
    lesson.status;
