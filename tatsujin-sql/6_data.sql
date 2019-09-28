-- p106
create table SeqTbl (
    seq integer not null primary key
    , name varchar(10)
)
;

begin transaction;
insert into SeqTbl values (1, 'ディック');
insert into SeqTbl values (2, 'アン');
insert into SeqTbl values (3, 'ライル');
insert into SeqTbl values (5, 'カー');
insert into SeqTbl values (6, 'マリー');
insert into SeqTbl values (8, 'ベン');
commit;

-- p109
create table SeqCase1
as
select num as seq from Numbers where num in (1, 2, 3, 4, 5);

create table SeqCase2
as
select num as seq from Numbers where num in (1, 2, 4, 5, 8);

create table SeqCase3
as
select num as seq from Numbers where num in (3, 4, 5, 6, 7);

create table SeqCase4
as
select num as seq from Numbers where num in (3, 4, 7, 8, 10);

-- p111
create table Graduates (
    name varchar(10) not null primary key
    , income integer not null
)
;

begin transaction;
insert into Graduates values ('サンプソン', 400000);
insert into Graduates values ('マイク', 30000);
insert into Graduates values ('ホワイト', 20000);
insert into Graduates values ('アーノルド', 20000);
insert into Graduates values ('スミス', 20000);
insert into Graduates values ('ロレンス', 15000);
insert into Graduates values ('ハドソン', 15000);
insert into Graduates values ('ケント', 10000);
insert into Graduates values ('ベッカー', 10000);
insert into Graduates values ('スコット', 10000);
commit;
