-- 1.1
create table Greatests
(key char(1) not null primary key,
 x   integer not null,
 y   integer not null,
 z   integer not null);

begin transaction;
insert into Greatests values ('A', 1, 2, 3);
insert into Greatests values ('B', 5, 5, 2);
insert into Greatests values ('C', 4, 7, 1);
insert into Greatests values ('D', 3, 3, 8);
commit;

-- x, yから最大値を選ぶ
select key,
       case when x >= y then x
            else y end as greatest
  from Greatests;

-- x, y, zから最大値を選ぶ
select key,
       case when x >= y and x >= z then x
            when y >= z then y
            else z end as greatest
  from Greatests;

-- 1.2
select case when sex = '1' then '男' else '女' end as "性別",
       sum(population) as "全国",
       sum(case when pref_name = '徳島' then population else 0 end) as "徳島",
       sum(case when pref_name = '香川' then population else 0 end) as "香川",
       sum(case when pref_name = '愛媛' then population else 0 end) as "愛媛",
       sum(case when pref_name = '高知' then population else 0 end) as "高知",
       sum(case when pref_name in ('徳島', '香川', '愛媛', '高知') then population else 0 end) as "四国（再掲）"
  from PopTbl2
 group by sex;

-- 1.3
select key
  from Greatests
 order by case key when 'A' then 2
                   when 'B' then 1
                   when 'C' then 4
                   when 'D' then 3
                   else null end;
