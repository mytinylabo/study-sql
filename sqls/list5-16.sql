-- 相関サブクエリ
select shohin_bunrui, shohin_mei, hanbai_tanka
  from Shohin as S1
 where hanbai_tanka > (select avg(hanbai_tanka)
                         from Shohin as S2
                        where S1.shohin_bunrui = S2.shohin_bunrui);
