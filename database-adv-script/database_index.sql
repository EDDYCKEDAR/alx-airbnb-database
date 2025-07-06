-- Measure query performance BEFORE creating indexes
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'user@example.com';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN ANALYZE SELECT * FROM Property WHERE city = 'New York';

-- Create indexes on high-usage columns
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_property_city ON Property(city);

-- Measure query performance AFTER creating indexes
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'user@example.com';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN ANALYZE SELECT * FROM Property WHERE city = 'New York';
