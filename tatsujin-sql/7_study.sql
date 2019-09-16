-- 前年と年商が同じ年度を求める（相関サブクエリ）
select year, sale
  from Sales as S1
 where sale = (select sale from Sales as S2 where S2.year = S1.year - 1)
 order by year;

-- 前年と年商が同じ年度を求める（ウィンドウ関数）
select year, current_sale
  from (select year,
               sale as current_sale,
               sum(sale) over (order by year
                               range between 1 preceding
                                         and 1 preceding) as pre_sale
          from Sales) as TMP
 where current_sale = pre_sale;

-- 前年からの変化を表示（相関サブクエリ）
select year, sale,
       case when sale = pre_sale then '→'
            when sale > pre_sale then '↑'
            when sale < pre_sale then '↓'
            else '-' end as var
  from (select year, sale,
               (select sale from Sales as S2 where S2.year = S1.year - 1) as pre_sale
          from Sales as S1) as TMP
 order by year;

-- 前年からの変化を表示（ウィンドウ関数）
select year, sale,
       case when sale = pre_sale then '→'
            when sale > pre_sale then '↑'
            when sale < pre_sale then '↓'
            else '-' end as var
  from (select year, sale,
               sum(sale) over (order by year
                               range between 1 preceding
                                         and 1 preceding) as pre_sale
          from Sales) as TMP
 order by year;

-- 直近の年と年商が同じ年度を求める（相関サブクエリ）
-- 直近の年＝カレント行より前の年度の中で最大の年度
select year, sale
  from Sales2 as S1
 where sale = (select sale
                 from Sales2 as S2
                where S2.year = (select max(year)
                                   from Sales2 as S3
                                  where S3.year < S1.year))
 order by year;

-- 直近の年と年商が同じ年度を求める（ウィンドウ関数）
select year, sale
  from (select year, sale,
               sum(sale) over (order by year
                               rows between 1 preceding
                                        and 1 preceding) as pre_sale
          from Sales2) as TMP
 where sale = pre_sale
 order by year;

-- 商品分類ごとに平均単価より高い商品を選択する（相関サブクエリ）
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka
  from Shohin as S1
 where hanbai_tanka > (select avg(hanbai_tanka)
                         from Shohin as S2
                        where S2.shohin_bunrui = S1.shohin_bunrui
                        group by shohin_bunrui); -- この行あったほうがパフォーマンス出る？

-- 商品分類ごとに平均単価より高い商品を選択する（ウィンドウ関数）
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka
  from (select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
               avg(hanbai_tanka) over (partition by shohin_bunrui) as avg_tanka
          from Shohin) as TMP
 where hanbai_tanka > avg_tanka
 order by shohin_id;

-- オーバーラップする期間を調べる（相関サブクエリ）
select *
  from Reservations as R1
 where exists (select *
                 from Reservations as R2
                where R1.reserver <> R2.reserver
                  and (R1.start_date between R2.start_date and R2.end_date or
                       R1.end_date   between R2.start_date and R2.end_date));

-- オーバーラップする期間を調べる（ウィンドウ関数）
select reserver, next_reserver
  from (select reserver, start_date, end_date,
               max(start_date) over (order by start_date
                                     rows between 1 following
                                               and 1 following) as next_start_date,
               max(reserver) over (order by start_date
                                     rows between 1 following
                                               and 1 following) as next_reserver
        from Reservations) as TMP
 where next_start_date between start_date and end_date;
