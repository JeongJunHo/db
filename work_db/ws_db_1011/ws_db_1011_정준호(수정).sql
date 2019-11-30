use scott;

drop table emp;
drop table dept;
-- 기본 테이블 insert 및 정보 입력
CREATE TABLE IF NOT EXISTS `EMP` (
  `EMPNO` int(11) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(11) DEFAULT NULL,
  `HIREDATE` datetime DEFAULT NULL,
  `SAL` double DEFAULT NULL,
  `COMM` double DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `EMP` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17 00:00:00', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20 00:00:00', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22 00:00:00', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02 00:00:00', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28 00:00:00', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01 00:00:00', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09 00:00:00', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19 00:00:00', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17 00:00:00', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08 00:00:00', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-05-23 00:00:00', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03 00:00:00', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03 00:00:00', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23 00:00:00', 1300, NULL, 10);

-- 1. 위와 테이블 구조가 되도록 DEPT 테이블을 생성하고 DEPT 테이블에 아래의 데이터를 추가하여 보자.
CREATE TABLE IF NOT EXISTS DEPT (
  DEPTNO int(2),
  DNAME varchar(14),
  LOC varchar(13),
  PRIMARY KEY (DEPTNO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO DEPT VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

-- 2. 위와 테이블 구조가 되도록 EMP 테이블을 수정하여 보자.
alter table emp modify empno int(4);
alter table emp modify ename varchar(10);
alter table emp modify job varchar(10);
alter table emp modify mgr int(4);
alter table emp modify hiredate date;
alter table emp modify sal decimal(7,2);
alter table emp modify comm decimal(7,2);
alter table emp modify deptno int(2);
ALTER TABLE EMP ADD CONSTRAINT PK_EMP PRIMARY KEY (EMPNO);
ALTER TABLE EMP ADD CONSTRAINT FK_EMP FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO);

-- 3. emp와 dept Table을 JOIN하여 이름, 급여, 부서명을 검색하세요.
select 
	a.ename,
    a.sal,
    a.job
from 
	emp a
    join dept b on a.deptno = b.deptno;
    
-- 4. 이름이 ‘KING’인 사원의 부서명을 검색하세요.
select 
	b.dname
from 
	emp a
    join dept b on a.deptno = b.deptno
where a.ename = 'KING';

-- 5. dept Table에 있는 모든 부서를 출력하고, emp Table에 있는 DATA와 JOIN하여 모든 사원의 이름, 부서번호, 부서명, 급여를 출력 하라.
select 
	emp.ename,
	dept.deptno,
    dept.DNAME,
    emp.sal
from 
	emp 
    right outer join dept using(deptno);

-- 6. emp Table에 있는 empno와 mgr을 이용하여 서로의 관계를 다음과 같이 출력되도록 쿼리를 작성하세요. ‘SCOTT의 매니저는 JONES이다’
select
	concat(a.ename, "의 매니저는 ", b.ename, "이다") as message
from
	emp a join emp b on a.mgr = b.empno;
    
-- 7. 'SCOTT'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 검색하세요.
select 
	a.ename,
    b.DNAME,
    a.sal,
    a.job
from 
	emp a
    join dept b on a.deptno = b.deptno
where 1
	and a.job in (select job from emp where ename='SCOTT');
    
-- 8. 'SCOTT’가 속해 있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 검색하세요.
select 
	a.empno,
    a.ename,
    a.hiredate,
    a.sal
from 
	emp a
where 1
	and a.deptno in (select deptno from emp where ename='SCOTT');
    
-- 9. 전체 사원의 평균급여보다 급여가 많은 사원의 사원번호, 이름,부서명, 입사일, 지역, 급여를 검색하세요.
select
	emp.empno,
    emp.ename,
    dept.dname,
    emp.hiredate,
    dept.loc,
    emp.sal
from emp join dept using(deptno)
where sal > (select sum(sal) / count(empno) from emp);

-- 10. 30번 부서와 같은 일을 하는 사원의 사원번호, 이름, 부서명,지역, 급여를 급여가 많은 순으로 검색하세요.
select
	emp.empno,
    emp.ename,
    dept.dname,
    dept.loc,
    emp.sal
from emp join dept using(deptno)
where deptno=30 
order by sal desc;

-- 11. 10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 지역을 검색하세요.
select
	a.empno,
    a.ename,
    b.dname,
    a.hiredate,
    b.loc
from 
	emp a
    join dept b using(deptno) 
where 1
and deptno = 10
and not exists (select 1 from emp where deptno=30 and job = a.job);

-- 12. ‘KING’이나 ‘JAMES'의 급여와 같은 사원의 사원번호, 이름,급여를 검색하세요.
select
	a.empno,
    a.ename,
    a.sal
from emp a join dept b using(deptno) 
where a.sal in (select sal from emp where ename in ('KING', 'JAMES'));

-- 13. 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호,이름, 급여를 검색하세요.
select
	a.empno,
    a.ename,
    a.sal
from emp a
where 1
	and a.sal >all (select sal from emp where deptno=30);

-- 14. 이름 검색을 보다 빠르게 수행하기 위해 emp 테이블 ename에 인덱스를 생성하시오.
alter table emp add index ename_idx(ename);

-- 15. 이름이 'ALLEN'인 사원의 입사연도가 같은 사원들의 이름과 급여를 출력하세요.
select
	ename,
    sal
from emp
where 
	year(hiredate) in (select year(hiredate) from emp where ename = 'ALLEN');
-- 16. 부서별 급여의 합계를 출력하는 View를 작성하세요.
create view dept_total_view as select b.deptno, b.dname, sum(sal) as sum from emp a join dept b using(deptno) group by deptno;

-- 17. 14번에서 작성된 View를 이용하여 부서별 급여의 합계가 큰 1~3순위를 출력하세요
select * from dept_total_view order by sum desc limit 3;