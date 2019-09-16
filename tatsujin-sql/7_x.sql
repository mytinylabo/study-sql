create table Accounts
(prc_date date    not null primary key,
 prc_amt  integer not null);

begin transaction;
insert into Accounts values ('2018-10-26',  12000);
insert into Accounts values ('2018-10-28',   2500);
insert into Accounts values ('2018-10-31', -15000);
insert into Accounts values ('2018-11-03',  34000);
insert into Accounts values ('2018-11-04',  -5000);
insert into Accounts values ('2018-11-06',   7200);
insert into Accounts values ('2018-11-11',  11000);
commit;

select prc_date, prc_amt,
       avg(prc_amt) over (order by prc_date
                          rows between 2 preceding and current row) as move_avg_amt
  from Accounts
 order by prc_date;

-- 7.1
-- 相関サブクエリで移動平均
select prc_date, prc_amt,
       (select avg(prc_amt)
          from (select prc_date, prc_amt,
                       (select count(*)
                          from Accounts as A2
                        where A2.prc_date <= A1.prc_date) as ord
                  from Accounts as A1) as AC2
         where AC2.ord >= AC1.ord - 2 and AC2.ord <= AC1.ord) as move_avg_amt
  from (select prc_date, prc_amt,
               (select count(*)
                  from Accounts as A2
                 where A2.prc_date <= A1.prc_date) as ord
          from Accounts as A1) as AC1
 order by prc_date;

-- 本の解答
-- ↑はウィンドウ関数の考え方で相関サブクエリを使っている（付番したテーブルをまず作るところ）
-- ↓は付番にあたる値をselect内でオンデマンドに作っている分、効率的
select prc_date, prc_amt,
       (select avg(A2.prc_amt)
          from Accounts as A2
         where A2.prc_date <= A1.prc_date
           and (select count(*)
                  from Accounts as A3
                 where A3.prc_date between A2.prc_date
                                       and A1.prc_date) <= 3) as move_avg_amt
  from Accounts as A1
 order by prc_date;

-- 7.2
-- 移動平均のフレームのレコード数が3未満ならnull（ウィンドウ関数）
select prc_date, prc_amt,
       case when count(*) over (order by prc_date
                          rows between 2 preceding and current row) >= 3
            then avg(prc_amt) over (order by prc_date
                              rows between 2 preceding and current row)
            else null
        end as move_avg_amt
  from Accounts
 order by prc_date;

-- 本の解答
-- ↑は「絞り込みしないからメインクエリだけでいけるでしょ」という考え方で
-- ↓はわかりやすくするため付番したテーブルを作ってから判定している。
-- パフォーマンスはたいして違わないはず
select prc_date, prc_amt,
       case when cnt < 3 then null
            else move_avg_amt end
  from (select prc_date, prc_amt,
               avg(prc_amt) over (order by prc_date
                                  rows between 2 preceding and current row) as move_avg_amt,
               count(*)     over (order by prc_date
                                  rows between 2 preceding and current row) as cnt
          from Accounts) as TMP
 order by prc_date;

-- 移動平均のフレームのレコード数が3未満ならnull（相関サブクエリ）
select prc_date, prc_amt,
       case when ord >= 3
            then (select avg(prc_amt)
                    from (select prc_date, prc_amt,
                                (select count(*)
                                    from Accounts as A2
                                    where A2.prc_date <= A1.prc_date) as ord
                            from Accounts as A1) as AC2
                    where AC2.ord >= AC1.ord - 2 and AC2.ord <= AC1.ord)
            else null
        end as move_avg_amt
  from (select prc_date, prc_amt,
               (select count(*)
                  from Accounts as A2
                 where A2.prc_date <= A1.prc_date) as ord
          from Accounts as A1) as AC1;

-- 本の解答
select prc_date, prc_amt,
       (select avg(A2.prc_amt)
          from Accounts as A2
         where A2.prc_date <= A1.prc_date
           and (select count(*)
                  from Accounts as A3
                 where A3.prc_date between A2.prc_date
                                       and A1.prc_date) <= 3
        having count(*) = 3) as move_avg_amt
  from Accounts as A1
 order by prc_date;

-- ↓は失敗例
select prc_date, prc_amt,
       (select avg(A2.prc_amt)
          from Accounts as A2
         where A2.prc_date <= A1.prc_date
           and (select count(*)
                  from Accounts as A3
                 where A3.prc_date between A2.prc_date
                                       and A1.prc_date) = 3) as move_avg_amt
  from Accounts as A1
 order by prc_date;

-- なぜ失敗かは、サブクエリの結果を見るとわかりやすい
select A2.prc_amt
  from Accounts as A2
 where A2.prc_date <= '2018-11-04' -- A1.prc_date = '2018-11-04' のときのサブクエリを想定
   and (select count(*)
          from Accounts as A3
         where A3.prc_date between A2.prc_date
                               and '2018-11-04') <= 3;

select A2.prc_amt
  from Accounts as A2
 where A2.prc_date <= '2018-11-04'
   and (select count(*)
          from Accounts as A3
         where A3.prc_date between A2.prc_date
                               and '2018-11-04') = 3;
