select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
       rank () over (partition by shohin_bunrui order by hanbai_tanka) as ranking
  from Shohin;

select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
       row_number () over (order by shohin_id) as number
  from Shohin;

select shohin_id, shohin_mei,
       avg (hanbai_tanka) over (order by shohin_id) as avg,
       avg (hanbai_tanka) over (order by shohin_id rows 2 preceding) as moving_avg,
       avg (hanbai_tanka) over (order by shohin_id rows between 1 preceding and 1 following) as moving_avg2
  from Shohin;
