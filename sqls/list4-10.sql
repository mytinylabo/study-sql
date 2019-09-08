insert into ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
     select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
       from Shohin;
