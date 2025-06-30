# Database Schema – Airbnb Clone

This directory contains the SQL DDL script used to define the database schema for the Airbnb backend system.

---

## 📁 File: schema.sql

Defines the following tables:

- `Users`: stores user data including role (guest, host, admin)
- `Properties`: listings created by hosts
- `Bookings`: guest bookings for properties
- `Payments`: payments linked to bookings
- `Reviews`: guest feedback on properties
- `Messages`: communication between users

---

## ✅ Features

- Uses `UUID` for primary keys
- Enforces constraints: NOT NULL, UNIQUE, CHECK
- Foreign key relationships between tables
- Indexes on email, foreign keys, and other queried fields
