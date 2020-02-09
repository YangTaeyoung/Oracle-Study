-- Q.1
select deptno, trunc(avg(sal)) as AVG_SAL, max(sal) as MAX_SAL, min(sal) as MIN_SAL, count(*) as CNT
  from emp
 group by deptno;
 
-- Q.2
select job, count(*)
  from emp
 group by job
having count(*) >= 3;

-- Q.3
select to_char(hiredate,'YYYY') as HIRE_YEAR, deptno, count(*) as CNT
  from emp
 group by to_char(hiredate,'YYYY'), deptno;

-- Q.4
select nvl2(comm, 'O', 'X') as EXIST_COMM, count(*) as CNT
  from emp
 group by nvl2(comm, 'O', 'X');

-- Q.5
select deptno, to_char(hiredate,'YYYY') as HIRE_YEAR, count(*)as CNT, max(sal) as MAX_SAL, sum(sal) as SUM_SAL, avg(sal) as AVG_SAL
  from emp
 group by rollup(deptno, to_char(hiredate,'YYYY')); 