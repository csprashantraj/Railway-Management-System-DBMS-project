-- Table Creation
create table station(
  station_id numeric primary key,
  station_name varchar(20),
  station_type varchar(10)
);

create table train(
  train_no numeric(5) primary key,
  train_name varchar(20),
  start_time timestamp,
  end_time timestamp,
  start_station_code numeric,
  end_station_code numeric,
  foreign key(start_station_code) references station(station_id),
  foreign key(end_station_code) references station(station_id)
);

create table route(
  route_id numeric,
  sequence_no numeric,
  train_no numeric(5),
  station_id numeric,
  arrival_time timestamp,
  departure_time timestamp,
  distance_from_origin numeric,
  foreign key(train_no) references train(train_no),
  foreign key(station_id) references station(station_id),
  primary key(route_id,sequence_no)
);

create table class_info(
  class_id varchar(3),
  train_no numeric(5),
  seats_per_coach numeric,
  foreign key(train_no) references train(train_no),
  primary key(class_id,train_no)
);

create table train_fare(
  train_no numeric(5),
  class_id varchar(3),
  fixed_charge numeric,
  distance_charge numeric,
  foreign key(class_id,train_no) references class_info(class_id,train_no),
  primary key(train_no,class_id)
);

create table coach(
  coach_no varchar(3),
  train_no numeric(5),
  class_id varchar(3),
  foreign key(class_id,train_no) references class_info(class_id,train_no),
  primary key(coach_no,train_no)
);

create table login_details(
  username varchar(15),
  name varchar(20),
  mobile_number numeric(10),
  primary key(username)
);

create table ticket(
  pnr numeric(10) primary key,
  date_of_travel date,
  boarding_station numeric,
  destination_station numeric,
  train_no numeric(5),
  fare numeric,
  username varchar(15),
  class_id varchar(3),
  foreign key(boarding_station) references station(station_id),
  foreign key(destination_station) references station(station_id),
  foreign key(username) references login_details(username),
  foreign key(train_no,class_id) references class_info(train_no,class_id)
);

create table payment(
  payment_id numeric primary key,
  pnr numeric(10),
  payment_date date,
  payment_amount numeric,
  payment_mode varchar(20),
  foreign key(pnr) references ticket(pnr)
);

create table passenger(
  pnr numeric(10),
  name varchar(20),
  age numeric,
  gender varchar(1),
  mobile_no numeric(10),
  status varchar(8),
  foreign key (pnr) references ticket(pnr),
  primary key(pnr,name)
);

create table inwaiting(
    pnr numeric(10) not null,
    name varchar(20) not null,
    waiting_no numeric(2),
    foreign key(pnr, name) references passenger(pnr, name),
    primary key(pnr,waiting_no)
);

create table booked_seat(
  train_no numeric(5),
  seat_no  numeric,
  name varchar(20) not null,
  pnr numeric(10) not null,
  coach_no varchar(3),
  foreign key(pnr,name) references passenger(pnr,name),
  foreign key(coach_no,train_no) references coach(coach_no,train_no),
  primary key(train_no,seat_no,coach_no)
);

-- Data Insertion

-- STATION TABLE 
insert into station values 
(1,'secundrabad','junction'),
(2,'warangal','junction'),
(3,'vijaywada','junction'),
(4,'New Delhi','Central'),
(5,'Ghaziabad','junction'),
(6,'Lucknow','junction');

-- TRAIN TABLE
insert into train values
(18046,'East coast express',to_timestamp('1-04-24 11:20' , 'dd-mm-yy hh:mi'),to_timestamp('2-04-24 10:00','dd-mm-yy hh:mi'),1,3),
(12230,'lucknow mail',to_timestamp('1-04-24 3:20','dd-mm-yy hh:mi'),to_timestamp('2-04-24 5:00','dd-mm-yy hh:mi'),4,6);

-- ROUTE TABLE
insert into route values
(1,1,18046,1,to_timestamp('1-04-24 11:00','dd-mm-yy hh:mi'),to_timestamp('1-04-24 11:20','dd-mm-yy hh:mi'),0),
(1,2,18046,2,to_timestamp('1-04-24 10:00 pm','dd-mm-yy hh:mi pm'),to_timestamp('1-04-24 10:10 pm','dd-mm-yy hh:mi pm'),300),
(1,3,18046,3,to_timestamp('2-04-24 10:00','dd-mm-yy hh:mi'),to_timestamp('2-04-24 10:20','dd-mm-yy hh:mi'),1000),
(2,1,12230,4,to_timestamp('1-04-24 3:00','dd-mm-yy hh:mi'),to_timestamp('1-04-24 3:20','dd-mm-yy hh:mi'),0),
(2,2,12230,5,to_timestamp('1-04-24 5:00 pm','dd-mm-yy hh:mi pm'),to_timestamp('1-04-24 5:15','dd-mm-yy hh:mi pm'),500),
(2,3,12230,6,to_timestamp('2-04-24 5:00','dd-mm-yy hh:mi'),to_timestamp('2-04-24 5:20','dd-mm-yy hh:mi'),1300);

-- CLASS INFO TABLE
insert into class_info values
('2AC',18046,5),
('3AC',18046,5),
('S',18046,5),
('G',18046,5),
('2AC',12230,5),
('3AC',12230,5),
('S',12230,5);

