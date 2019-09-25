-- 5.1
create table ArrayTbl2 (
    key char(1) not null
    , i integer not null
    , val integer
    ,
    primary key (key, i)
)
;

begin transaction;
insert into ArrayTbl2 values ('A', 1);
insert into ArrayTbl2 values ('A', 2);
insert into ArrayTbl2 values ('A', 3);
insert into ArrayTbl2 values ('A', 4);
insert into ArrayTbl2 values ('A', 5);
insert into ArrayTbl2 values ('A', 6);
insert into ArrayTbl2 values ('A', 7);
insert into ArrayTbl2 values ('A', 8);
insert into ArrayTbl2 values ('A', 9);
insert into ArrayTbl2 values ('A', 10);
insert into ArrayTbl2 values ('B', 1, 3);
insert into ArrayTbl2 values ('B', 2);
insert into ArrayTbl2 values ('B', 3);
insert into ArrayTbl2 values ('B', 4);
insert into ArrayTbl2 values ('B', 5);
insert into ArrayTbl2 values ('B', 6);
insert into ArrayTbl2 values ('B', 7);
insert into ArrayTbl2 values ('B', 8);
insert into ArrayTbl2 values ('B', 9);
insert into ArrayTbl2 values ('B', 10);
insert into ArrayTbl2 values ('C', 1,  1);
insert into ArrayTbl2 values ('C', 2,  1);
insert into ArrayTbl2 values ('C', 3,  1);
insert into ArrayTbl2 values ('C', 4,  1);
insert into ArrayTbl2 values ('C', 5,  1);
insert into ArrayTbl2 values ('C', 6,  1);
insert into ArrayTbl2 values ('C', 7,  1);
insert into ArrayTbl2 values ('C', 8,  1);
insert into ArrayTbl2 values ('C', 9,  1);
insert into ArrayTbl2 values ('C', 10, 1);
commit;

-- オール1のキーを選択する
select distinct
    key
from
    ArrayTbl2 A1
where
    not exists (
        select
            *
        from
            ArrayTbl2 A2
        where
            A1.key = A2.key
            and coalesce(val, 0) <> 1
    )
;
-- この問題の罠は何か？
-- val <> 1 で判定すると、Aに関してサブクエリのwhereは常にunknownとなり、
-- not exists が成立してしまう。

-- 別解
select
    key
from
    ArrayTbl2
group by
    key
having
    count(*) = sum (case val when 1 then 1 else 0 end)
;

select distinct
    key
from
    ArrayTbl2 A1
where
    1 = all (
        select
            val -- 気分的には coalesce(val, 0) としたい
        from
            ArrayTbl2 A2
        where
            A1.key = A2.key
    )
;

-- 5.2
-- ちょうど1番まで終わっているプロジェクトを抽出する（ALLを使った全称量化）
select
    *
from
    Projects P1
where
    -- existsのような打ち切り（サブクエリでfalseの行が出た瞬間判定終了）はあるのか？
    -- → ない。サブクエリを完遂してからallの判定になる。
    true = all (
        select
            status = case when step_nbr <= 1 then '完了' else '待機' end
        from
            Projects P2
        where P1.project_id = P2.project_id
    )
;

-- 5.3
-- 数列のテーブルを作る
create table Digits (
    digit integer not null primary key
);

begin transaction;
insert into Digits values (0);
insert into Digits values (1);
insert into Digits values (2);
insert into Digits values (3);
insert into Digits values (4);
insert into Digits values (5);
insert into Digits values (6);
insert into Digits values (7);
insert into Digits values (8);
insert into Digits values (9);
commit;

create table Numbers (
    num integer not null
)
as
select
    D1.digit * 10 + D2.digit as num
from
    Digits D1
    cross join Digits D2
end
;

create table Numbers
as
select
    D1.digit * 10 + D2.digit as num
from
    Digits D1
    cross join Digits D2
;

-- 素数を求める
select
    *
from
    Numbers N1
where
    num > 1
    and not exists (
        select
            *
        from
            Numbers N2
        where
            N2.num > 1
            and N2.num <= N1.num / 2
            and N1.num % N2.num = 0
    )
order by
    num
;
