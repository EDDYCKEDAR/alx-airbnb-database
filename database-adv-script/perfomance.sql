-- Initial Complex Query (before optimization)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.city,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;

-- Create indexes to improve performance
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Optimized Query (after analyzing with EXPLAIN)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.city,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;
