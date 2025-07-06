-- Drop table if exists (for testing purposes)
DROP TABLE IF EXISTS Booking;

-- Recreate the Booking table with RANGE partitioning on start_date
CREATE TABLE Booking (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Sample query using EXPLAIN to observe partition pruning
EXPLAIN SELECT * FROM Booking WHERE start_date BETWEEN '2020-01-01' AND '2020-12-31';

-- Optional: Insert some test data for each partition
-- INSERT INTO Booking VALUES (1, 1, 1, '2020-05-01', '2020-05-10', 'confirmed');
