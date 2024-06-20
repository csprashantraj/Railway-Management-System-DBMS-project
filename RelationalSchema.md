# Relational Schema

This document provides the detailed relational schema for the Railway Reservation System database, including table definitions, primary keys, and foreign keys.

## Station Table
The `Station` table stores information about railway stations.

```sql
CREATE TABLE Station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL,
    station_type VARCHAR(255) NOT NULL
);
```
Primary Key: `station_id`

## Train Table
The `Train` table stores information about trains.

```sql
CREATE TABLE Train (
    train_no INT PRIMARY KEY,
    train_name VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    start_station_code INT NOT NULL,
    end_station_code INT NOT NULL,
    FOREIGN KEY (start_station_code) REFERENCES Station(station_id),
    FOREIGN KEY (end_station_code) REFERENCES Station(station_id)
);
```
Primary Key: train_no
Foreign Keys: `start_station_code` references `Station(station_id)`, `end_station_code` references `Station(station_id)`


## Route Table
The `Route` table stores information about train routes.

```sql
CREATE TABLE Route (
    route_id INT,
    sequence_no INT,
    train_no INT,
    station_id INT,
    arrival_time TIMESTAMP,
    departure_time TIMESTAMP,
    distance_from_origin INT,
    PRIMARY KEY (route_id, sequence_no),
    FOREIGN KEY (train_no) REFERENCES Train(train_no),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);
```
Primary Key: `(route_id, sequence_no)`
Foreign Keys: `train_no` references `Train(train_no)`, `station_id` references `Station(station_id)`

## Class Table
The `Class` table stores information about the classes available on each train.

```sql
CREATE TABLE Class (
    class_id INT,
    train_no INT,
    seats_per_coach INT,
    PRIMARY KEY (class_id, train_no),
    FOREIGN KEY (train_no) REFERENCES Train(train_no)
);
```
Primary Key: `(class_id, train_no)`
Foreign Key: `train_no` references `Train(train_no)`


## Train Fare Table
The `Train_fare` table stores fare details for different classes on each train.
```sql
CREATE TABLE Train_fare (
    train_no INT,
    class_id INT,
    fixed_charge DECIMAL(10, 2),
    distance_charge DECIMAL(10, 2),
    PRIMARY KEY (train_no, class_id),
    FOREIGN KEY (train_no) REFERENCES Train(train_no),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);
```
Primary Key: `(train_no, class_id)`
Foreign Keys: `train_no` references `Train(train_no)`, `class_id` references `Class(class_id)`


## Coach Table
The `Coach` table stores information about the coaches on each train.
```sql
CREATE TABLE Coach (
    coach_no INT,
    train_no INT,
    class_id INT,
    PRIMARY KEY (coach_no, train_no),
    FOREIGN KEY (train_no) REFERENCES Train(train_no),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);
```
Primary Key: `(coach_no, train_no)`
Foreign Keys: `train_no` references `Train(train_no)`, `class_id` references `Class(class_id)`

## Login Details Table
The `Login_details` table stores user login information.
```sql
CREATE TABLE Login_details (
    username VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile_number VARCHAR(20) NOT NULL
);
```
Primary Key: `username`

## Ticket Table
The `Ticket` table stores information about tickets booked by passengers.
```sql
CREATE TABLE Ticket (
    pnr INT PRIMARY KEY,
    date_of_travel DATE NOT NULL,
    boarding_station INT NOT NULL,
    destination_station INT NOT NULL,
    train_no INT NOT NULL,
    fare DECIMAL(10, 2) NOT NULL,
    username VARCHAR(255) NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (boarding_station) REFERENCES Station(station_id),
    FOREIGN KEY (destination_station) REFERENCES Station(station_id),
    FOREIGN KEY (train_no) REFERENCES Train(train_no),
    FOREIGN KEY (username) REFERENCES Login_details(username),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);
```
Primary Key: `pnr`
Foreign Keys: `boarding_station` references `Station(station_id)`, `destination_station` references `Station(station_id)`, `train_no` references `Train(train_no)`, `username` references `Login_details(username)`, `class_id` references `Class(class_id)`

## Payment Table
The `Payment` table stores information about payments made for tickets.
```sql
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    pnr INT NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_mode VARCHAR(50) NOT NULL,
    FOREIGN KEY (pnr) REFERENCES Ticket(pnr)
);
```
Primary Key: `payment_id`
Foreign Key: `pnr` references `Ticket(pnr)`

## Passenger Table
The `Passenger` table stores information about passengers associated with a PNR.
```sql
CREATE TABLE Passenger (
    pnr INT,
    name VARCHAR(255),
    age INT,
    gender VARCHAR(10),
    mobile_no VARCHAR(20),
    status VARCHAR(50),
    PRIMARY KEY (pnr, name),
    FOREIGN KEY (pnr) REFERENCES Ticket(pnr)
);
```
Primary Key: `(pnr, name)`
Foreign Key: `pnr` references `Ticket(pnr)`

## Waiting List Table
The `Inwaiting` table stores information about passengers on the waiting list.
```sql
CREATE TABLE Inwaiting (
    pnr INT,
    name VARCHAR(255),
    waiting_no INT,
    PRIMARY KEY (pnr, waiting_no),
    FOREIGN KEY (pnr) REFERENCES Passenger(pnr),
    FOREIGN KEY (name) REFERENCES Passenger(name)
);
```
Primary Key: `(pnr, waiting_no)`
Foreign Keys: `pnr` references `Passenger(pnr)`, `name` references `Passenger(name)`

## Booked Seat Table
The `Booked_seat` table stores information about booked seats on trains.
```sql

CREATE TABLE Booked_seat (
    train_no INT,
    seat_no INT,
    name VARCHAR(255),
    pnr INT,
    coach_no INT,
    PRIMARY KEY (train_no, seat_no, coach_no),
    FOREIGN KEY (train_no) REFERENCES Train(train_no),
    FOREIGN KEY (coach_no) REFERENCES Coach(coach_no),
    FOREIGN KEY (pnr) REFERENCES Ticket(pnr),
    FOREIGN KEY (name) REFERENCES Passenger(name)
);
```
Primary Key: `(train_no, seat_no, coach_no)`
Foreign Keys: `train_no` references `Train(train_no)`, `coach_no` references `Coach(coach_no)`, `pnr` references `Ticket(pnr)`, `name` references `Passenger(name)`

```sql
This `RelationalSchema.md` file provides a comprehensive overview of the database schema for the Railway Reservation System, detailing each table along with their primary keys and foreign keys. This document is essential for understanding the structure and relationships within the database.
```
