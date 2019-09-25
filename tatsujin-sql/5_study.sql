-- 全員が皆勤出席だった場合のテーブルを作成する
select distinct
    M1.meeting
    , M2.person
from
    Meetings M1
    cross join Meetings M2
;

-- ↑を利用し、各ミーティングの欠席者を求める
select distinct
    M1.meeting
    , M2.person
from
    Meetings M1
    cross join Meetings M2
where
    not exists (
        select
            *
        from
            Meetings M3
        where
            M1.meeting = M3.meeting
            and M2.person = M3.person
    )
;

-- ↑の差集合演算バージョン
select
    M1.meeting
    , M2.person
from
    Meetings M1
    cross join Meetings M2
except
    select
        *
    from Meetings
;

-- 全ての教科が50点以上の生徒
select distinct
    TS1.student_id
from
    TestScores TS1
where
    not exists (
        select
            *
        from
            TestScores TS2
        where
            TS1.student_id = TS2.student_id
            and TS2.score < 50
    )
;

-- 算数が80点以上、国語の点数が50点以上（データがない教科は条件を満たしているものとする）
select distinct
    student_id
from
    TestScores TS1
where
    subject in ('算数', '国語')
    and not exists (
        select
            *
        from
            TestScores TS2
        where
            TS1.student_id = TS2.student_id
            and case TS2.subject
                    when '算数' then TS2.score < 80
                    when '国語' then TS2.score < 50
                    else false
                end
    )
;

-- 算数が80点以上、国語の点数が50点以上（データがない教科は条件を満たしていないものとする）
select
    student_id
from
    TestScores TS1
where
    subject in ('算数', '国語')
    and not exists (
        select
            *
        from
            TestScores TS2
        where
            TS1.student_id = TS2.student_id
            and case TS2.subject
                    when '算数' then TS2.score < 80
                    when '国語' then TS2.score < 50
                    else false
                end
    )
group by student_id
having count(*) = 2
;

-- ちょうど1番まで終わっているプロジェクトを抽出する（述語論理的解答）
select
    *
from
    Projects P1
where
    -- [気になる]
    -- P1の各レコードについて project_id が同じ場合はwhere句の真偽は変わらない。
    -- つまり全く同じ計算を繰り返してないか？
    not exists (
        select
            *
        from
            Projects P2
        where
            P1.project_id = P2.project_id
            and status <> case when step_nbr <= 1 then '完了' else '待機' end
    )
;

-- ちょうど1番まで終わっているプロジェクトを抽出する（集合論的解答）
select
    project_id
from
    Projects
group by
    project_id
having
    -- having句では集約キーで絞り込んだ部分集合をテーブルとして扱えるイメージ。
    -- ただし集約する必要がある。
    count(*) = sum(
        case
            when step_nbr <= 1 and status = '完了' then 1
            when step_nbr >  1 and status = '待機' then 1
            else 0
        end
    )
;

-- オール1の行を探す
select
    *
from
    ArrayTbl
where
    1 = all (array[col1, col2, col3, col4, col5, col6, col7, col8, col9, col10])
;

-- 少なくとも一つは9の行を探す
select
    *
from
    ArrayTbl
where
    9 = any (array[col1, col2, col3, col4, col5, col6, col7, col8, col9, col10])
;

-- オールNULLの行を探す（3値論理に注意せよ）
select
    *
from
    ArrayTbl
where coalesce(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10) is null
;
