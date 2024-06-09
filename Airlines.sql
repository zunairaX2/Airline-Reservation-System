create database AirlineReservationSystem
use AirlineReservationSystem
go

create table Details_Of_Airline(
id_of_airline     int primary key identity(1,1),
name_of_airline   nvarchar(30) not null,
total_no_of_seats int not null,
from_location     nvarchar(50) not null,
to_location       nvarchar(50) not null,
departure_time    time not null,
arrival_time      time not null,
flight_duration   nvarchar(20) not null
)
create table Flight(
flight_id               int primary key identity(1,1),
departure_date          date not null,
price_of_ticket         money default 20000 not null,
available_economy_seats int not null,
available_vip_seats     int not null
)
Select * from Flight

create table Det_Airline_Flight(
id_of_airline int foreign key references Details_Of_Airline(id_of_airline),
flight_id  int foreign key references Flight(flight_id),
constraint cpk_DAF primary key(id_of_airline, flight_id)
)
create table Ticket_Booking_Info(
ticket_id        int primary key identity(1,1),
status_of_ticket nvarchar(50) not null
)

create table Flight_And_Ticket(
flight_id  int foreign key references Flight(flight_id),
ticket_id  int foreign key references Ticket_Booking_Info(ticket_id),
constraint cpk_FAT primary key(flight_id, ticket_id)
)

