-- models/driver_race_numbers.sql

SELECT
    r.race_id,
    r.season,
    r.round,
    d.driver_str_id,
    CONCAT(d.given_name, ' ', d.family_name) AS driver_name,
    res.points,
    ROW_NUMBER() OVER (PARTITION BY d.driver_str_id ORDER BY r.date) AS race_number
FROM
    {{ source('f1_ergast_api', 'races') }} r
JOIN
    {{ source('f1_ergast_api', 'results') }} res ON r.race_id = res.race_id
JOIN
    {{ source('f1_ergast_api', 'drivers') }} d ON res.driver_str_id = d.driver_str_id
ORDER BY
    d.driver_str_id, race_number
