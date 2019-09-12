select exists (select *
                 from (select 1 as num) as S
                where S.num is null);

select exists (select *
                 from (select 1 as num) as S
                where S.num is not null);

select shohin_mei, hanbai_tanka
  from Shohin as S
 where not exists (select * -- レコードの有無のみ調べるので * でよい
                     from TenpoShohin as TS
                    where TS.tenpo_id = '000A'
                      and S.shohin_id = TS.shohin_id);
