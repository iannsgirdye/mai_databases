-- Группы, у которых есть хотя бы одна отменённая лабораторная работа
SELECT
    study_group.name AS group_name,
    program.name AS program_name
FROM study_group
JOIN program
    ON study_group.program_id = program.program_id
WHERE EXISTS (
    SELECT 1
    FROM lesson_for_group
    JOIN lesson
        ON lesson_for_group.lesson_id = lesson.lesson_id
    WHERE lesson_for_group.study_group_id = study_group.study_group_id
        AND lesson.type = 'Лабораторная работа'
        AND lesson.status = 'Отменено'
)
ORDER BY
    program.name,
    study_group.name;
