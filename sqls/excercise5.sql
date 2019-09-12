-- 5.1
create view ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
    as
select shohin_mei, hanbai_tanka, torokubi
  from Shohin
 where hanbai_tanka >= 1000 and torokubi = '2009-09-20';

-- 5.2
-- shohin_id, shohin_bunruiのNOT NULL制約違反のためエラー

-- 5.3
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
       (select avg(hanbai_tanka) from Shohin) as hanbai_tanka_all
  from Shohin;

-- 5.4
create view AvgTankaByBunrui (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
    as
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
       (select avg(hanbai_tanka) from Shohin as S2 where S1.shohin_bunrui = S2.shohin_bunrui)
  from Shohin as S1;
