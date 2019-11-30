show databases;
use scott;
show tables;
desc emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

select *
from emp;

select ename, sal, deptno, sal*12 as 연봉
from emp;

-- 이름(급여) 출력하세요
select concat(ename,'(',sal,')') as 이름
from emp;

select date_add(now(), INTERVAL -100 day) from dual;

select *
from emp
where deptno = 20
and sal = 800;

select ename, sal, deptno, job
from emp
where 1 = 1
and sal between 800 and 2000;

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
where comm is null;

select ename, sal, job, deptno
from emp
where 1
	and sal > 1500
    or job = 'clerk'
	and deptno in (20,10);
    
select *
from emp
where 1
	and (deptno,job) in ((10,'manager'),(20,'clerk'));
    
select * from emp where ename like 'SCo_';