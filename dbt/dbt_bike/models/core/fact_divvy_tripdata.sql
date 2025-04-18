{{ config(materialized='table') }}

SELECT
    -- identifiers
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
    {{ date_part('year', 'started_at') }} as year,
    {{ date_part('quarter', 'started_at') }} as quarter,
    {{ date_part("year", "started_at") }} || "/Q" || {{ date_part("quarter", "started_at") }} as year_quarter,
    {{ date_part('week', 'started_at') }} as week,
    {{ date_part('month', 'started_at') }} as month
-- from {{ ref('stg_citibike_tripdata') }}
from {{ ref('stg_divvy_tripdata') }}