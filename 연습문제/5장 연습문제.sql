-- Q.1
select *
  from emp
 where ename like('%S');
-- Q.2
select empno, ename, job, sal, deptno
  from emp
 where job = 'SALESMAN';
-- Q.3
select empno, ename, sal, deptno
  from emp
 where deptno in(20,30)
   and sal > 2000;

-- Q.4
select *
from emp
where sal < 2000
   or sal > 3000;

-- Q.5
select ename, empno, sal, deptno
  from emp
 where (sal not between 1000 and 2000)
   and ename like('%E%') 
   and deptno = 30;

-- Q.6
select *
  from emp
 where comm is null 
   and job in('MANAGER', 'CLERK')
   and ename not like('_L%');