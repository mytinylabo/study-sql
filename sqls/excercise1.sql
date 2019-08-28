-- 1.1
create table Jyushoroku
(toroku_bango   integer         not null,
 name           varchar(128)    not null,
 jyusho         varchar(256)    not null,
 tel_no         char(10)        ,
 mail_address   char(20)        ,
 primary key (toroku_bango));

-- 1.2
alter table Jyushoroku add column yubin_bango varchar(8) not null;

-- 1.3
drop table Jyushoroku;

-- 1.4
-- 1.1のSQL文を再度実行する
