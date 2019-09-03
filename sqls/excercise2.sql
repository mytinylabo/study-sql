-- 2.1
select shohin_mei, torokubi
  from Shohin
 where torokubi >= '2009-04-28';

-- 2.2
-- NULLを含む計算、比較はNULLになり選択されないため、全て結果0行

-- 2.3
select shohin_mei, hanbai_tanka, shiire_tanka
  from Shohin
 where hanbai_tanka >= shiire_tanka + 500;

select shohin_mei, hanbai_tanka, shiire_tanka
  from Shohin
 where shiire_tanka <= hanbai_tanka - 500;

-- 2.4
select shohin_mei, shohin_bunrui,
       hanbai_tanka * 0.9 - shiire_tanka as rieki
  from Shohin
 where (hanbai_tanka * 0.9 - shiire_tanka > 100) and
       ((shohin_bunrui = '事務用品') or (shohin_bunrui = 'キッチン用品'));
