WITH customer_data AS (
  SELECT
      u.customer_id,
      b.date,
      b.time,
      b.booking_id,
      b.booking_status,
      b.vehicle_type,
      b.pickup_location,
      b.drop_location,
      b.avg_vtat,
      b.avg_ctat,
      b.cancelled_rides_by_customer,
      b.reason_for_cancelling_by_customer,
      b.cancelled_rides_by_driver,
      b.driver_cancellation_reason,
      b.incomplete_rides,
      b.incomplete_rides_reason,
      b.booking_value,
      b.ride_distance,
      b.driver_ratings,
      b.customer_rating,
      b.payment_method
  FROM {{ ref('int_dim_uber_user') }} AS u
  LEFT JOIN {{ ref('stg_uber_booking_data') }} AS b
    ON u.customer_id = b.customer_id
)
SELECT *
FROM customer_data
