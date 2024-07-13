## Explanation of SQL Queries

### Query 1: Find all trains starting from a specific station
```sql
SELECT * FROM train WHERE start_station_code = 1;
```
This query retrieves all trains that start from the station with `station_id` 1.

### Query 2: List all passengers on a specific train
```sql
SELECT passenger.name, passenger.age, passenger.gender, ticket.train_no
FROM passenger
JOIN ticket ON passenger.pnr = ticket.pnr
WHERE ticket.train_no = 18046;
```
This query lists all passengers who have a ticket for the train with train number 18046.

### Query 3: Get the fare details of a particular class in a specific train
```sql
SELECT * FROM train_fare WHERE train_no = 12230 AND class_id = '3AC';
```
This query fetches the fare details for the 3AC class in the train with train number 12230.

### Query 4: Retrieve all stations a specific train stops at
```sql
SELECT station.station_name, route.arrival_time, route.departure_time
FROM route
JOIN station ON route.station_id = station.station_id
WHERE route.train_no = 18046;
```
This query retrieves all stations at which the train with train number 18046 stops, along with the arrival and departure times.

### Query 5: Find all tickets booked by a specific user
```sql
SELECT * FROM ticket WHERE username = 'user1';
```
This query retrieves all tickets booked by the user with the username 'user1'.

### Query 6: List all payments made for a particular ticket
```sql
SELECT * FROM payment WHERE pnr = 4122543278;
```
This query lists all payments made for the ticket with PNR 4122543278.

### Query 7: Show the sequence of stations for a particular train
```sql
SELECT station.station_name, route.sequence_no
FROM route
JOIN station ON route.station_id = station.station_id
WHERE route.train_no = 12230
ORDER BY route.sequence_no;
```
This query shows the sequence of stations for the train with train number 12230, ordered by their sequence number.
