-- p138
create table Sales
(year integer not null primary key,
 sale integer not null);

begin transaction;
insert into Sales values (1990, 50);
insert into Sales values (1991, 51);
insert into Sales values (1992, 52);
insert into Sales values (1993, 52);
insert into Sales values (1994, 50);
insert into Sales values (1995, 50);
insert into Sales values (1996, 49);
insert into Sales values (1997, 55);
commit;

-- p143
create table Sales2
(year integer not null primary key,
 sale integer not null);

begin transaction;
insert into Sales2 values (1990, 50);
insert into Sales2 values (1992, 50);
insert into Sales2 values (1993, 52);
insert into Sales2 values (1994, 55);
insert into Sales2 values (1997, 55);
commit;

-- p148
create table Reservations
(reserver   varchar(10) not null,
 start_date date        not null,
 end_date   date        not null);

begin transaction;
insert into Reservations values ('木村', '2018-10-26', '2018-10-27');
insert into Reservations values ('荒木', '2018-10-28', '2018-10-31');
insert into Reservations values ('堀',   '2018-10-31', '2018-11-01');
insert into Reservations values ('山本', '2018-11-03', '2018-11-04');
insert into Reservations values ('内田', '2018-11-03', '2018-11-05');
insert into Reservations values ('水谷', '2018-11-06', '2018-11-06');
commit;
