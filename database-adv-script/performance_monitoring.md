# Database Performance Monitoring and Refinement Report

## Objective

To monitor and refine the performance of frequently used queries in the database using profiling tools such as `SHOW PROFILE`, `EXPLAIN`, or `EXPLAIN ANALYZE`. Based on the analysis, we applied optimizations like creating indexes and adjusting schema structure to reduce execution time.

---

## Step 1: Monitoring Query Performance

### Sample Query (Before Optimization)

```sql
SELECT u.name, p.name AS property, b.start_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
WHERE b.start_date BETWEEN '2022-01-01' AND '2022-12-31';