create table Passenger_Info(
passenger_id   int primary key identity(1,1),
first_name     nvarchar(50) not null,
middle_name    nvarchar(50),
last_name      nvarchar(50) not null,
age            int not null,
gender         nvarchar(20),
phone_no       nvarchar(12) unique check(phone_no like('0[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))not null,
cnic_no        nvarchar(15) unique check(cnic_no like('[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9]')) not null,
email_id       nvarchar(100) unique check(email_id like('___%@__%.__%')) not null,
passenger_type nvarchar(50) not null,
nationality    nvarchar(50) not null,
religion       nvarchar(40) not null
)

create table Passenger_And_Ticket(
passenger_id int foreign key references Passenger_Info(passenger_id),
ticket_id    int foreign key references  Ticket_Booking_Info(ticket_id),
constraint   cpk_PAT primary key(passenger_id,ticket_id)
)

create table Payment_Details(
payment_id int primary key identity(1,1),
passenger_id      int foreign key references Passenger_Info(passenger_id),
payment_card_type nvarchar(30) not null,
payment_card_no   nvarchar(30) not null,
card_expiry       date not null
)


insert into Details_Of_Airline(name_of_airline,total_no_of_seats,from_location,to_location,
departure_time,arrival_time,flight_duration)
values ('PIA' ,           90 , 'Pakistan',  'Dubai' ,      '03:15:25:111', '07:30:33:111' , '3hrs'),
       ('Fly Emirates' ,  80 , 'Malaysia',  'Pakistan' ,   '12:15:30:111', '09:35:36:111' , '10hrs'),
	   ('Qatar Airways' , 70 , 'Indonesia', 'America' ,    '08:30:35:111', '02:30:33:111' , '12hrs'),
	   ('PIA' ,           65 , 'America',   'Dubai' ,      '10:20:40:111', '03:30:33:111' , '17hrs'),
	   ('Air Blue' ,      50 , 'Canada',    'Pakistan' ,   '09:15:45:111', '12:30:33:111' , '15hrs'),
	   ('PIA' ,           90 , 'Lahore',    'Multan' ,     '11:05:00:111', '02:30:33:111' , '5hrs'),
	   ('Air Blue' ,      70 , 'Islamabad', 'Faisalabad' , '03:11:05:111', '04:30:33:111' , '3hrs'),
	   ('Fly Emirates' ,  80 , 'Lahore',    'Islamabad' ,  '05:16:10:111', '06:30:33:111' , '2hrs'),
	   ('Qatar Airways' , 60 , 'Karachi',   'Lahore' ,     '09:19:20:111', '08:30:33:111' , '4hrs'),
	   ('PIA' ,           90 , 'Islamabad', 'Multan' ,     '11:30:30:111', '05:30:33:111' , '6hrs')


insert into Flight(departure_date,price_of_ticket,available_economy_seats,available_vip_seats)
values ('10-18-2020', 30000 , 30 , 25),
       ('10-20-2020', 40000 , 20 , 35),
	   ('10-22-2020', 50000 , 15 , 15),
	   ('10-24-2020', 30000 , 30 , 25),
	   ('10-26-2020', 25000 , 20 , 20),
	   ('10-28-2020', 35000 , 40 , 23),
	   ('10-30-2020', 17000 , 35 , 12),
	   ('11-02-2020', 21000 , 25 , 07),
	   ('11-04-2020', 19000 , 20 , 19),
	   ('11-06-2020', 15000 , 10 , 11)


insert into Det_Airline_Flight(id_of_airline, flight_id)
values (1,  1),
       (2,  2),
	   (3,  3),
	   (4,  4),
	   (5,  5),
	   (6,  6),
       (7,  7),
	   (8,  8),
	   (9,  9),
	   (10, 10)

insert into Ticket_Booking_Info(status_of_ticket)
values ('Generated'),
       ('Generated'),
	   ('Not Generated'),
	   ('Generated'),
	   ('Not Generated'),
	   ('Generated'),
	   ('Generated'),
	   ('Generated'),
	   ('Not Generated'),
	   ('Not Generated')

insert into Flight_And_Ticket(flight_id,ticket_id)
values (1, 1),
       (2, 2),
	   (3, 3),
       (4, 4),
	   (5, 5),
       (6, 6),
	   (7, 7),
       (8, 8),
	   (9, 9),
       (10,10)


insert into Passenger_Info(first_name,last_name,age,gender,phone_no,cnic_no,email_id,
passenger_type,nationality,religion)
values ('Zunaira' ,  'Javaid' , 20 , 'Female' , '0300-0000001' , '00000-0000000-1' , 'zunaira@gmail.com',   'Local'        , 'Pakistani', 'Islam'),
       ('Amir '   ,  'Ali'    , 21 , 'Male'   , '0300-0000002' , '00000-0000000-2' , 'Amir@gmail.com'   ,   'Local'        , 'Pakistani', 'Islam'),
	   ('Ahmed'   ,  'Kamal'  , 21 , 'Male'   , '0300-0000003' , '00000-0000000-3' , 'Ahmed@gmail.com'  ,   'International', 'Canadian' , 'Islam'),
	   ('Farah'   ,  'Zubair' , 20 , 'Female' , '0300-0000004' , '00000-0000000-4' , 'Farah@gmail.com'  ,   'Local'        , 'Pakistani', 'Islam'),
	   ('Maham'   ,  'Yasir',   20 , 'Female' , '0300-0000005' , '00000-0000000-5' , 'Maham@gmail.com'  ,   'Local'        , 'Pakistani', 'Islam')

insert into Passenger_And_Ticket(passenger_id,ticket_id)
values (1,1),
       (2,2),
	   (3,3),
	   (4,4),
	   (5,5)

insert into Payment_Details(passenger_id,payment_card_type,payment_card_no,card_expiry)
values (1, 'Visa' ,   '0000000001' , '10-11-2023'),
       (2, 'Visa' ,   '0000000001' , '11-10-2022'),
	   (3, 'PayPal' , '0000000001' , '09-01-2024'),
	   (4, 'Debit' ,  '0000000001' , '08-15-2025'),
	   (5, 'PayPal' , '0000000001' , '02-19-2027')
Select * from  Payment_Details
--SQL Quries
--1 Showing id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,flight_duration of table 
--Details_Of_Airline where name_of_airline equal to “PIA”.

select id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,flight_duration from 
Details_Of_Airline where name_of_airline='PIA'

--2 Showing id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,flight_duration from table
--Details_Of_Airline where total_no_of_seats is greater than equal to 70.

select id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,flight_duration from 
Details_Of_Airline where total_no_of_seats>=70

--3 Showing flight_id, departure_date, price_of_ticket,available_economy_seats,available_vip_seats from table T15_Flight where available_vip_seats  greater 
--than equal to 10 and available_economy_seats are equal to available_vip_seats.


select flight_id,departure_date,price_of_ticket,available_economy_seats,available_vip_seats from Flight 
where available_vip_seats >=10 and available_economy_seats=available_vip_seats

--4 Showing flight_id, departure_date, price_of_ticket,available_economy_seats,available_vip_seats from table Flight where price_of_ticket greater than 25000.

select flight_id,departure_date,price_of_ticket,available_economy_seats,available_vip_seats from Flight 
where price_of_ticket>25000

--5 Showing passenger_id, first_name,last_name,age,gender,phone_no,cnic_no,email_id,
--passenger_type, nationality, religion from table T15_Passenger_Info where gender is equal to “Male” and age=21.

select passenger_id,first_name,last_name,age,gender,phone_no,cnic_no,email_id,passenger_type,nationality,religion
from Passenger_Info where gender='Male' and age=21

--Select statement
--6.Showing total number of airlines from table Details_Of_Airline
--7.Showing total number of economy seats from table Flight
--8 Showing total number of vip seats from table Flight

Select count(*) as TotalCountAirlines from Details_Of_Airline
Select count(available_economy_seats) as TotalEcnomyseats from Flight
Select count(available_vip_seats) as TotalVipseats from Flight

--9.Showing name of airline in upper case from table Details_Of_Airline where id =1
Select upper(ltrim(name_of_airline)) as NameOfAirline from Details_Of_Airline where id_of_airline =1
--10 Showing name of airline in lower case from table Details_Of_Airline where id =3.
Select lower(ltrim(name_of_airline)) as NameOfAirline from Details_Of_Airline where id_of_airline =3
-- 11.	Concatenate airline id and name of airline from table Details_Of_Airline.
Select concat(id_of_airline,'  ',name_of_airline) as ID_Name_Of_Airlines from Details_Of_Airline
--12.	Showing name of airline from table Details_Of_Airline. Where id =3	
Select reverse(name_of_airline) as Name_Of_Airlines from Details_Of_Airline where id_of_airline = 3
--13--Functions,case,if else
--13.	Display passenger first name and last name in format with only first letter from first name in capital, 
--space and then Last name with first letter in caps( i.e display Zunaira javaid in Z Javaid).


create function Name_of_passenger(@f nvarchar(200),@l nvarchar(200))

returns nvarchar(max)
as
begin

declare @y nvarchar(max)
set @y=UPPER(SUBSTRING(ltrim(@f),1,1))+' '+UPPER(SUBSTRING(ltrim(@l),1,1))+SUBSTRING(ltrim(@l),2,len(ltrim(@l))) 
return @y
End

select dbo.Name_of_passenger(first_name,last_name) as fullName from Passenger_Info

sp_helptext Name_of_passenger

--14.	Write a query to increment price of ticket if ticket is generated ticket then 10000 incr,then not
 --genetaed ticket no increment in price.

Select status_of_ticket,price_of_ticket as increment_without_price_of_ticket,
case
when (status_of_ticket like 'Generated')
then (price_of_ticket +10000)
else price_of_ticket
End as increment_with_price_of_ticket from Ticket_Booking_Info tb join Flight f on tb.ticket_id = f.flight_id

--join

--15.	Write a query to display total number of flights for each airline.
Select name_of_airline as airline_name,count(flight_id) as flight_id from Details_Of_Airline a join  Det_Airline_Flight af
on a.id_of_airline= af.id_of_airline group by name_of_airline

--16.	Write a query to passenger name and display total number of tickets of passenger.
Select concat(first_name,' ',last_name) as full_name,count(ticket_id) as Ticket_id from Passenger_Info p join Passenger_And_Ticket pt
on p.passenger_id = pt.passenger_id group by first_name,last_name

--views
--17.	Write a query to create view showing id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,
--flight_duration of table Details_Of_Airline where name_of_airline equal to “PIA”.
Create view DeatailsAirline

as
select id_of_airline, name_of_airline ,total_no_of_seats, from_location, to_location, departure_time ,arrival_time,flight_duration from 
Details_Of_Airline where name_of_airline='PIA'


