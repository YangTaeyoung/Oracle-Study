 --Q.1 SQL99이전
select d.deptno, d.dname, e.empno, e.ename, e.sal
  from dept d, emp e
 where d.deptno = e.deptno;

--Q.1 SQL99이후
select deptno, d.dname, e.empno, e.ename, e.sal
  from dept d join emp e using(deptno);

--Q.2 SQL99 이전
select d.deptno, d.dname, 
       trunc(avg(e.sal))as avg_sal, 
       max(e.sal) as max_sal, 
       min(e.sal) as min_sal, 
       count(*) as cnt 
  from dept d, emp e
 where d.deptno = e.deptno
 group by d.deptno, d.dname;

--Q.2 SQL99 이후
select d.deptno, d.dname, 
       trunc(avg(e.sal))as avg_sal, 
       max(e.sal) as max_sal, 
       min(e.sal) as min_sal, 
       count(*) as cnt 
  from dept d join emp e on(e.deptno = d.deptno)
 group by d.deptno, d.dname;

--Q.3 SQL99 이전
select d.deptno, d.dname, e.empno, e.empno, e.job, e.sal
  from dept d, emp e
 where d.deptno = e.deptno(+);

--Q.3 SQL99 이후
select d.deptno, d.dname, e.empno, e.empno, e.job, e.sal
  from dept d left outer join emp e on(d.deptno = e.deptno);

--Q.4 SQL99 이전
select d.deptno, d.dname,
       e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
       s.losal, s.hisal, s.grade, e1.mgr as mgr_empno, e2.ename as mgr_name 
  from dept d, emp e1, emp e2, salgrade s
 where d.deptno = e1.deptno(+)
   and e1.mgr = e2.empno(+)
   and e1.sal between s.losal(+) and s.hisal(+)
 order by d.deptno, e1.empno;
  
--Q.4 SQL99 이후
select d.deptno, d.dname,
       e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
       s.losal, s.hisal, s.grade, e1.mgr as mgr_empno, e2.ename as mgr_name 
  from dept d 
       left outer join emp e1 on(d.deptno = e1.deptno)
       left outer join emp e2 on(e1.mgr = e2.empno)
       left outer join salgrade s on(e1.sal between s.losal and s.hisal) 
 order by d.deptno, e1.empno;
