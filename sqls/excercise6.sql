-- 6.1
/*
(1)
   shohin_mei   | shiire_tanka
----------------+--------------
 穴あけパンチ   |          320
 おろしがね     |          790

(2) 0件（IN/NOT IN の引数にNULLを含めてはならない）
*/

-- 6.2
select sum(case when hanbai_tanka <= 1000
                then 1 else 0 end) as low_price,
       sum(case when hanbai_tanka between 1001 and 3000
                then 1 else 0 end) as mid_price,
       sum(case when hanbai_tanka > 3000
                then 1 else 0 end) as high_price
  from Shohin;
