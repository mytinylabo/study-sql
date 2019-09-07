-- 3.1
-- 集約キーではない shohin_id がSELECT句にある
-- SUMの引数が文字列
-- WHEREがGROUP BYより後ろにある

-- 3.2
  select shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
    from Shohin
group by shohin_bunrui
  having sum(hanbai_tanka) > sum(shiire_tanka) * 1.5;

-- 3.3
  select *
    from Shohin
order by torokubi desc, hanbai_tanka asc;
