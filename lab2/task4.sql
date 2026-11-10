-- Загрузка используемых аудиторий и сравнение со средней по корпусу
WITH completed_lessons AS (
    -- Проведённые занятия отчётного периода и их длительность
    SELECT
        lesson.room_id,
        lesson.time_end - lesson.time_start AS duration
    FROM lesson
    WHERE lesson.status = 'Проведено'
        AND lesson.date BETWEEN DATE '2026-09-01' AND DATE '2026-11-30'
), room_totals AS (
    -- Количество занятий и суммарное время по каждой аудитории
    SELECT
        room.building_id,
        room.number AS room_number,
        COUNT(*) AS completed_lesson_count,
        SUM(completed_lessons.duration) AS total_duration
    FROM room
    JOIN completed_lessons
        ON room.room_id = completed_lessons.room_id
    GROUP BY room.room_id
), building_averages AS (
    -- Среднее время по использовавшимся аудиториям каждого корпуса
    SELECT
        room_totals.building_id,
        AVG(room_totals.total_duration) AS average_duration
    FROM room_totals
    GROUP BY room_totals.building_id
)
SELECT
    building.number AS building_number,
    room_totals.room_number,
    room_totals.completed_lesson_count,
    room_totals.total_duration,
    building_averages.average_duration,
    room_totals.total_duration - building_averages.average_duration
        AS duration_difference
FROM room_totals
JOIN building
    ON room_totals.building_id = building.building_id
JOIN building_averages
    ON room_totals.building_id = building_averages.building_id
ORDER BY
    building.number,
    room_totals.total_duration DESC,
    room_totals.room_number;
