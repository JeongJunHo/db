-- 1. emp 테이블 정보의 구조를 확인하는 sql을 작성 하세요.
desc emp;

-- 2. 이름이 k로 시작하는 사원의 사원번호, 이름, 입사일, 급여를 검색하세요.
select
	EMPNO,
    ENAME,
    HIREDATE,
    SAL
from emp
where 1
	and ENAME like 'k%';
    
-- 3. 입사일이 2000년도인 사람의 모든 정보를 검색하세요.
select *
from emp
where 1
	and year(hiredate) = '2000';
    
-- 4. 커미션이 NULL이 아닌 사람의 모든 정보를 검색하세요.
select *
from emp
where 1
	and comm is not null;
    
-- 5. 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 검색하세요.
select
	ename,
    job,
    sal
from emp
where 1
	and deptno = 30
    and sal >= 1500;
    
-- 6. 부서번호가 30인 사람 중 사원번호 SORT하여 출력되도록 검색하세요.
select *
from emp
where 1
	and deptno = 30
order by empno;

-- 7. 급여가 많은 순으로 SORT하여 출력되도록 검색하세요.
select *
from emp
order by sal desc;

-- 8. 부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 검색하세요.
select *
from emp
order by deptno, sal desc;

-- 9. 부서번호로 DESCENDING SORT하고, 이름 순으로 ASCENDING SORT, 급여 순으로 DESCENDING SORT 하여 출력되도록 검색하세요.
select *
from emp
order by deptno, ename, sal desc;

-- 10. emp Table에서 이름, 급여, 커미션 금액, 총액(급여+커미션금액)을 구하여 총액이 많은 순서로 검색하세요. 단, 커미션이 NULL인 사람은 제외한다.(커미션금액: sal*comm/100)
select
	ename,
    sal,
    sal*comm/100 as calc_comm,
    sal+(sal*comm/100) as total
from emp
where 1
	and comm is not null
order by total desc;

-- 11. 10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스 금액, 부서번호를 검색하세요.
select
	ENAME,
    SAL,
    SAL / 100 * 13 as bonus,
    DEPTNO
from emp
where 1
	and DEPTNO = 10;
    
-- 12. 부서번호가 20인 사원의 시간당 임금을 계산하여 검색하세요. 단, 1달의 근무일수는 12일이고, 1일 근무시간은 5시간이다. 출력양식은 이름, 급여, 시간당 임금(소수이하 첫 번째 자리에서 반올림)을 검색하세요.
select
	ENAME,
    SAL,
    round(SAL / 12 / 5,1) as h_pay
from emp
where 1
	and DEPTNO = 20;
    
-- 13. 급여가 $1,500부터 $3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다. 이를 이름, 급여, 회비(소수점 두자리아래에서 반올림)를 검색하세요.
select
	ENAME,
    SAL,
    round(SAL / 100 * 15,2) as dues
from emp
where 1
	and SAL between 1500 and 3000;
    
-- 14. 모든 사원의 실수령액을 계산하여 검색하세요.. 단, 급여가 많은 순으로 이름, 급여, 실수령액을 검색하세요..(실수령액은 급여에 대해 10%의 세금을 뺀 금액)
select
	ENAME,
    SAL,
	SAL * 0.9 as real_sal
from emp
order by SAL desc;

-- 15. 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 이름만을 검색하세요.
select
	substr(ENAME, 1, 3) as threeWord
from emp
where 1
	and length(ENAME) >= 6;
    
-- 16. 10번 부서 월급의 평균, 최고, 최저, 인원수를 구하여 검색하세요.
select
	avg(sal) as avg_sal,
    max(sal) as max_sal,
    min(sal) as min_sal,
    count(sal) as count
from emp
where 1
	and deptno = 10
group by deptno;

-- 17. 각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호,업무명, 인원수를 검색하세요.
select
	deptno,
    job,
    count(job) as cnt
from emp
group by deptno, job
order by deptno;

-- 18. 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 검색하세요.
select 
	job,
    count(job) as cnt
from emp
group by job
having cnt >= 4;

-- 19. 입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 검색하세요.
select
	ENAME,
    HIREDATE,
    to_days(now()) - to_days(HIREDATE) as workDay
from emp;

-- 20. 직원의 이름, 근속년수를 구하여 검색하세요
select
	ENAME,
    HIREDATE,
    year(now()) - year(HIREDATE) as workYear
from emp;

-- 21. 업무가 ANALYST인 모든 사원의 사원번호, 이름, 입사일, 급여를 검색하세요.
select
	empno,
    ename,
    hiredate,
    sal
from emp
where 1
	and job = 'ANALYST';
    
-- 22. 부서 번호를 한 번씩만 출력되도록 검색하세요.
select
	deptno
from emp
group by deptno;

-- 23. 부서 번호와 부서별 연봉 평균을 검색하세요.
select
	deptno,
    sum(sal * 12) / count(empno) as avgPrice
from emp
group by deptno;

-- 24. 부서별로 급여의 합계를 구하되 합계가 1,000 이상인 부서와 합계를 검색하세요.
select
	deptno,
	sum(sal) as total
from emp
group by deptno
having total >= 1000;

-- 25. emp 테이블의 행의 개수를 검색하세요.
select count(*) from emp;