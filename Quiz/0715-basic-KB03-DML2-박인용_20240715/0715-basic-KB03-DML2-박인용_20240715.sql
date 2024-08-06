-- shop 7 생성 + csv파일 import
drop schema shop7;
create schema shop7;
use shop7;

select * from dept_data;
select * from emp_data;

-- 1. ENAME의 글자수 검색
select COUNT(ename) from emp_data;

-- 2. JOB이 MANAGER인 사람의 ENAME 글자수 검색
select COUNT(ename) from emp_data where job = 'MANAGER';

-- 3. COMM이 null인 사람의 ENAME, JOB 검색
select ename, job from emp_data where comm is null;

-- 4. COMM이 null이 아닌 사람의 HIREDATE 검색
select hiredate from emp_data where comm is not null;

-- 5. ENAME의 2번째글자부터 끝까지 검색
select substr(ename, 2) from emp_data;

-- 6. JOB의 1번째 글자부터 3번째 글자까지 검색
select substr(job, 1, 3) from emp_data;

-- 7. ENAME의 글자 중 K를 P으로 변경하여 검색
select replace(ename, 'K', 'P') from emp_data;

-- 8. ENAME과 EMPNO을 이용하여 ‘7369번은 SMITH입니다' 형식으로 모든 row 출력
select concat(empno, '번은 ', ename, '입니다') from emp_data;

-- 9. HIREDATE 이용하여 입사한 월과 연도를 출력
select EXTRACT(year from hiredate) as 년, EXTRACT(month from hiredate) as 월 from emp_data;

-- 10. JOB컬럼과 함께 JOB이 MANAGER이면 level1, SALESMAN이면 level2, 기타이면 level3라고 LEVEL_RESULT컬럼 출력
select empno, ename,
	case
		when job = 'MANAGER' then 'level1'
		when job = 'SALESMAN' then 'level2'
        else 'level3'
	end as LEVEL_RESULT
from emp_data;