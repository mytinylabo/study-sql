-- 無名ウィンドウ構文
select shohin_id, shohin_mei, hanbai_tanka,
       avg(hanbai_tanka) over (order by shohin_id
                               rows between 2 preceding
                                        and current row) as moving_avg
  from Shohin;

-- 名前付きウィンドウ構文
select shohin_id, shohin_mei, hanbai_tanka,
       avg(hanbai_tanka) over W as moving_avg,
       sum(hanbai_tanka) over W as moving_sum,
       count(hanbai_tanka) over W as moving_count, -- nullの行があると変動する
       max(hanbai_tanka) over W as moving_max
  from Shohin
window W as (order by shohin_id
             rows between 2 preceding
                      and current row);

-- 直前の行のレコードを参照する
select sample_date as cur_date,
       load_val    as cur_load,
       min(sample_date) over (order by sample_date
                              rows between 1 preceding and 1 preceding) as latest_date,
       min(load_val) over (order by sample_date
                              rows between 1 preceding and 1 preceding) as latest_load
  from LoadSample;

-- ↑を名前付きウィンドウで書く
select sample_date as cur_date,
       load_val    as cur_load,
       min(sample_date) over W as latest_date,
       min(load_val)    over W as latest_load
  from LoadSample
window W as (order by sample_date
             rows between 1 preceding and 1 preceding);

-- 列の値の幅でフレームを設定する（1行前ではなく1日前など）
-- PostgreSQL 11.5 で動いた（10以前だとエラー）
select sample_date as cur_date,
       load_val    as cur_load,
       min(sample_date)
         over (order by sample_date asc
               range between interval '1' day preceding
                         and interval '1' day preceding
              ) as day1_before,
       min(load_val)
         over (order by sample_date asc
               range between interval '1' day preceding
                         and interval '1' day preceding
              ) as load_day1_before
  from LoadSample;
