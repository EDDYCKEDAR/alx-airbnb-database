-- Task 3: Implement Indexes for Optimization
-- File: database_index.sql

-- Create indexes for high-usage columns in User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_phone ON User(phone_number);
CREATE INDEX idx_user_created_at ON User(created_at);

-- Create indexes for high-usage columns in Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);
CREATE INDEX idx_booking_user_date ON Booking(user_id, start_date);

-- Create indexes for high-usage columns in Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_created_at ON Property(created_at);

-- Create indexes for Review table
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);
CREATE INDEX idx_review_created_at ON Review(created_at);

-- Create indexes for Payment table
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_amount ON Payment(amount);
CREATE INDEX idx_payment_method ON Payment(payment_method);
CREATE INDEX idx_payment_date ON Payment(payment_date);

-- Create indexes for Message table
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
CREATE INDEX idx_message_sent_at ON Message(sent_at);

-- Composite indexes for common query patterns
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
CREATE INDEX idx_review_property_rating ON Review(property_id, rating);
CREATE INDEX idx_property_location_price ON Property(location, pricepernight);

-- Full-text search indexes (if supported)
-- CREATE FULLTEXT INDEX idx_property_name_description ON Property(name, description);
-- CREATE FULLTEXT INDEX idx_review_comment ON Review(comment);

-- Performance measurement queries (run before and after creating indexes)

-- Query 1: Find all bookings for a specific user
-- EXPLAIN ANALYZE
SELECT b.*, p.name as property_name
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE b.user_id = 'user_id_here'
ORDER BY b.start_date DESC;

-- Query 2: Find properties in a specific location with price range
-- EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'New York' 
AND pricepernight BETWEEN 100 AND 300
ORDER BY pricepernight ASC;

-- Query 3: Find average rating for properties
-- EXPLAIN ANALYZE
SELECT p.property_id, p.name, AVG(r.rating) as avg_rating
FROM Property p
JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) > 4.0
ORDER BY avg_rating DESC;

-- Query 4: Find bookings within date range
-- EXPLAIN ANALYZE
SELECT b.*, u.first_name, u.last_name, p.name as property_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2023-01-01' 
AND b.end_date <= '2023-12-31'
ORDER BY b.start_date;

-- Query 5: Find top-rated properties with booking count
-- EXPLAIN ANALYZE
SELECT p.property_id, p.name, 
       COUNT(b.booking_id) as booking_count,
       AVG(r.rating) as avg_rating
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
LEFT JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) >= 4.0
ORDER BY avg_rating DESC, booking_count DESC;
