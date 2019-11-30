use scott;
-- view
create view vEmp 
as 
select concat(ename, '(', sal, ')') as name, sal * 12 + ifnull(comm,0) as '년봉', deptno
from emp;

select * from (select concat(ename, '(', sal, ')') as name, sal * 12 + ifnull(comm,0) as '년봉', deptno
from emp)z;

insert into vemp (name, 년봉, deptno) values('정준호', 2000, 10);

-- index
create index idxemp on emp(ename);

drop index idxemp on emp;

select ename
from emp
where sal = 800
and ename = 'smith';

create user test identified by 'test1';

grant all privileges on *.* to 'test'@'%' identified by 'test1';