-- p5
create table PopTbl
(pref_name  varchar(6) primary key,
 population integer    not null);

begin transaction;
insert into PopTbl values ('徳島', 100);
insert into PopTbl values ('香川', 200);
insert into PopTbl values ('愛媛', 150);
insert into PopTbl values ('高知', 200);
insert into PopTbl values ('福岡', 300);
insert into PopTbl values ('佐賀', 100);
insert into PopTbl values ('長崎', 200);
insert into PopTbl values ('東京', 400);
insert into PopTbl values ('群馬', 50);
commit;

-- p8
create table PopTbl2
(pref_name  varchar(6) not null,
 sex        char(1)    not null,
 population integer    not null,
 primary key (pref_name, sex));

begin transaction;
insert into PopTbl2 values ('徳島', '1', 60);
insert into PopTbl2 values ('徳島', '2', 40);
insert into PopTbl2 values ('香川', '1', 100);
insert into PopTbl2 values ('香川', '2', 100);
insert into PopTbl2 values ('愛媛', '1', 100);
insert into PopTbl2 values ('愛媛', '2', 50);
insert into PopTbl2 values ('高知', '1', 100);
insert into PopTbl2 values ('高知', '2', 100);
insert into PopTbl2 values ('福岡', '1', 100);
insert into PopTbl2 values ('福岡', '2', 200);
insert into PopTbl2 values ('佐賀', '1', 20);
insert into PopTbl2 values ('佐賀', '2', 80);
insert into PopTbl2 values ('長崎', '1', 125);
insert into PopTbl2 values ('長崎', '2', 125);
insert into PopTbl2 values ('東京', '1', 250);
insert into PopTbl2 values ('東京', '2', 150);
commit;

-- p13
create table Salaries
(name   varchar(10) not null primary key,
 salary integer     not null);

begin transaction;
insert into Salaries values ('相田', 300000);
insert into Salaries values ('神崎', 270000);
insert into Salaries values ('木村', 220000);
insert into Salaries values ('斉藤', 290000);
commit;

-- p16
create table CourseMaster
(course_id   char(1)     not null primary key,
 course_name varchar(20) not null);

begin transaction;
insert into CourseMaster values ('1', '経理入門');
insert into CourseMaster values ('2', '財務知識');
insert into CourseMaster values ('3', '簿記検定開講講座');
insert into CourseMaster values ('4', '税理士');
commit;

create table OpenCourses
(month     char(6) not null,
 course_id char(1) not null,
 primary key (month, course_id));

begin transaction;
insert into OpenCourses values ('201806', '1');
insert into OpenCourses values ('201806', '3');
insert into OpenCourses values ('201806', '4');
insert into OpenCourses values ('201807', '4');
insert into OpenCourses values ('201808', '2');
insert into OpenCourses values ('201808', '4');
commit;

-- p18
create table StudentClub
(std_id        char(3)     not null,
 club_id       char(1)     not null,
 club_name     varchar(10) not null,
 main_club_flg char(1)     not null,
 primary key (std_id, club_id),
 constraint yes_or_no check (main_club_flg in ('Y', 'N')));

begin transaction;
insert into StudentClub values ('100', '1', '野球',         'Y');
insert into StudentClub values ('100', '2', '吹奏楽',       'N');
insert into StudentClub values ('200', '2', '吹奏楽',       'N');
insert into StudentClub values ('200', '3', 'バドミントン', 'Y');
insert into StudentClub values ('200', '4', 'サッカー',     'N');
insert into StudentClub values ('300', '4', 'サッカー',     'N');
insert into StudentClub values ('400', '5', '水泳',         'N');
insert into StudentClub values ('500', '6', '囲碁',         'N');
commit;
