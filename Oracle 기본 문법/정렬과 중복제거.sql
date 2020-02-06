
/* 중복 없이 job의 내용을 출력하기*/

select distinct job from emp ;

/*
이름을 바꾸고 정렬해서 보여주기, deptno는 내림차순으로 정렬하되, 
deptno가 같을 경우, ename을 오름차순 정렬
*/
select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME,
       mgr as MANAGER, sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
       from emp order by deptno desc, ename;