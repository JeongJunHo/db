create database testdb2;
use testdb2;

-- 1.
CREATE TABLE MYDEPT(
	DEPT_NO char(8),
    DEPT_NAME varchar(100) not null,
    DEPT_LOC varchar(100) not null,
    DEPT_TEL_NO varchar(100) not null
);
-- 2.
ALTER TABLE MYDEPT ADD CONSTRAINT DEPT_PK PRIMARY KEY (DEPT_NO);
-- 3.
insert into MYDEPT(DEPT_NO, DEPT_NAME, DEPT_LOC, DEPT_TEL_NO)
values 
	('10', 'SALES', 'SEOUL', '02-671-1111'),
    ('20', 'FINANCE', 'SEOUL', '02-862-2222'),
    ('30', 'HR', 'BUSAN', '051-111-1111'),
    ('40', 'PURCHASE', 'BUSAN', '051-222-2222'),
    ('50', 'MANAGEMENT', 'SEOUL', '02-383-3333');

-- 4.
CREATE TABLE MYEMP(
	EMP_NO int,
    EMP_NAME varchar(100),
    EMP_MGE int,
    HIREDATE date,
    SAL int,
    DEPT_NO char(8)
);
-- 5.
ALTER TABLE MYEMP ADD CONSTRAINT EMP_PK primary key (EMP_NO);
ALTER TABLE MYEMP ADD CONSTRAINT EMP_FK foreign key(DEPT_NO) references MYDEPT(DEPT_NO);
-- 6.
insert into MYEMP(EMP_NO, EMP_NAME, EMP_MGE, HIREDATE, SAL, DEPT_NO)
values
	(1001, 'KIM', 1003, date('2005-01-15'), 4750, '20'),
	(1002, 'LEE', 1003, date('2008-06-05'), 3000, '30'),
    (1003, 'PARK', 1003, date('2007-11-28'), 3500, '10');
-- 7.
update MYEMP set DEPT_NO = '50' where DEPT_NO = '30';
-- 8.
delete from MYDEPT where DEPT_NO = '30';
-- 9.
insert into MYEMP (EMP_NO, EMP_NAME, EMP_MGE, HIREDATE, SAL, DEPT_NO)
values (2001, 'chung', 1001, date_format(now(), '%Y-%m-%d'), 3000, '50');