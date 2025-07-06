-- Task 1: Practice Subqueries
-- File: subqueries.sql

-- 1. Non-correlated subquery: Find all properties where the average rating is greater than 4.0
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            Review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    )
ORDER BY 
    p.property_id;

-- Alternative approach using JOIN with subquery
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location,
    p.pricepernight,
    avg_ratings.avg_rating
FROM 
    Property p
INNER JOIN (
    SELECT 
        property_id,
        AVG(rating) as avg_rating
    FROM 
        Review
    GROUP BY 
        property_id
    HAVING 
        AVG(rating) > 4.0
) avg_ratings ON p.property_id = avg_ratings.property_id
ORDER BY 
    avg_ratings.avg_rating DESC;

-- 2. Correlated subquery: Find users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.created_at
FROM 
    User u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3
ORDER BY 
    u.user_id;

-- Additional correlated subquery: Find users with their booking count
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) as booking_count
FROM 
    User u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3
ORDER BY 
    booking_count DESC;

-- Bonus: Properties with above-average ratings
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            Review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > (
                SELECT AVG(rating) 
                FROM Review
            )
    )
ORDER BY 
    p.property_id;
