-- 7.1
-- Shohinのレコードが全部、IDの昇順で出力される

-- 7.2
select coalesce(TS.tenpo_id, '不明') as tenpo_id,
       coalesce(TS.tenpo_mei, '不明') as tenpo_mei,
       S.shohin_id, S.shohin_mei, S.hanbai_tanka
  from TenpoShohin as TS right outer join Shohin as S
    on TS.shohin_id = S.shohin_id;
