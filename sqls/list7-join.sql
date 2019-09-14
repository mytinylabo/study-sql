-- 内部結合
select TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
  from TenpoShohin as TS inner join Shohin as S
    on TS.shohin_id = S.shohin_id;

-- whereで絞り込む
select TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
  from TenpoShohin as TS inner join Shohin as S
    on TS.shohin_id = S.shohin_id
 where TS.tenpo_id = '000A';

-- どのテーブルの列でも絞り込める
select TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
  from TenpoShohin as TS inner join Shohin as S
    on TS.shohin_id = S.shohin_id
 where TS.tenpo_id = '000A'
   and S.hanbai_tanka >= 1000;

-- 外部結合
select TS.tenpo_id, TS.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
  from TenpoShohin as TS right outer join Shohin as S
    on TS.shohin_id = S.shohin_id;

-- 3テーブルの内部結合
select TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka, ZS.zaiko_suryo
  from TenpoShohin as TS inner join Shohin as S
    on TS.shohin_id = S.shohin_id
         inner join ZaikoShohin as ZS
            on TS.shohin_id = ZS.shohin_id
 where ZS.souko_id = 'S001'
 order by TS.tenpo_id;

-- 直積
select TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei
  from TenpoShohin as TS cross join Shohin as S;
