-- 단일행함수
select abs(12), abs(-12);
select sign(-4), sign(12), sign(0);
select 123.1234, round(123.1534,1);
select 123,123, ceil(123.123), floor(123.123);
select mod(6,4), pow(3,2), greatest(12,13,14,11);
select interval(6,1,2,3,5,7), rand();
select instr('20180912','3');

select ename, sal
from emp
where instr(ename,'A') = 0;

SET @email="admin@ssafy.com";

select @email;
select substr(@email,1,instr(@email,'@')-1);
select substr(@email,instr(@email,'@')+1);

select ename, lpad(ename,10,'*'),rpad(ename,10,'*') from emp;
select length(lpad(ename,10,' ')), trim(lpad(ename,10,' ')) from emp;
select length(trim(' a bcd '));

-- 날짜 내장 함수
select now(), sysdate(), current_date(), curdate(),CURRENT_TIME(),curtime();
select year(now()), month(now()), day(now()), extract(year from now()), extract(month from now()), extract(day from now());

select year('2018-08-12'), extract(year from '2018-08-12');

select date_add(now(), interval 2 year);
select date_add(now(), interval 2 day);

-- case 표현식 when 비교1 then 결과값1
-- 				when 비교2 then 결과값2
-- 				else 결과값3;

select case substr('880818-2012312',8,1)
			when '1' then '남성'
            when '3' then '남성'
            else '여성'
			end;
            
-- case when 표현식 >= 비교1 then 결과값1
-- 		when 표현식 <= 비교2 then 결과값2
-- 		else 결과값3;

SELECT 
    CASE
        WHEN sal > 3000 THEN '와많이번다'
        WHEN sal > 2000 THEN '많이번다'
        WHEN sal > 1000 THEN '번다'
        ELSE '쪼끔번다'
    END AS 급여
FROM
    emp;
    
select ascii(' ');

select date_format(now(), '%Y:%M:%m:%d:%D:%T:%H:%h') from dual;
select date_format(now(), '%Y-%m-%d %H:%i:%s') from dual;
select sal, format(sal,'#,###') from emp;