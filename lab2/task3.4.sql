-- Индивидуальный подсчёт проведённых групповых занятий для каждой группы
SELECT
    study_group.name AS group_name,
    program.name AS program_name,
    (
        SELECT COUNT(DISTINCT lesson.lesson_id)
        FROM lesson_for_group
        JOIN lesson
            ON lesson_for_group.lesson_id = lesson.lesson_id
        WHERE lesson_for_group.study_group_id = study_group.study_group_id
            AND lesson.status = 'Проведено'
    ) AS completed_group_lesson_count
FROM study_group
JOIN program
    ON study_group.program_id = program.program_id
ORDER BY
    completed_group_lesson_count DESC,
    program.name,
    study_group.name;
