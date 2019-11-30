show databases;
use scott;
show tables;
desc emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

select *
from emp;

select ename, sal, deptno, sal*12 as 년봉
from emp;

--  이름(급여)  출력하세요
select concat(ename,'(', sal,')') as 이름
from emp;

-- select to_days(now()) - to_days('2019-07-01') from dual;
select floor(mod(rand()*100,45))+1 from dual;

select distinct  job
from emp;

select ename, sal, deptno, job
from emp
 where 1 = 1
 and sal between 1800 and 3000;
 -- and sal <= 3000;

select ename, sal, deptno, job
 from emp
where 1 = 1
and job in ('clerk','manager');

select ename, sal, deptno, job
 from emp
where 1 = 1
and sal <> 800
and sal != 800
and not sal = 800;

select ename, sal, ifnull(comm,0)+100, sal+ifnull(comm,0)
from emp
-- where comm is null
;

select ename, sal, job, deptno
from emp
where 1
 and sal > 1500
 or job = 'clerk'
 and deptno in (20,10);
 
 -- 부서번호가 10이고 업무가 manager 이거나 20이고 clerk 인사람을 구하세요
 select *
 from emp
 where 1
 and (deptno,job) in ((10,'manager'),(20,'clerk'));
 
 select * from emp where ename like 'SCo%';
 
 select ename, sal, deptno      
 from emp                        
 where deptno in (20,30)        
 and sal > 1000                 
 order by sal asc, ename asc;   
 
 
 
