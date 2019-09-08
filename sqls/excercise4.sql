
-- 4.1
-- コミット前なので0行の結果を受け取る

-- 4.2
-- 商品IDが主キーなので、値が重複できずエラーになる

-- 4.3
-- 問題用のテーブル作成
create table ShohinSaeki
(shohin_id    char(4)      not null,
 shohin_mei   varchar(100) not null,
 hanbai_tanka integer,
 shiire_tanka integer,
 saeki        integer,
 primary key (shohin_id));

-- 解答
insert into ShohinSaeki
select shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
  from Shohin;

-- 4.4
begin transaction;

update ShohinSaeki
   set hanbai_tanka = 3000
 where shohin_id = '0003';

update ShohinSaeki
   set saeki = hanbai_tanka - shiire_tanka
 where shohin_id = '0003';

commit;
