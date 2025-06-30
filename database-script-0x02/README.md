# ALX Airbnb Database - Sample Data Seed

This directory contains SQL scripts to populate the Airbnb database with realistic sample data for testing and development purposes.

## Files

- `seed.sql` - Main seed script containing INSERT statements for all tables
- `README.md` - This documentation file

## Overview

The seed script populates the database with comprehensive sample data that reflects real-world usage patterns of an Airbnb-like platform.

## Sample Data Structure

### Users (10 records)
- **Hosts**: 4 users who list properties
- **Guests**: 5 users who book properties  
- **Admins**: 1 administrative user
- Includes realistic names, emails, phone numbers, and timestamps
- Passwords are bcrypt hashed (sample hash for demo purposes)

### Properties (7 records)
- Diverse property types: apartments, villas, cabins, lofts, townhouses
- Various locations across the US (NYC, Miami, Aspen, San Francisco, Boston, Phoenix, Lake Tahoe)
- Different price points ranging from $95 to $350 per night
- Detailed descriptions reflecting real property listings
- Properties owned by different hosts

### Bookings (10 records)
- **Confirmed**: 7 bookings (completed payments)
- **Pending**: 2 bookings (awaiting confirmation)
- **Canceled**: 1 booking (demonstrates cancellation workflow)
- Realistic date ranges and total prices
- Mix of short and long stays
- Multiple bookings for same properties (different dates)

### Payments (7 records)
- Payments for all confirmed bookings
- Various payment methods: credit_card, paypal, bank_transfer
- Amounts match booking total prices
- Realistic payment timestamps

### Reviews (6 records)
- Ratings from 1-5 stars
- Detailed comments reflecting real guest experiences
- Mix of positive and constructive feedback
- Reviews for different properties and hosts
- Timestamps after booking completion

### Messages (8 records)
- Communication between hosts and guests
- Pre-arrival inquiries and confirmations
- During-stay questions and responses
- Post-stay thank you messages
- Realistic conversation flow

## Usage Instructions

### Prerequisites
- Ensure your database schema is properly set up
- Have appropriate permissions to insert data
- Backup existing data if needed

### Running the Seed Script

1. **Basic execution:**
   ```bash
   sqlite3 airbnb_database.db < seed.sql
   ```

2. **MySQL:**
   ```bash
   mysql -u username -p database_name < seed.sql
   ```

3. **PostgreSQL:**
   ```bash
   psql -U username -d database_name -f seed.sql
   ```

### Data Verification

After running the script, verify the data was inserted correctly:

```sql
-- Check record counts
SELECT 'Users' as table_name, COUNT(*) as count FROM User
UNION ALL
SELECT 'Properties', COUNT(*) FROM Property
UNION ALL
SELECT 'Bookings', COUNT(*) FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Review
UNION ALL
SELECT 'Messages', COUNT(*) FROM Message;

-- Check booking statuses
SELECT status, COUNT(*) as count 
FROM Booking 
GROUP BY status;

-- Check average ratings
SELECT 
    AVG(rating) as average_rating,
    MIN(rating) as min_rating,
    MAX(rating) as max_rating
FROM Review;
```

## Data Relationships

The sample data maintains proper foreign key relationships:

- **Users → Properties**: Hosts own multiple properties
- **Users → Bookings**: Guests make multiple bookings
- **Properties → Bookings**: Properties have multiple bookings
- **Bookings → Payments**: Confirmed bookings have payments
- **Properties → Reviews**: Properties receive reviews from guests
- **Users → Messages**: Communication between hosts and guests

## Sample Scenarios Covered

1. **Multi-property hosts**: Some hosts manage multiple properties
2. **Repeat guests**: Guests who book multiple properties
3. **Seasonal patterns**: Bookings spread across different months
4. **Price variations**: Different property price points
5. **Booking lifecycle**: Pending, confirmed, and canceled bookings
6. **Payment methods**: Various payment options
7. **Review patterns**: Range of ratings and detailed feedback
8. **Communication flow**: Host-guest messaging

## Customization

### Adding More Data

To add additional sample data:

1. Follow the existing ID patterns (u011, p008, b011, etc.)
2. Maintain foreign key relationships
3. Use realistic data values
4. Update the summary queries

### Modifying Existing Data

To modify the sample data:

1. Edit the relevant INSERT statements
2. Ensure foreign key constraints are maintained
3. Update related records if necessary
4. Test the changes before committing

### Database-Specific Considerations

#### SQLite
- Uses `PRAGMA foreign_keys = ON;` to enforce constraints
- Date/time format: 'YYYY-MM-DD HH:MM:SS'

#### MySQL
- May need to adjust date/time formats
- Consider timezone settings

#### PostgreSQL
- May need to adjust UUID formats if using UUID primary keys
- Consider sequence management for auto-incrementing IDs

## Data Privacy and Security

- All email addresses are example domains
- Phone numbers use reserved number ranges
- Passwords are hashed (though using same hash for demo)
- Personal information is fictional

## Testing Scenarios

This seed data enables testing of:

- User registration and authentication flows
- Property listing and search functionality
- Booking creation and management
- Payment processing workflows
- Review and rating systems
- Messaging between users
- Administrative operations
- Reporting and analytics queries

## Maintenance

- Regularly update the seed data to reflect current business requirements
- Add new scenarios as the application evolves
- Maintain consistency with schema changes
- Document any modifications in this README

## Support

For questions or issues with the seed data:
1. Check the database schema compatibility
2. Verify foreign key constraints
3. Review the sample queries in this README
4. Consult the main project documentation

---

**Note**: This is sample data for development and testing purposes only. Do not use in production environments.
