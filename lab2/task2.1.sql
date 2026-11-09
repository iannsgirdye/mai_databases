-- 1. Занятия образовательных программ с дисциплинами и преподавателями
SELECT
    lesson.lesson_id,
    lesson.type,
    lesson.date,
    lesson.time_start,
    lesson.time_end,
    lesson.status,
    subject.name AS subject_name,
    program.name AS program_name,
    subject_for_program.semester,
    person.last_name,
    person.first_name,
    person.middle_name
FROM lesson
JOIN lesson_for_program
    ON lesson.lesson_id = lesson_for_program.lesson_id
JOIN subject_for_program
    ON lesson_for_program.subject_id = subject_for_program.subject_id
    AND lesson_for_program.program_id = subject_for_program.program_id
    AND lesson_for_program.semester = subject_for_program.semester
JOIN subject
    ON subject_for_program.subject_id = subject.subject_id
JOIN program
    ON subject_for_program.program_id = program.program_id
JOIN person
    ON subject_for_program.teacher_id = person.person_id
ORDER BY
    lesson.date,
    lesson.time_start,
    program.name;

-- 2. Учебные группы без студентов с указанием образовательной программы
SELECT
    study_group.study_group_id,
    study_group.name AS group_name,
    study_group.course,
    program.name AS program_name
FROM study_group
JOIN program
    ON study_group.program_id = program.program_id
LEFT JOIN student
    ON study_group.study_group_id = student.study_group_id
WHERE student.person_id IS NULL
ORDER BY
    program.name,
    study_group.name;

-- 3. Группы второго курса факультета информационных технологий
SELECT
    study_group.name AS group_name,
    study_group.course,
    program.name AS program_name,
    department.name AS department_name,
    faculty.name AS faculty_name
FROM faculty
JOIN department
    ON faculty.faculty_id = department.faculty_id
JOIN program
    ON department.department_id = program.department_id
JOIN study_group
    ON program.program_id = study_group.program_id
WHERE faculty.name = 'Факультет информационных технологий'
    AND study_group.course = 2
ORDER BY
    program.name,
    study_group.name;
