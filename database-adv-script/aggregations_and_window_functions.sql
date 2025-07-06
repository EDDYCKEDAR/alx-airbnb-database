-- Task 2: Apply Aggregations and Window Functions
-- File: aggregations_and_window_functions.sql

-- 1. Find the total number of bookings made by each user using COUNT and GROUP BY
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) as total_bookings,
    SUM(b.total_price) as total_spent,
    AVG(b.total_price) as avg_booking_value
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC, total_spent DESC;

-- 2. Use window functions to rank properties based on total bookings
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    COUNT(b.booking_id) as total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) as row_number,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) as rank_position,
    DENSE_RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) as dense_rank_position
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.location, p.pricepernight
ORDER BY 
    total_bookings DESC;

-- 3. Advanced window functions: Running totals and moving averages
SELECT 
    b.booking_id,
    b.user_id,
    b.property_id,
    b.start_date,
    b.total_price,
    SUM(b.total_price) OVER (
        PARTITION BY b.user_id 
        ORDER BY b.start_date
    ) as running_total_spent,
    AVG(b.total_price) OVER (
        PARTITION BY b.user_id 
        ORDER BY b.start_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as moving_avg_3_bookings,
    LAG(b.total_price, 1) OVER (
        PARTITION BY b.user_id 
        ORDER BY b.start_date
    ) as previous_booking_price,
    LEAD(b.total_price, 1) OVER (
        PARTITION BY b.user_id 
        ORDER BY b.start_date
    ) as next_booking_price
FROM 
    Booking b
ORDER BY 
    b.user_id, b.start_date;

-- 4. Property performance analysis with window functions
SELECT 
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) as total_bookings,
    AVG(r.rating) as avg_rating,
    SUM(b.total_price) as total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(b.total_price) DESC) as revenue_rank,
    ROW_NUMBER() OVER (ORDER BY AVG(r.rating) DESC) as rating_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_count_rank,
    NTILE(4) OVER (ORDER BY SUM(b.total_price) DESC) as revenue_quartile
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
LEFT JOIN 
    Review r ON p.property_id = r.property_id
GROUP BY 
    p.property_id, p.name, p.location
HAVING 
    COUNT(b.booking_id) > 0
ORDER BY 
    total_revenue DESC;

-- 5. Monthly booking trends
SELECT 
    YEAR(b.start_date) as booking_year,
    MONTH(b.start_date) as booking_month,
    COUNT(b.booking_id) as monthly_bookings,
    SUM(b.total_price) as monthly_revenue,
    AVG(b.total_price) as avg_booking_value,
    LAG(COUNT(b.booking_id), 1) OVER (
        ORDER BY YEAR(b.start_date), MONTH(b.start_date)
    ) as previous_month_bookings,
    ((COUNT(b.booking_id) - LAG(COUNT(b.booking_id), 1) OVER (
        ORDER BY YEAR(b.start_date), MONTH(b.start_date)
    )) / LAG(COUNT(b.booking_id), 1) OVER (
        ORDER BY YEAR(b.start_date), MONTH(b.start_date)
    )) * 100 as month_over_month_growth
FROM 
    Booking b
GROUP BY 
    YEAR(b.start_date), MONTH(b.start_date)
ORDER BY 
    booking_year, booking_month;
