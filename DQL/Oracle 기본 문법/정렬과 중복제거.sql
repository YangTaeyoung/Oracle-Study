
/* �ߺ� ���� job�� ������ ����ϱ�*/

select distinct job from emp ;

/*
�̸��� �ٲٰ� �����ؼ� �����ֱ�, deptno�� ������������ �����ϵ�, 
deptno�� ���� ���, ename�� �������� ����
*/
select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME,
       mgr as MANAGER, sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
       from emp order by deptno desc, ename;