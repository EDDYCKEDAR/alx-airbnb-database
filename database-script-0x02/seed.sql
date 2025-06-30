-- ALX Airbnb Database - Sample Data Seed Script
-- This script populates the database with realistic sample data

-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- Clear existing data (optional - uncomment if needed)
-- DELETE FROM Payment;
-- DELETE FROM Review;
-- DELETE FROM Booking;
-- DELETE FROM Property;
-- DELETE FROM User;

-- Insert Users (mix of hosts and guests)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('u001', 'John', 'Smith', 'john.smith@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0101', 'host', '2023-01-15 10:30:00'),
('u002', 'Emma', 'Johnson', 'emma.johnson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0102', 'guest', '2023-02-20 14:45:00'),
('u003', 'Michael', 'Brown', 'michael.brown@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0103', 'host', '2023-01-28 09:15:00'),
('u004', 'Sarah', 'Davis', 'sarah.davis@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0104', 'guest', '2023-03-10 16:20:00'),
('u005', 'David', 'Wilson', 'david.wilson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0105', 'host', '2023-02-05 11:30:00'),
('u006', 'Lisa', 'Garcia', 'lisa.garcia@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0106', 'guest', '2023-03-25 13:45:00'),
('u007', 'James', 'Martinez', 'james.martinez@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0107', 'admin', '2023-01-01 08:00:00'),
('u008', 'Amanda', 'Anderson', 'amanda.anderson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0108', 'guest', '2023-04-12 12:30:00'),
('u009', 'Robert', 'Taylor', 'robert.taylor@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0109', 'host', '2023-02-18 15:20:00'),
('u010', 'Jessica', 'Thomas', 'jessica.thomas@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeIvM7hVBGJ/9mP2q', '+1-555-0110', 'guest', '2023-05-08 10:15:00');

-- Insert Properties (various types and locations)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('p001', 'u001', 'Cozy Downtown Apartment', 'Modern 2-bedroom apartment in the heart of downtown. Walking distance to restaurants, shops, and attractions. Perfect for business travelers and couples.', 'New York, NY', 120.00, '2023-01-20 14:30:00', '2023-01-20 14:30:00'),
('p002', 'u003', 'Beachfront Villa', 'Stunning 4-bedroom villa with ocean views. Private beach access, swimming pool, and outdoor dining area. Ideal for families and groups.', 'Miami, FL', 350.00, '2023-02-05 16:45:00', '2023-02-05 16:45:00'),
('p003', 'u005', 'Mountain Cabin Retreat', 'Rustic 3-bedroom cabin nestled in the mountains. Fireplace, hot tub, and hiking trails nearby. Perfect for nature lovers and retreat groups.', 'Aspen, CO', 200.00, '2023-02-15 11:20:00', '2023-02-15 11:20:00'),
('p004', 'u001', 'Urban Loft Studio', 'Stylish studio loft with exposed brick walls and city views. Modern amenities and excellent public transport connections.', 'San Francisco, CA', 95.00, '2023-03-01 09:30:00', '2023-03-01 09:30:00'),
('p005', 'u009', 'Historic Townhouse', 'Charming 3-bedroom townhouse in historic district. Original hardwood floors, updated kitchen, and private garden.', 'Boston, MA', 180.00, '2023-03-10 13:15:00', '2023-03-10 13:15:00'),
('p006', 'u003', 'Desert Oasis', 'Luxury 2-bedroom desert home with pool and spa. Stunning sunset views and modern southwestern design.', 'Phoenix, AZ', 150.00, '2023-03-20 10:45:00', '2023-03-20 10:45:00'),
('p007', 'u005', 'Lakefront Cottage', 'Cozy 2-bedroom cottage on pristine lake. Kayaks included, fishing dock, and peaceful surroundings.', 'Lake Tahoe, CA', 175.00, '2023-04-05 12:00:00', '2023-04-05 12:00:00');

-- Insert Bookings (multiple bookings showing different statuses)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b001', 'p001', 'u002', '2024-01-15', '2024-01-18', 360.00, 'confirmed', '2023-12-20 10:30:00'),
('b002', 'p002', 'u004', '2024-02-10', '2024-02-17', 2450.00, 'confirmed', '2024-01-15 14:20:00'),
('b003', 'p003', 'u006', '2024-03-05', '2024-03-08', 600.00, 'confirmed', '2024-02-10 16:45:00'),
('b004', 'p001', 'u008', '2024-04-20', '2024-04-23', 360.00, 'pending', '2024-04-10 11:15:00'),
('b005', 'p004', 'u002', '2024-05-12', '2024-05-15', 285.00, 'confirmed', '2024-04-25 09:30:00'),
('b006', 'p005', 'u010', '2024-06-01', '2024-06-05', 720.00, 'confirmed', '2024-05-15 13:45:00'),
('b007', 'p006', 'u004', '2024-07-10', '2024-07-14', 600.00, 'canceled', '2024-06-20 15:20:00'),
('b008', 'p007', 'u006', '2024-08-15', '2024-08-18', 525.00, 'pending', '2024-07-30 12:10:00'),
('b009', 'p002', 'u008', '2024-09-05', '2024-09-12', 2450.00, 'confirmed', '2024-08-10 14:30:00'),
('b010', 'p003', 'u010', '2024-10-20', '2024-10-25', 1000.00, 'confirmed', '2024-09-25 10:45:00');

