with station_dimension as (
    select  
        distinct
              start_station_id      as station_id
            , START_STATION_NAME    as station_name
            , START_LAT             as station_lat
            , START_LNG             as station_lng
    from
        {{ ref('stg_bike') }}
    where 1=1
        and RIDE_ID <> 'ride_id'
)

select
    *
from
    station_dimension