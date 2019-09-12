select str1, str2, str1 || str2 as str_concat from SampleStr;
select str1, str2, str3, str1 || str2 || str3 as str_concat from SampleStr where str1 = '山田';
select str1, length(str1) as len_str from SampleStr;
select str1, lower(str1) as low_str from SampleStr where str1 in ('ABC', 'aBC', 'abc', '山田');
select str1, str2, str3, replace(str1, str2, str3) as rep_str from SampleStr;
select str1, substring(str1 from 3 for 2) as sub_str from SampleStr;
select str1, upper(str1) as up_str from SampleStr where str1 in ('ABC', 'aBC', 'abc', '山田');