-- Insert Payments (corresponding to confirmed bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay001', 'b001', 360.00, '2023-12-20 10:35:00', 'credit_card'),
('pay002', 'b002', 2450.00, '2024-01-15 14:25:00', 'paypal'),
('pay003', 'b003', 600.00, '2024-02-10 16:50:00', 'credit_card'),
('pay004', 'b005', 285.00, '2024-04-25 09:35:00', 'credit_card'),
('pay005', 'b006', 720.00, '2024-05-15 13:50:00', 'bank_transfer'),
('pay006', 'b009', 2450.00, '2024-08-10 14:35:00', 'credit_card'),
('pay007', 'b010', 1000.00, '2024-09-25 10:50:00', 'paypal');

-- Insert Reviews (for completed stays)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('r001', 'p001', 'u002', 5, 'Amazing location and beautiful apartment! John was an excellent host and very responsive. The place was exactly as described and perfectly clean. Would definitely stay here again!', '2024-01-20 15:30:00'),
('r002', 'p002', 'u004', 4, 'Gorgeous beachfront property with stunning views. The villa was spacious and well-equipped. Only minor issue was the pool heater not working, but Michael quickly resolved it. Great for families!', '2024-02-20 11:45:00'),
('r003', 'p003', 'u006', 5, 'Perfect mountain getaway! The cabin was cozy and had everything we needed. The hot tub was amazing after long hikes. David provided excellent local recommendations. Highly recommend!', '2024-03-12 14:20:00'),
('r004', 'p005', 'u010', 4, 'Lovely historic townhouse in a great neighborhood. Easy walk to attractions and restaurants. The garden was a nice touch. Robert was very helpful throughout our stay.', '2024-06-08 16:30:00'),
('r005', 'p001', 'u008', 3, 'Good location but the apartment showed some wear. The heating was inconsistent and the WiFi was slow. Host was responsive to our concerns though.', '2024-04-26 10:15:00'),
('r006', 'p004', 'u002', 5, 'Fantastic urban loft with amazing city views! Perfect for a weekend getaway. The space was modern and stylish. Great value for the location. Will book again!', '2024-05-18 13:45:00');

-- Insert Messages (communication between hosts and guests)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('m001', 'u002', 'u001', 'Hi John! I have a booking coming up next week. Could you please confirm the check-in process?', '2024-01-10 14:30:00'),
('m002', 'u001', 'u002', 'Hi Emma! Thanks for your message. Check-in is at 3 PM. I will send you the access code the day before your arrival. Looking forward to hosting you!', '2024-01-10 15:15:00'),
('m003', 'u004', 'u003', 'Hello Michael! We are excited about our Miami trip. Is it possible to arrange early check-in around 1 PM?', '2024-02-08 11:20:00'),
('m004', 'u003', 'u004', 'Hi Sarah! I can arrange early check-in for 1 PM. The cleaning crew will be finished by then. See you soon!', '2024-02-08 12:45:00'),
('m005', 'u006', 'u005', 'Hi David, we loved the cabin! Is there a grocery store nearby for supplies?', '2024-03-06 09:30:00'),
('m006', 'u005', 'u006', 'So glad you are enjoying it! Yes, there is a grocery store about 5 minutes drive down the mountain. I have left a local guide in the cabin with all the details.', '2024-03-06 10:15:00'),
('m007', 'u010', 'u009', 'Robert, thank you for the wonderful stay! The townhouse exceeded our expectations.', '2024-06-06 16:45:00'),
('m008', 'u009', 'u010', 'Jessica, it was a pleasure hosting you! Thank you for leaving the place so tidy. You are welcome back anytime!', '2024-06-06 17:30:00');

-- Display summary of inserted data
SELECT 'Data insertion completed successfully!' as Status;

SELECT 
    'Users' as Table_Name, 
    COUNT(*) as Record_Count,
    COUNT(CASE WHEN role = 'host' THEN 1 END) as Hosts,
    COUNT(CASE WHEN role = 'guest' THEN 1 END) as Guests,
    COUNT(CASE WHEN role = 'admin' THEN 1 END) as Admins
FROM User
UNION ALL
SELECT 'Properties', COUNT(*), NULL, NULL, NULL FROM Property
UNION ALL
SELECT 'Bookings', COUNT(*), 
    COUNT(CASE WHEN status = 'confirmed' THEN 1 END),
    COUNT(CASE WHEN status = 'pending' THEN 1 END),
    COUNT(CASE WHEN status = 'canceled' THEN 1 END)
FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*), NULL, NULL, NULL FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*), NULL, NULL, NULL FROM Review
UNION ALL
SELECT 'Messages', COUNT(*), NULL, NULL, NULL FROM Message;
