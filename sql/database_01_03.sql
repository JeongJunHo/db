-- 단일행함수
-- 숫자내장함수
select abs(12), abs(-12);
select sign(-4), sign(12), sign(0);
select 123.1234, round(123.1554,-1);
select 123.123 , ceil(123.123), floor(123.123);
select mod(6,4), pow(3,2), greatest(12,13,14,11);
select interval(6,1,2,3,5,7), rand();

select floor(mod(rand()*100,45))+1 from dual;

-- 문자내장함수
select ename, lower(ename), upper(ename) from emp;
select concat('abc','drf');
select substr('20180912',7,2) ;
select instr('20180912','3');
select ascii('1');
select ename, sal
from emp
where instr(ename,'A') = 0;

-- admin@ssafy.com ssafygood@multicamus.com
select substr('ssafygood@multicamus.com',1,
				instr('ssafygood@multicamus.com','@')-1);
select substr('ssafygood@multicamus.com',
				instr('ssafygood@multicamus.com','@')+1);

select ename, lpad(ename,10,'*'),rpad(ename,10,'*') from emp;
select length(lpad(ename,10,' ')), length(trim(lpad(ename,10,' '))) from emp;
select length(trim(' a bcd ')) ;

-- 날짜 내장 함수
select now(), sysdate(), current_date(),curdate(),current_time(),curtime();
select year(now()), month(now()), day(now())
	, extract(year from now()), extract(month from now()), extract(day from now());	

select year('2018-08-12'),  extract(year from '2018-08-12');

select if(3>4,'참','거짓') from dual;

select day(date_add(now(), interval -2 day)) ;
-- 동등비교
-- case 표현식 when 비교1 then 결과값1
--            when 비교2 then 결과값2
--  			  else 결과값3
-- 			end;


select case substr('880818-2012312',8,1) 
			when '1' then '남성'
            when '3' then '남성'
            else '여성'
            end as 성별; 
            
-- 부등호비교
-- case  when 표현식 >= 비교1 then 결과값1
--       when 표현식 <= 비교2 then 결과값2
--  			  else 결과값3
-- 			end;

SELECT 
	ename, sal, job,
    CASE
        WHEN sal > 3000 THEN '와많이번다'
        WHEN sal > 2000 THEN '많이번다'
        WHEN sal > 1000 THEN '번다'
        ELSE '쪼금번다'
    END AS 급여
FROM
    emp; 

select date_format(now(),'%Y-%m-%d %H:%i:%s') from dual;   

select sal, format(sal,'#,###,###') from emp; 