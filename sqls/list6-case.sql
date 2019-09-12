select shohin_mei,
       case when shohin_bunrui = '衣服'         then 'A:' || shohin_bunrui
            when shohin_bunrui = '事務用品'     then 'B:' || shohin_bunrui
            when shohin_bunrui = 'キッチン用品' then 'C:' || shohin_bunrui
            else null
        end as abc_shohin_bunrui
  from Shohin;

select sum(case when shohin_bunrui = '衣服'
                then hanbai_tanka else 0 end) as sum_tanka_ihuku,
       sum(case when shohin_bunrui = '事務用品'
                then hanbai_tanka else 0 end) as sum_tanka_ihuku,
       sum(case when shohin_bunrui = 'キッチン用品'
                then hanbai_tanka else 0 end) as sum_tanka_ihuku
  from Shohin;