-- TRAIN FARE TABLE
insert into train_fare values
(18046,'2AC',400,18),
(18046,'3AC',300,15),
(18046,'S',200,12),
(18046,'G',50,10),
(12230,'2AC',400,22),
(12230,'3AC',300,20),
(12230,'S',200,15);

-- COACH TABLE
insert into coach values
('A1',18046,'2AC'),
('A2', 18046, '2AC'),
('B1',18046,'3AC'),
('S1',18046,'S'),
('G1',18046,'G'),
('A1',12230,'2AC'),
('B1',12230,'3AC'),
('S1',12230,'S');

-- LOGIN DETAILS TABLE
insert into login_details values
('user1', 'NameA', 9989876609),
('user2', 'NameB', 9856743423),
('user3', 'NameC', 7689504432),
('user4', 'NameD', 8956334567),
('user5', 'NameE', 7654990327),
('user6', 'NameF', 6056443021),
('user7', 'NameG', 6287352111);

-- TICKET TABLE
insert into ticket values
(4122543278, '1-04-24', 1, 3, 18046, 3600, 'user1', '3AC'),
(4122543279, '1-04-24', 1, 3, 18046, 4400, 'user1', '2AC'),
(4122543280, '1-04-24', 2, 3, 18046, 1660, 'user3', '2AC'),
(4122543281, '1-04-24', 1, 2, 18046, 1120, 'user4', 'S'),
(4122543282, '1-04-24', 1, 2, 18046, 1750, 'user4', 'G'),
(4122543288, '1-04-24', 1, 2, 18046, 350, 'user2', 'G'),
(4122543283, '1-04-24', 4, 6, 12230, 5800, 'user2', '3AC'),
(4122543284, '1-04-24', 4, 5, 12230, 3000, 'user5', '2AC'),
(4122543285, '1-04-24', 5, 6, 12230, 2160, 'user2', '2AC'),
(4122543286, '1-04-24', 4, 6, 12230, 3260, 'user6', '2AC'),
(4122543287, '1-04-24', 5, 6, 12230, 7000, 'user7', 'S');

-- PAYMENT TABLE
insert into payment values
(11211, 4122543278, '1-04-24', 3600, 'Debit'),
(11212, 4122543279, '1-04-24', 4400, 'Debit'),
(11213, 4122543280, '1-04-24', 1660, 'UPI'),
(11214, 4122543281, '1-04-24', 1120, 'Debit'),
(11215, 4122543282, '1-04-24', 1750, 'UPI'),
(11216, 4122543283, '1-04-24', 5800, 'UPI'),
(11217, 4122543284, '1-04-24', 3000, 'Debit'),
(11218, 4122543285, '1-04-24', 2160, 'UPI'),
(11219, 4122543286, '1-04-24', 3260, 'Debit'),
(11220, 4122543287, '1-04-24', 7000, 'UPI'),
(11221, 4122543288, '1-04-24', 350, 'Debit');

-- PASSENGER TABLE
insert into passenger values
(4122543278, 'pqr', 24, 'F', 7865443209, 'CNF'),
(4122543278, 'asf', 15, 'M', 8956423198, 'CNF'),
(4122543279, 'muk', 65, 'M', 9988997788, 'CNF'),
(4122543279, 'ytr', 16, 'F', 7899856743, 'CNF'),
(4122543280, 'ear', 60, 'F', 7865549899, 'CNF'),
(4122543281, 'uth', 50, 'M', 8976732432, 'CNF'),
(4122543282, 'jug', 22, 'M', 9867453245, 'CNF'),
(4122543283, 'sol', 29, 'F', 7560984323, 'CNF'),
(4122543284, 'yuh', 34, 'F', 9067342345, 'CNF'),
(4122543285, 'wet', 28, 'M', 8976574342, 'CNF'),
(4122543286, 'her', 60, 'M', 7650098123, 'CNF'),
(4122543287, 'son', 55, 'F', 9067342325, 'CNF'),
(4122543288, 'erf', 40, 'M', 9876598765, 'CNF');

-- INWAITING TABLE
insert into inwaiting values
(4122543278, 'pqr', 1),
(4122543279, 'muk', 1),
(4122543282, 'jug', 1),
(4122543283, 'sol', 1);

-- BOOKED SEAT TABLE
insert into booked_seat values
(18046, 1, 'pqr', 4122543278, 'A1'),
(18046, 1, 'asf', 4122543278, 'A2'),
(18046, 2, 'muk', 4122543279, 'A1'),
(18046, 2, 'ytr', 4122543279, 'A2'),
(18046, 3, 'ear', 4122543280, 'A1'),
(18046, 4, 'uth', 4122543281, 'S1'),
(18046, 5, 'jug', 4122543282, 'G1'),
(12230, 1, 'sol', 4122543283, 'B1'),
(12230, 2, 'yuh', 4122543284, 'A1'),
(12230, 3, 'wet', 4122543285, 'A1'),
(12230, 4, 'her', 4122543286, 'A1'),
(12230, 5, 'son', 4122543287, 'S1'),
(18046, 6, 'erf', 4122543288, 'G1');
