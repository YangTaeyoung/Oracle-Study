-- Q.1
select empno, 
       rpad(substr(empno,1,2),4,'*')as MASKING_EMPNO, 
       ENAME, 
       rpad(substr(ename,1,1),length(ename),'*') as MASKING_ENAME 
  from emp
  where length(ename)=5;
  
-- Q.2
select empno, ename,
       trunc(sal/21.5,2) as DAY_PAY, 
       round(sal/21.5/8, 1) as TIME_PAY
  from emp;
 
-- Q.3
select empno, ename, hiredate,
       next_day(add_months(hiredate,3),'¿ù¿äÀÏ')as R_JOB,
       nvl2(comm,to_char(comm),'N/A')
  from emp; 

-- Q.4
select empno, ename, mgr,
       case
        when substr(mgr,1,2) is null then '0000'
        when substr(mgr,1,2) = '75' then '5555'
        when substr(mgr,1,2) = '76' then '6666'
        when substr(mgr,1,2) = '77' then '7777'
        when substr(mgr,1,2) = '78' then '8888'
        else to_char(mgr)
       end as CHG_MGR
  from emp;
  

 
 