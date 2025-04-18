with

source as (

    select 
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
        member_casual
        
    from {{ source('raw_divvy', 'divvy_tripdata') }}

)

select * from source

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}