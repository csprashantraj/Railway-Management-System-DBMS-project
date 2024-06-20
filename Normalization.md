# Normalization

Normalization is a database design technique that reduces data redundancy and ensures data integrity. This document outlines the normalization process for the Railway Reservation System database, explaining how each table is normalized to the highest normal form (BCNF).

## 1. Station Table

### Attributes:
- station_id
- station_name
- station_type

### Normalization:
- **First Normal Form (1NF):** The table has atomic columns.
- **Second Normal Form (2NF):** The table has a primary key and no partial dependencies.
- **Third Normal Form (3NF):** There are no transitive dependencies.
- **Boyce-Codd Normal Form (BCNF):** Every determinant is a candidate key.

### Result:
This table is in BCNF because every attribute is functionally dependent on the primary key (station_id).

## 2. Train Table

### Attributes:
- train_no
- train_name
- start_time
- end_time
- start_station_code
- end_station_code

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because every attribute is functionally dependent on the primary key (train_no).

## 3. Route Table

### Attributes:
- route_id
- sequence_no
- train_no
- station_id
- arrival_time
- departure_time
- distance_from_origin

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (route_id, sequence_no).

## 4. Class Table

### Attributes:
- class_id
- train_no
- seats_per_coach

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (class_id, train_no).

## 5. Train Fare Table

### Attributes:
- train_no
- class_id
- fixed_charge
- distance_charge

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (train_no, class_id).

## 6. Coach Table

### Attributes:
- coach_no
- train_no
- class_id

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (coach_no, train_no).

## 7. Login Details Table

### Attributes:
- username
- name
- mobile_number

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because every attribute is functionally dependent on the primary key (username).

## 8. Ticket Table

### Attributes:
- pnr
- date_of_travel
- boarding_station
- destination_station
- train_no
- fare
- username
- class_id

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the primary key (pnr).

## 9. Payment Table

### Attributes:
- payment_id
- pnr
- payment_date
- payment_amount
- payment_mode

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the primary key (payment_id).

## 10. Passenger Table

### Attributes:
- pnr
- name
- age
- gender
- mobile_no
- status

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (pnr, name).

## 11. Waiting List Table

### Attributes:
- pnr
- name
- waiting_no

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (pnr, waiting_no).

## 12. Booked Seat Table

### Attributes:
- train_no
- seat_no
- name
- pnr
- coach_no

### Normalization:
- **1NF:** The table has atomic columns.
- **2NF:** The table has a composite primary key and no partial dependencies.
- **3NF:** There are no transitive dependencies.
- **BCNF:** Every determinant is a candidate key.

### Result:
This table is in BCNF because all attributes are functionally dependent on the composite primary key (train_no, seat_no, coach_no).
