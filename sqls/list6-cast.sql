select cast('0001' as integer) as int_col;
select cast('2009-12-14' as date) as date_col;
select extract(year from cast('2009-12-14' as date)) as year;

select coalesce(null, 1)                  as col_1,
       coalesce(null, 'test', null)       as col_2,
       coalesce(null, null, '2009-11-01') as col_3;

select coalesce(str2, 'NULLです') from SampleStr;
