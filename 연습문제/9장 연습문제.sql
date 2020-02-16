--Q.1
select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
  from emp e, dept d
 where e.job = (select job
                  from emp
                 where ename = 'ALLEN')
   and e.deptno = d.deptno
   and e.deptno = 30
   and e.sal between 1000 and 2000;
   
   
--Q.2
select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
  from emp e, dept d, salgrade s
 where e.sal >= (select avg(sal)
                   from emp)
   and e.deptno = d.deptno
   and e.sal between s.losal and s.hisal
 order by e.sal desc, ename;
 
-- Q.3
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
  from emp e, dept d
 where e.deptno = d.deptno
   and e.job not in(select job
                      from emp
                     where deptno = 30)
   and e.deptno = 10;

-- Q.4
select e.empno, e.ename, e.sal, s.grade
  from emp e, salgrade s
 where e.sal between s.losal and s.hisal
   and e.sal > (select max(sal)
                  from emp
                 where job = 'SALESMAN');
  