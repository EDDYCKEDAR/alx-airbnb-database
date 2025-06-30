
# Database Normalization – Airbnb Clone (Up to 3NF)

This document outlines the normalization process applied to the Airbnb Clone backend database to eliminate redundancy and improve data integrity.

---

##  First Normal Form (1NF)

**Rule:** Each table must have a primary key and all attributes must be atomic (no repeating groups or arrays).

###  Applied:
- All attributes are atomic (e.g., no multiple emails or roles in one field).
- Primary keys are clearly defined (e.g., `user_id`, `property_id`, etc.).
- Fields like `location`, `description`, and `pricepernight` are stored in single-value columns.

** All tables are in 1NF.**

---

##  Second Normal Form (2NF)

**Rule:** Must be in 1NF + No partial dependency (non-key attributes depend on whole primary key).

###  Applied:
- All tables have **single-column primary keys** (UUIDs), so no composite key issues.
- All non-key attributes depend fully on their table's primary key.

** All tables are in 2NF.**

---

##  Third Normal Form (3NF)

**Rule:** Must be in 2NF + No transitive dependency (non-key attributes do not depend on other non-key attributes).

### Review Example: `User` Table
```text
user_id | first_name | last_name | email | password_hash | phone_number | role | created_at
```

- No derived fields (e.g., full name isn’t stored).
- `role` is atomic and stored as an ENUM, not repeating or derived.

###  Review Example: `Booking` Table
```text
booking_id | property_id | user_id | start_date | end_date | total_price | status | created_at
```

- `total_price` is derived, but acceptable in systems where pricing might change over time and audit is needed.

**Note:** Alternatively, you could recompute `total_price` at runtime using `pricepernight × nights` to eliminate redundancy. This depends on design choice.

---

## Adjustments Made:

- Replaced any composite keys with UUIDs.
- nsured ENUMs are used correctly (e.g., role, status, payment method).
- No multivalued fields or calculated fields stored unnecessarily.
- All foreign key relationships clearly reference primary keys.

---

## Conclusion

All entities are normalized to **Third Normal Form (3NF)** with no redundancy or update anomalies. This enhances data integrity and scalability for the Airbnb backend system.
