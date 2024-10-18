-- models/driver_career_performance.sql

SELECT
    race_number,
    driver_name,
    MAX(cumulative_points) AS cumulative_points
FROM
    {{ ref('driver_cumulative_points') }}
GROUP BY
    race_number,
    driver_name
ORDER BY
    race_number DESC,
    cumulative_points DESC
LIMIT 200