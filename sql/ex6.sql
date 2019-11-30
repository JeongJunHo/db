use testDB;
-- DDL
Create Table SSAFY(num varchar(8) primary key, name varchar(50), jumsu int default 0, gender char(1) check(gender in('m','f')), regdate datetime default current_timestamp);

alter table ssafy add(cnt int default 0);
alter table ssafy drop cnt;

rename table ssafy to membername;

desc membername;

rename table membername to ssafy;

desc ssafy;

drop table ssafy;
-- DML
insert into ssafy(num, name, jumsu, gender)
values('111111', '홍길동', 100, 'm');

insert into ssafy(num, name, jumsu, gender)
values('222222', '홍길동', 100, 'f');

select * from ssafy;

update ssafy set gender = 'f' where num = '2222222';