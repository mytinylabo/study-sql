-- 3.1
select P1.name as name_1, P2.name as name_2
  from Products as P1 inner join Products as P2
    on P1.name >= P2.name;

-- 3.2
create table Products2_Uniqued
(name   varchar(10) not null primary key,
 price  integer     not null);

begin transaction;
insert into Products2_Uniqued
select name, price
  from (select name, price,
               row_number() over (partition by name, price) as rownum
          from Products2) as TMP
 where rownum = 1;

select * from Products2_Uniqued;
rollback;
