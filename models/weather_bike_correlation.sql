WITH weather_bike_correlation as (
    select
          T.*
        , W.*
    from
        {{ ref('trip_fact') }} as T

    left join
        {{ ref('daily_weather') }} as W
    on
        T.TRIP_DATE = W.DAILY_WEATHER
)

select
    *
from
    weather_bike_correlation