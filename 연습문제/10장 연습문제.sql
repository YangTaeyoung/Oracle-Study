create table chap10hw_emp as select * from  emp;

create table chap10hw_dept as select * from  dept;

create table chap10hw_salgrade as select * from  salgrade;

-- Q.1
insert into chap10hw_dept (deptno, dname, loc)
                   values (50, 'ORACLE', 'BUSAN');
                   
insert into chap10hw_dept (deptno, dname, loc)
                   values (60, 'SQL', 'ILSAN');
                   
insert into chap10hw_dept (deptno, dname, loc)
                   values (70, 'SELECT', 'INCHEON');
                   
insert into chap10hw_dept (deptno, dname, loc)
                   values (80, 'DML', 'BUNDANG'); 

select * from chap10hw_dept;

-- Q.2
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7201, 'TEST_USER1', 'MANAGER', 7788, '2016/01/02', 4500, NULL, 50);
              
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7202, 'TEST_USER2', 'CLEAK', 7201, '2016/02/21', 1800, NULL, 50);
              
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7203, 'TEST_USER3', 'ANALYST', 7201, '2016/04/11', 3400, NULL, 60);        
                   
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016/05/31', 2700, 300, 60);         
                   
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7205, 'TEST_USER5', 'CLEAK', 7201, '2016/07/20', 2600, NULL, 70);
              
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7206, 'TEST_USER6', 'CLEAK', 7201, '2016/09/08', 2600, NULL, 70);            
                
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7207, 'TEST_USER7', 'LECTURER', 7201, '2016/10/28', 2300, NULL, 80);
              
insert into chap10hw_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values(7208, 'TEST_USER8', 'STUDENT', 7201, '2016/03/09', 1200, NULL, 80);                            
              
select * from chap10hw_emp; 

-- Q.3
update chap10hw_emp
   set deptno = 70
 where sal > (select avg(sal)
                from chap10hw_emp
               where deptno = 50);
 
select * from chap10hw_emp; 

-- Q.4
update chap10hw_emp
   set sal = sal*1.1,
       deptno = 80
 where hiredate > (select min(hiredate)
                     from chap10hw_emp
                    where deptno = 60);

select * from chap10hw_emp;

-- Q.5
delete from chap10hw_emp
 where empno in (select e.empno
                   from chap10hw_emp e, chap10hw_salgrade s
                  where e.sal between losal and hisal
                    and s.grade = 5);

select * from chap10hw_emp;