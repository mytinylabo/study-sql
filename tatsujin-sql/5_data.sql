-- p90
create table Meetings (
    meeting varchar(10) not null
    , person varchar(10) not null
    ,
    primary key(meeting, person)
)
;

begin transaction;
insert into Meetings values ('第１回', '伊藤');
insert into Meetings values ('第１回', '水島');
insert into Meetings values ('第１回', '坂東');
insert into Meetings values ('第２回', '伊藤');
insert into Meetings values ('第２回', '宮田');
insert into Meetings values ('第３回', '坂東');
insert into Meetings values ('第３回', '水島');
insert into Meetings values ('第３回', '宮田');
commit;

-- p92
create table TestScores (
    student_id char(3) not null
    , subject varchar(8) not null
    , score integer not null
    ,
    primary key(student_id, subject)
)
;

begin transaction;
insert into TestScores values ('100', '算数', 100);
insert into TestScores values ('100', '国語', 80);
insert into TestScores values ('100', '理科', 80);
insert into TestScores values ('200', '算数', 80);
insert into TestScores values ('200', '国語', 95);
insert into TestScores values ('300', '算数', 40);
insert into TestScores values ('300', '国語', 90);
insert into TestScores values ('300', '社会', 55);
insert into TestScores values ('400', '算数', 80);
commit;

-- p96
create table Projects (
    project_id varchar(10) not null
    , step_nbr integer not null
    , status varchar(4) not null
    ,
    primary key (project_id, step_nbr)
)
;

begin transaction;
insert into Projects values ('AA100', 0, '完了');
insert into Projects values ('AA100', 1, '待機');
insert into Projects values ('AA100', 2, '待機');
insert into Projects values ('B200',  0, '待機');
insert into Projects values ('B200',  1, '待機');
insert into Projects values ('CS300', 0, '完了');
insert into Projects values ('CS300', 1, '完了');
insert into Projects values ('CS300', 2, '待機');
insert into Projects values ('CS300', 3, '待機');
insert into Projects values ('DY400', 0, '完了');
insert into Projects values ('DY400', 1, '完了');
insert into Projects values ('DY400', 2, '完了');
commit;

-- p98
create table ArrayTbl (
    key char(1) not null primary key
    , col1  integer
    , col2  integer
    , col3  integer
    , col4  integer
    , col5  integer
    , col6  integer
    , col7  integer
    , col8  integer
    , col9  integer
    , col10 integer
)
;

begin transaction;
insert into ArrayTbl values ('A');
insert into ArrayTbl values ('B', 3);
insert into ArrayTbl values ('C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into ArrayTbl values ('D', null, 9);
insert into ArrayTbl values ('E', null, 3, 1, 9, null, null, 9);
commit;
