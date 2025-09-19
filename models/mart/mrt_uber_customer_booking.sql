{{ config(materialized='table') }}

with base as (
  select *
  from {{ ref('int_fct_user_book') }}
),

last_ride as (
  select
      customer_id,
      max(date) as customer_last_booking_date
  from base
  group by customer_id
)

select
    b.*,
    l.customer_last_booking_date,
    date_diff(current_date(), l.customer_last_booking_date, day) as customer_days_since_last_booking,
    case
      when l.customer_last_booking_date is null then true
      when date_diff(current_date(), l.customer_last_booking_date, day) > 60 then true
      else false
    end as is_churned_60d
from base b
left join last_ride l
  on b.customer_id = l.customer_id
