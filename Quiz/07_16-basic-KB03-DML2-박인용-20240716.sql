-- shop7 db, import
drop schema shop7;
create schema shop7;
use shop7;

select * from dept_data;
select * from emp_data;

-- 1. DEPTNO컬럼을 기준으로 두 개의 테이블을 조인 후, EMPNO, JOB, SAL, COMM, DNAME, LOC를 검색하여 출력하시오.(INNER JOIN)
select EMPNO, JOB, SAL, DNAME, LOC from emp_data inner join dept_data using(DEPTNO);

-- 2. EMP테이블 내에는 일반 직원과 매니저가 함께 저장되어있다. 일반 직원의 EMPNO, JOB, SAL과 일반직원을 관리하는 MGR의 EMPNO, JOB을 함께 검색하여 출력하시오.(SELF JOIN)
select e1.EMPNO, e1.JOB, e1.SAL, e2.EMPNO, e2.JOB from emp_data e1 inner join emp_data e2 on e1.EMPNO = e2.MGR ;
 
-- 3. 모든 DEPT_DATA 테이블의 항목이 출력되고, 두 테이블 간 DEPTNO가 일치하는 것을 찾아 EMP_DATA테이블의 DEPTNO, EMPNO, ENAME 항목을 추가 출력되도록 조인하시오.(OUTER JOIN)
select d.*, e.DEPTNO, EMPNO, ENAME from dept_data d left outer join emp_data e on d.DEPTNO  = e.DEPTNO;

-- (서브쿼리와 조인 사용)
-- 1. 최고 연봉을 받는 직원의 이름과 그의 부서명 찾기
select ENAME, DNAME, SAL from dept_data join emp_data on dept_data.DEPTNO = emp_data.DEPTNO
where SAL = (select max(SAL) from emp_data);

-- 2. 각 부서의 평균 연봉보다 더 많은 연봉을 받는 직원들의 목록|
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO
where SAL > (select avg(SAL) from emp_data where DEPTNO = e.DEPTNO);  

-- 3. 부서별로 최고 연봉을 받는 직원의 정보 찾기
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO
where SAL in(select MAX(SAL) from emp_data where DEPTNO = e.DEPTNO);

-- 4. 부서 위치가 'CHICAGO'인 모든 직원들의 정보
select DNAME, LOC, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, emp_data.DEPTNO from dept_data join emp_data on dept_data.DEPTNO = emp_data.DEPTNO
where LOC in ('CHICAGO');


-- 5. 모든 매니저 (MGR) 아래에서 일하는 직원들의 목록
select DNAME, LOC, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, emp_data.DEPTNO from dept_data join emp_data on dept_data.DEPTNO = emp_data.DEPTNO
where JOB in('MANAGER');

-- (집합 이용)
-- 1. SALES와 RESEARCH부서 직원 목록 합치기(UNION)
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO and DNAME = 'SALES'
union
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO and DNAME = 'RESEARCH'; 

-- 2. 연봉이 2000 이상인 직원과 관리자 목록 합치기(UNION)
select * from emp_data where SAL >= 2000
union
select e2.* from emp_data e1 join emp_data e2 on e1.MGR = e2.EMPNO;

-- 3. 보스턴과 댈러스에 위치한 부서의 직원 목록 합치기(UNION)
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO where LOC = 'BOSTON'
union
select * from emp_data e join dept_data d on e.DEPTNO = d.DEPTNO where LOC = 'DALLAS';

