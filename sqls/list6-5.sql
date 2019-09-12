create table SampleStr
(str1 varchar(40),
 str2 varchar(40),
 str3 varchar(40));

begin transaction;

insert into SampleStr (str1, str2, str3) values ('あいう',       'えお',   null);
insert into SampleStr (str1, str2, str3) values ('abc',          'def',    null);
insert into SampleStr (str1, str2, str3) values ('山田',         '太郎',   'です');
insert into SampleStr (str1, str2, str3) values ('aaa',          null,     null);
insert into SampleStr (str1, str2, str3) values (null,           'あああ', null);
insert into SampleStr (str1, str2, str3) values ('@!#$%',        null,     null);
insert into SampleStr (str1, str2, str3) values ('ABC',          null,     null);
insert into SampleStr (str1, str2, str3) values ('abc',          null,     null);
insert into SampleStr (str1, str2, str3) values ('abc太郎',      'abc',    'ABC');
insert into SampleStr (str1, str2, str3) values ('abcdefabc',    'abc',    'ABC');
insert into SampleStr (str1, str2, str3) values ('ミックマック', 'ッ',     'っ');

commit;
