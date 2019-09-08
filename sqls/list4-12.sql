insert into ShohinBunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
     select shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
       from Shohin
   group by shohin_bunrui;
