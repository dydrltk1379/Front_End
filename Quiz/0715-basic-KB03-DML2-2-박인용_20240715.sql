-- shop7 db, import
drop schema shop7;
create schema shop7;
use shop7;

-- 집계, 그룹함수를 이용하여 다음을 해결하시오 .
-- emp_data 테이블 이용

-- 1. 전체 직원수 출력
select count(*) from emp_data;

-- 2. DEPTNO가 20이거나 MGR이 7700이하인 직원수 출력
select * from emp_data where DEPTNO in(20) and MGR<=7700;

-- 3. DEPTNO가 10 또는 20인 직원의 SAL 최저값 출력
select DEPTNO, min(SAL) from emp_data where DEPTNO in (10, 20) group by DEPTNO;

-- 4. 직원의 SAL 최저값, 최고값, 합계 출력
select min(SAL), max(SAL), sum(SAL) from emp_data;

-- 5. DEPTNO별 SAL 평균 출력
select avg(SAL) from emp_data group by DEPTNO;

-- 6. DEPTNO별 SAL 합계를 DEPTNO 오름차순으로 출력
select sum(SAL) from emp_data group by DEPTNO;

-- 7. DEPTNO별 SAL 평균이 2000이상인 SAL평균을 DEPTNO역순으로 출력
select avg(SAL)>=2000 from emp_data group by DEPTNO order by DEPTNO desc;

-- 8. JOB이 MANAGER인 직원의 전체 수, 월급의 평균 검색
select count(*), avg(SAL) from emp_data group by JOB having JOB = 'MANAGER';

-- 9. ENAME에 S를 포함하는 직원의 전체 수를 검색
select count(*) from emp_data where ENAME LIKE ('%S%');

-- 10. SAL이 3000이상이고, COMM이 null이 아닌 직원의 전체 수 검색, SAL의 역순으로 출력
select *, SAL>=3000 from emp_data  where comm is not null order by SAL DESC;