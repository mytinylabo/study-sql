-- 連番の歯抜けを判定する
select
    '歯抜けあり' as gap
from
    SeqTbl
having
    count(*) < max(seq)
;

-- 歯抜けの最小値を探す
select
    min(seq + 1) as gap
from
    SeqTbl
where
    (seq + 1) not in (select seq from SeqTbl)
;

-- 歯抜け判定（1から始まらない数列にも対応）
select
    '歯抜けあり' as gap
from
    SeqCase3
having
    count(*) - 1  < max(seq) - min(seq)
;

-- 歯抜け最小値（1から始まらない数列にも対応）
select
    case
        when count(*) = 0 then 1
        when min(seq) > 1 then 1
        else (
            select
                min(seq + 1)
            from
                SeqCase4 S1
            where
                not exists (
                    select
                        seq
                    from
                        SeqCase4 S2
                    where S1.seq + 1 = S2.seq
                )
        )
    end
from
    SeqCase4
;

-- 最頻値を求める（ALL）
select
    income
    , count(*) as cnt
from
    Graduates
group by
    income
having
    count(*) >= all (
        select count(*) from Graduates group by income
    )
;

-- 最頻値を求める（MAX）
select
    income
    , count(*) as cnt
from
    Graduates
group by
    income
having
    count(*) >= (
        select
            max(cnt)
        from (
            select count(*) as cnt from Graduates group by income
        ) TMP
    )
;
