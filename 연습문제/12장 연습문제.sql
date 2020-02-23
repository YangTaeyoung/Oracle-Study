-- Q.1
create table emp_hw(
                    empno number(4),
                    ename varchar(10),
                    job varchar(9),
                    mgr number(4),
                    hiredate date,
                    sal number(7,2),
                    comm number(7,2),
                    deptno number(2));

-- Q.2
alter table emp_hw
  add bigo varchar(20);
  
select * from emp_hw;

-- Q.3
alter table emp_hw
modify bigo varchar(30);

desc emp_hw;

-- Q.4
alter table emp_hw
rename column bigo to remark;

select * from emp_hw;

-- Q.5
insert into emp_hw(empno, ename, job, mgr, hiredate, sal, comm, deptno, remark)
     select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, null
       from emp e;
       
select * from emp_hw;

-- Q.6
drop table emp_hw;

select * from emp_hw; -- 지워졌으므로 에러 발생