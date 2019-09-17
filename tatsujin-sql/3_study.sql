-- 重複順列
select P1.name as name_1, P2.name as name_2
  from Products as P1 cross join Products as P2;

-- 順列
select P1.name as name_1, P2.name as name_2
  from Products as P1 inner join Products as P2
    on P1.name <> P2.name;
-- ↓とのパフォーマンスの差が気になる
select P1.name as name_1, P2.name as name_2
  from Products as P1 cross join Products as P2
 where P1.name <> P2.name;

-- 組み合わせ
select P1.name as name_1, P2.name as name_2
  from Products as P1 inner join Products as P2
    on P1.name < P2.name;

-- 組み合わせ（3列へ拡張）
select P1.name as name_1, P2.name as name_2, P3.name as name_3
  from Products as P1
       inner join Products as P2
          on P1.name < P2.name
             inner join Products as P3
                on P2.name < P3.name;

-- 重複行を削除（自己相関サブクエリ）
begin transaction;
delete from Products2 as P1
 where oid < (select max(P2.oid)
                from Products2 P2
               where P1.name = P2.name
                 and P1.price = P2.price);

select * from Products2;
rollback;

-- 重複行を削除（自己非等値結合）
-- こっちの方が速そう（existsがショートカットするから？）
begin transaction;
delete from Products2 as P1
 where exists (select *
                 from Products2 as P2
                where P1.name = P2.name
                  and P1.price = P2.price
                  and P1.oid < P2.oid);

select * from Products2;
rollback;

-- 部分的に不一致なキーの検索
-- distinctは3人以上の家族のときに冗長になるのを防ぐ意味。
-- 例えば X, Y, Z の3人家族でYの住所だけ間違ってる場合、
-- distinctなしだと Y:X, Y:Z の2種類の組み合わせの結果が（Yだけselectしてるので）重複になる
select distinct A1.name, A1.address
  from Addresses as A1 inner join Addresses as A2
    on A1.family_id = A2.family_id
   and A1.address <> A2.address;

-- 値段が同じ商品の組み合わせを検索（部分的に一致するキーの検索）
select distinct P1.name, P1.price
  from Products3 as P1 inner join Products3 as P2
    on P1.name <> P2.name
   and P1.price = P2.price
 order by P1.price;

-- ウィンドウ関数版
select name, price
  from (select name, price,
               count(*) over (partition by price) as cnt
          from Products3) as TMP
 where cnt > 1;

-- 組み合わせで出力
select P1.name, P2.name, P1.price
  from Products3 as P1 inner join Products3 as P2
    on P1.name < P2.name
   and P1.price = P2.price;
