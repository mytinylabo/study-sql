-- HAVING句でスカラ・サブクエリを使う
select shohin_bunrui, avg(hanbai_tanka)
  from Shohin
 group by shohin_bunrui
having avg(hanbai_tanka) > (select avg(hanbai_tanka) from Shohin);
