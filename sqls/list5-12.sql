-- 販売単価が平均より高い商品を選択する
select shohin_id, shohin_mei, hanbai_tanka
  from Shohin
 where hanbai_tanka > (select avg(hanbai_tanka)
                         from Shohin);
