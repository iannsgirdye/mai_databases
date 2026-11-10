-- Группы, численность которых выше средней по их программе
SELECT
    group_sizes.group_name,
    program.name AS program_name,
    group_sizes.student_count
FROM (
    SELECT
        study_group.program_id,
        study_group.name AS group_name,
        COUNT(student.person_id) AS student_count
    FROM study_group
    LEFT JOIN student
        ON study_group.study_group_id = student.study_group_id
    GROUP BY study_group.study_group_id
) AS group_sizes
JOIN program
    ON group_sizes.program_id = program.program_id
WHERE group_sizes.student_count > (
    SELECT AVG(program_group_sizes.student_count)
    FROM (
        SELECT COUNT(student.person_id) AS student_count
        FROM study_group
        LEFT JOIN student
            ON study_group.study_group_id = student.study_group_id
        WHERE study_group.program_id = group_sizes.program_id
        GROUP BY study_group.study_group_id
    ) AS program_group_sizes
)
ORDER BY
    program.name,
    group_sizes.student_count DESC,
    group_sizes.group_name;
