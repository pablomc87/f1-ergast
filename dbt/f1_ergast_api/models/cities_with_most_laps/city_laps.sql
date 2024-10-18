SELECT
    c.locality,
    c.lat,
    c.long,
    SUM(r.laps) AS total_laps
FROM
    {{ source('f1_ergast_api', 'results') }} AS r
JOIN
    {{ source('f1_ergast_api', 'races') }} AS ra ON r.race_id = ra.race_id
JOIN
    {{ source('f1_ergast_api', 'circuits') }} AS c ON r.circuit_str_id = c.circuit_str_id
GROUP BY
    c.locality, c.lat, c.long
ORDER BY total_laps DESC