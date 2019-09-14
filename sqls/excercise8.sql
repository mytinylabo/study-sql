-- 8.1
-- 商品IDの昇順で、カレントまでの最大値をcurrent_max_tankaに出力する

-- 8.2
select shohin_id, shohin_mei, torokubi, hanbai_tanka,
       sum (hanbai_tanka) over (order by coalesce(torokubi, '0001-01-01'))
  from Shohin;
