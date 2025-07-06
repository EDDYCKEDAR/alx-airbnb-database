# Index Performance Optimization

## 🎯 Objective

Improve query performance in the `User`, `Booking`, and `Property` tables by creating appropriate indexes.

---

## 🔍 Step 1: Identify High-Usage Columns

Based on query patterns (e.g., WHERE, JOIN, ORDER BY), the following columns are frequently used:

| Table    | Column         | Purpose                      |
|----------|----------------|------------------------------|
| User     | email, age     | Filtering                    |
| Booking  | user_id, property_id, created_at | JOINs, filtering  |
| Property | location, price| Filtering, sorting           |

---

## 🛠 Step 2: SQL to Create Indexes

See `database_index.sql`:

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_age ON User(age);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property Table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
