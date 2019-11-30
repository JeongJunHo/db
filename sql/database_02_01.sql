use testDB;
-- DDL
Create Table SSAFY(num varchar(8) primary key
		, name varchar(50) not null
		, jumsu int default 0, gender char(1) check(gender in('m','f'))
		, regdate datetime default current_timestamp);

alter table ssafy add(cnt int default 0);
alter table ssafy drop cnt;

rename table ssafy to membername;
rename table membername to ssafy;

desc membername;

desc ssafy;

drop table ssafy;

-- DML
insert into ssafy(num, name,  gender)
values('111111', '홍길동','m');

insert into ssafy
value('222222', '둘리',90,'f', now());

insert into ssafy
value('222222', '둘리',90,'m', now());

insert into ssafy
value(null, '둘리',90,'m', now());

update ssafy set gender = 'f' 
where num = '111111';

select * from ssafy;

delete from ssafy where  1;

use scott;
-- view

create view vEmp 
as 
select concat(ename,'(',sal,')') as name , sal * 12 +ifnull(comm,0) 년봉, deptno
from emp;

SELECT 
    *
FROM
    (SELECT 
        CONCAT(ename, '(', sal, ')') AS name1,
            sal * 12 + IFNULL(comm, 0) 년봉,
            deptno
    FROM
        emp) as aa;

insert into vemp (name, 년봉, deptno) values('111',1000,30);


-- index 
create index idxemp on emp( ename);

drop index idxemp on emp;

select *
from emp
where 1
 or sal = 800
 and ename = 'smith';









