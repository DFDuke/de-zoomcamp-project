{{ config(materialized='table') }}

with trips_data as
(
    SELECT
    year, 
    quarter,
    year_quarter,
    source,
    COUNT(*) as trip_count
    FROM  {{ ref('fact_tripdata') }}
    GROUP BY 1,2,3,4
    ORDER BY 1,2
)
SELECT
    curr_yr.year,
    curr_yr.quarter,
    curr_yr.source,
    curr_yr.trip_count as trip_count_curr_yr,
    prev_yr.trip_count as trip_count_prev_yr,
    (curr_yr.trip_count - prev_yr.trip_count) as trip_count_diff,
    (curr_yr.trip_count - prev_yr.trip_count) / NULLIF(prev_yr.trip_count, 0) * 100 as trip_count_pct_change
FROM
    trips_data curr_yr
    LEFT OUTER JOIN trips_data prev_yr
        ON  prev_yr.year = curr_yr.year - 1
        AND prev_yr.quarter = curr_yr.quarter
        AND prev_yr.source = curr_yr.source
ORDER BY curr_yr.year, curr_yr.quarter