with trip_fact as (
    select  
          RIDE_ID
        -- , RIDEABLE_TYPE
        , DATE(TO_TIMESTAMP(STARTED_AT))      as TRIP_DATE
        , START_STATION_ID
        , END_STATION_ID
        , MEMBER_CASUAL
        , TIMESTAMPDIFF(SECONDS, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) as TRIP_DURATION_SECONDS
    from
        {{ ref('stg_bike') }}
    where 1=1
        and RIDE_ID <> 'ride_id'
)

select
    *
from
    trip_fact