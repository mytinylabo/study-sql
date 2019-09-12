select * from SampleLike where strcol like 'ddd%';
select * from SampleLike where strcol like '%ddd%';
select * from SampleLike where strcol like '%ddd';

select * from SampleLike where strcol like 'abc__';
select * from SampleLike where strcol like 'abc___';
