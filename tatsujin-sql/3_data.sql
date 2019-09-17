-- p44
create table Products
(name  varchar(10) not null primary key,
 price integer     not null);

begin transaction;
insert into Products values ('りんご', 100);
insert into Products values ('みかん', 50);
insert into Products values ('バナナ', 80);
commit;

-- p49
create table Products2
(name  varchar(10) not null,
 price integer     not null)
with(oids); -- PostgreSQL独自

begin transaction;
insert into Products2 values ('りんご', 50);
insert into Products2 values ('みかん', 100);
insert into Products2 values ('みかん', 100);
insert into Products2 values ('みかん', 100);
insert into Products2 values ('バナナ', 80);
commit;

-- p51
create table Addresses
(name      varchar(10) not null primary key,
 family_id integer     not null,
 address   varchar(40) not null);

begin transaction;
insert into Addresses values ('前田義明', 100, '東京都港区虎ノ門 3-2-29');
insert into Addresses values ('前田由美', 100, '東京都港区虎ノ門 3-2-92');
insert into Addresses values ('加藤茶',   200, '東京都新宿区西新宿 2-8-1');
insert into Addresses values ('加藤勝',   200, '東京都新宿区西新宿 2-8-1');
insert into Addresses values ('ホームズ', 300, 'ベーカー街 221B');
insert into Addresses values ('ワトソン', 400, 'ベーカー街 221B');
commit;

-- p52
create table Products3
(name  varchar(10) not null primary key,
 price integer     not null);

begin transaction;
insert into Products3 values ('りんご', 50);
insert into Products3 values ('みかん', 100);
insert into Products3 values ('ぶどう', 50);
insert into Products3 values ('スイカ', 80);
insert into Products3 values ('レモン', 30);
insert into Products3 values ('いちご', 100);
insert into Products3 values ('バナナ', 100);
commit;
