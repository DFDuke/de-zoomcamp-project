{{ config(materialized='table') }}

WITH
citibike_tripdata AS 
(
    SELECT  *,
            'citibike' as source
    FROM    {{ ref('fact_citibike_tripdata') }}
    -- FROM    {{ source('raw_citibike', 'citibike_tripdata') }}

),
divvy_tripdata AS 
(
    SELECT  *,
            'divvy' as source
    FROM    {{ ref('fact_divvy_tripdata') }}
    -- FROM    {{ source('raw_divvy', 'divvy_tripdata') }}

),
unioned_trips AS 
(
    SELECT  *
    FROM    citibike_tripdata
    UNION ALL
    SELECT  *
    FROM    divvy_tripdata
)
SELECT
    -- identifiers
    source,
    ride_id,
    start_station_id,
    end_station_id,

    -- timestamps
    started_at,
    ended_at,

    -- tripinfo
    rideable_type,
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    
    -- dateinfo
    year,
    quarter,
    year_quarter,
    week,
    month
from unioned_trips
where started_at >= '2021-02-01'
-- from {{ ref('stg_citibike_tripdata') }}
-- from {{ ref('stg_divvy_tripdata') }}