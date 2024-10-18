-- models/driver_cumulative_points.sql

SELECT
    driver_name,  -- This should reference the already concatenated driver_name from driver_race_numbers
    race_number,
    SUM(points) OVER (PARTITION BY driver_name ORDER BY race_number) AS cumulative_points
FROM {{ ref('driver_race_numbers') }}

