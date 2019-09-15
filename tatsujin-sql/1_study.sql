-- 県を地方にまとめて集計
select case pref_name
       when '徳島' then '四国'
       when '香川' then '四国'
       when '愛媛' then '四国'
       when '高知' then '四国'
       when '福岡' then '九州'
       when '佐賀' then '九州'
       when '長崎' then '九州'
       else 'その他'
       end as district,
       sum(population)
  from PopTbl
 group by case pref_name
       when '徳島' then '四国'
       when '香川' then '四国'
       when '愛媛' then '四国'
       when '高知' then '四国'
       when '福岡' then '九州'
       when '佐賀' then '九州'
       when '長崎' then '九州'
       else 'その他'
       end;

-- districtをgroup byで参照する（標準の構文ではない）
select case pref_name
       when '徳島' then '四国'
       when '香川' then '四国'
       when '愛媛' then '四国'
       when '高知' then '四国'
       when '福岡' then '九州'
       when '佐賀' then '九州'
       when '長崎' then '九州'
       else 'その他'
       end as district,
       sum(population)
  from PopTbl
 group by district;

-- 人口階級で分類
select case when population < 100 then '01'
            when population < 200 then '02'
            when population < 300 then '03'
            else '04' end as pop_class,
            count (*) as cnt
  from PopTbl
 group by case when population < 100 then '01'
               when population < 200 then '02'
               when population < 300 then '03'
               else '04' end;

-- 異なる条件の集計を1つのSQLで行う
-- 2回SQLを発行する版（アプリケーション側で統合する）
select pref_name, population
  from PopTbl2
 where sex = '1'; -- 男性の人口

select pref_name, population
  from PopTbl2
 where sex = '2'; -- 女性の人口

-- 1回版
-- 行持ち（男女が別の行＝行で区別）を列持ち（男女が同じ行＝列で区別）に展開している
select pref_name,
       sum(case sex when '1' then population else 0 end) as cnt_m,
       sum(case sex when '2' then population else 0 end) as cnt_f
  from PopTbl2
 group by pref_name;

-- 条件分岐update
update Salaries
   set salary = case when salary >= 300000
                     then salary * 0.9
                     when salary >= 250000 and salary < 280000
                     then salary * 1.2
                     else salary end;

-- when句でexists
select CM.course_name,
       case when exists (select * from OpenCourses as OC where OC.month = '201806' and CM.course_id = OC.course_id)
            then 'O' else 'X' end as "6月",
       case when exists (select * from OpenCourses as OC where OC.month = '201807' and CM.course_id = OC.course_id)
            then 'O' else 'X' end as "7月",
       case when exists (select * from OpenCourses as OC where OC.month = '201808' and CM.course_id = OC.course_id)
            then 'O' else 'X' end as "8月"
  from CourseMaster as CM;

-- case式で集約関数を使う
select std_id,
       case when count (*) = 1
            then max(club_id)
            else max(case when main_club_flg = 'Y' then club_id else null end)
       end as main_club
  from StudentClub
 group by std_id
 order by std_id;
