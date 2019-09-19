-- Bクラスの東京在住の生徒と年齢が一致しないAクラスの生徒
select
    *
from
    Class_A
where
    age not in (
        select
            age
        from
            Class_B as B
        where
            B.city = '東京' -- and B.age is not null -- NULLチェックしないとダメだよ！
    )
;

-- existsを使えばOK
select
    *
from
    Class_A as A
where
    not exists (
        select
            *
        from
            Class_B as B
        where
            B.city = '東京' and A.age = B.age
    )
;
