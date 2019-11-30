use scott;
-- 다중행함수(집계함수)
-- sum, count, max, min, avg
select ename, sum(sal) , avg(sal), count(sal), max(sal), min(sal)
from emp;

select sum(comm)/count(ifnull(comm,0)) , avg(comm), avg(ifnull(comm,0)), count(comm),count(sal)
from emp;

select round(avg(ifnull(comm,0))) from emp;

select count(max(sal)) from dual;

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

-- 급여가 1000 이상인 사원들의 부서별 급여계산등등 을 급여의 역순으로 출력 
select deptno, sum(sal),avg(sal),max(sal),min(sal),count(sal)
from emp
where sal >=1000
group by deptno
order by sum(sal) desc;

select job,  sum(sal), round((sal)),max(sal),min(sal),count(sal)
from emp
group by job;


select job, deptno, sum(sal), max(sal),min(sal),count(sal)
from emp
group by job, deptno
order by job;

select distinct job, deptno from emp order by job;


-- 부서별 급여합계를 구하는데 급여의 합계가 9000 이상인 부서만 구하세요
select deptno, sum(sal) as sum1
from emp
where 1
group by deptno
 having sum1 >= 9000
;

select deptno, job , sum(sal)
from emp
group by deptno,job;

select ifnull(deptno,'합계')
		,sum(case when job='clerk' then sal else 0 end) as clerk
        ,sum(case when job='manager' then sal else 0 end) as manager
        ,sum(case when job='president' then sal else 0 end) as president
        ,sum(case when job='analyst' then sal else 0 end) as analyst
        ,sum(case when job='salesman' then sal else 0 end) as salesman
        ,sum(sal) as sum 
from emp
 group by deptno with rollup ;
select       ifnull(deptno,'합계')
			, ifnull(job, case when deptno is null then '합계' else '소계' end)
            , sum(sal)
from emp
group by deptno,job with rollup;

select       ifnull(deptno,'합계')
			,case when job is null then case when deptno is null then '합계' else '소계' end else job end
            , sum(sal)
from emp
group by deptno,job with rollup
order by 1
limit 3,3
;


select deptno, sum(sal)
from emp
where deptno = 10
union all
select deptno, sum(sal)
from emp
where deptno = 20;

