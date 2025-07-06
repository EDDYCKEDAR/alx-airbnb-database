# Optimization Report for Booking Query

## Initial Query
The query joined four tables: `Booking`, `User`, `Property`, and `Payment`, returning detailed booking info.

## Performance Issues
- No indexes on `user_id`, `property_id`, or `booking_id` columns.
- The join operations required full table scans.
- Fetching unused fields increased payload size.

## Optimization Steps
- Added indexes on `Booking.user_id`, `Booking.property_id`, and `Payment.booking_id`.
- Removed unnecessary columns from SELECT.
- Retained LEFT JOIN for payments to keep bookings without payments.

## Results After Optimization
- Query execution time significantly reduced after indexing.
- `EXPLAIN ANALYZE` showed use of index scan instead of sequential scan.
- Optimized query is more efficient and scalable.
