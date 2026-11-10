-- Группы без проведённых занятий: учитываются занятия групп и программ
SELECT
    study_group.name AS group_name,
    study_group.course,
    program.name AS program_name
FROM study_group
JOIN program
    ON study_group.program_id = program.program_id
WHERE NOT EXISTS (
    SELECT 1
    FROM lesson_for_group
    JOIN lesson
        ON lesson_for_group.lesson_id = lesson.lesson_id
    WHERE lesson_for_group.study_group_id = study_group.study_group_id
        AND lesson.status = 'Проведено'
)
    AND NOT EXISTS (
        SELECT 1
        FROM lesson_for_program
        JOIN lesson
            ON lesson_for_program.lesson_id = lesson.lesson_id
        WHERE lesson_for_program.program_id = study_group.program_id
            AND lesson.status = 'Проведено'
    )
ORDER BY
    program.name,
    study_group.name;
