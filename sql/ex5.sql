-- 다중행함수(집계함수)
-- sum, count, max, min, avg
select ename, sum(sal), avg(sal), count(sal), max(sal), min(sal)
from emp;

select sum(comm)
from emp;

select sum(comm), avg(ifnull(comm,0)), count(comm), count(sal)
from emp;

select round(avg(ifnull(comm,0))) from emp;

select count(max(sal)) from dual; -- 다중행 함수를 다중행 함수에 넣을 순 없음

select sum(sal)
from emp
where deptno = 10;
select sum(sal)
from emp
where deptno = 20;
select sum(sal)
from emp
where deptno = 30;

select distinct deptno from emp;

select deptno, sum(sal), avg(sal),max(sal),min(sal),count(sal)
from emp
where sal > 1000
group by deptno
order by sum(sal) desc;

select if(3 < 4, '참잘했어요', '틀렸어요') from dual;

select job, sum(sal), avg(sal), max(sal), min(sal), count(sal)
from emp
group by job;

select job, sum(sal), avg(sal), max(sal), min(sal), count(sal)
from emp
group by job, deptno
order by job;

select distinct job, deptno, sum(sal), round(sal),max(sal),min(sal),count(sal)
from emp
group by job, deptno
order by job;

select distinct job, deptno from emp order by job;

select deptno, sum(sal)
from emp
where 1
group by deptno
having sum(sal) >= 9000;

select *
from(
	select deptno, sum(sal) as b
	from emp
	where 1
	group by deptno
)z
where b >= 9000;

select
	deptno,
    sum(sal)
from emp
group by deptno, job;

select
	*
from emp
group by deptno;

select 
	ifnull(deptno,'합계'),
	sum(case when job = 'clerk' then sal else 0 end) as cherk,
	sum(case when job = 'manager' then sal else 0 end) as manager,
	sum(case when job = 'president' then sal else 0 end) as president,
	sum(case when job = 'analyst' then sal else 0 end) as analyst,
	sum(case when job = 'salesman' then sal else 0 end) as salesman,
	sum(sal) as total
from emp a
group by deptno with rollup;

select if(2 > 1 and 3 > 1, if(2 > 1,3,4), 1);

select 
	ifnull(deptno,'합계') as deptno,
	if(deptno is null and job is null,'합계',if(job is null,'소계',job)) as job, 
    sum(sal)
from emp
group by deptno, job with rollup
order by 1
limit 3,3;



select deptno, sum(sal)
from emp
where deptno = 10
union all
select deptno, sum(sal)
from emp
where deptno = 20;