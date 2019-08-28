create table Shohin
(shohin_id      char(4)         not null,
 shohin_mei     varchar(100)    not null,
 shohin_bunrui  varchar(32)     not null,
 hanbai_tanka   integer         ,
 shiire_tanka   integer         ,
 torokubi       date            ,
 primary key (shohin_id));
