# Booking Table Partitioning Performance Report

## Objective
To improve the performance of queries on the large `Booking` table by implementing partitioning on the `start_date` column.

## Partitioning Strategy
The `Booking` table was partitioned by `RANGE` on the `YEAR(start_date)`:

- Partition `p2019`: Bookings before 2020
- Partition `p2020`: Bookings in 2020
- Partition `p2021`: Bookings in 2021
- Partition `p2022`: Bookings in 2022
- Partition `pmax`: Bookings in or after 2023

This allows queries with date filters to only scan relevant partitions.

## Performance Analysis

We used the following query for benchmarking:

```sql
EXPLAIN SELECT * FROM Booking WHERE start_date BETWEEN '2020-01-01' AND '2020-12-31';

