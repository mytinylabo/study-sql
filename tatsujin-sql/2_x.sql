-- 2.1
-- overの指定を空にするとフレームがテーブル全体になるため、
-- sum_loadは常に全体の合計値が出力される。

-- 2.2
-- sum_loadはサーバー毎の合計値が出力される。
-- group by から集約の動作を引いたような結果になる。

-- 解答確認用データ
create table ServerLoadSample
(server      char(1) not null,
 sample_date date    not null,
 load_val    integer not null,
 primary key (server, sample_date));

begin transaction;
insert into ServerLoadSample values ('A', '2018-02-01', 1024);
insert into ServerLoadSample values ('A', '2018-02-02', 2366);
insert into ServerLoadSample values ('A', '2018-02-05', 2366);
insert into ServerLoadSample values ('A', '2018-02-07', 985);
insert into ServerLoadSample values ('A', '2018-02-08', 780);
insert into ServerLoadSample values ('A', '2018-02-12', 1000);
insert into ServerLoadSample values ('B', '2018-02-01', 54);
insert into ServerLoadSample values ('B', '2018-02-02', 39008);
insert into ServerLoadSample values ('B', '2018-02-03', 2900);
insert into ServerLoadSample values ('B', '2018-02-04', 556);
insert into ServerLoadSample values ('B', '2018-02-05', 12600);
insert into ServerLoadSample values ('B', '2018-02-06', 7309);
insert into ServerLoadSample values ('C', '2018-02-01', 1000);
insert into ServerLoadSample values ('C', '2018-02-07', 2000);
insert into ServerLoadSample values ('C', '2018-02-16', 500);
commit;
