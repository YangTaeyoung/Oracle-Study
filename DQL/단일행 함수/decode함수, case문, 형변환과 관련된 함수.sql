--�ڹٶ� �ٸ��� ������ ��
select empno, ename, empno + '500' -- string�̳� ���ڿ��� ���ڸ� ���ڵ����� Ÿ�� �÷����� ���� ����
  from emp;
 where ename = 'SCOTT';
 
 -- ��¥ �����͸� ���ڷ� �ٲٴ� �Լ�: TO_CHAR, ���� �����͸� ��¥�� �ٲٴ� �Լ��� ���� ���� �����.
select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
  from dual;
  
-- ���� �����͸� ��¥ �����ͷ� �ٲٴ� �Լ�: TO_DATE
select to_date('2018-12-25', 'YYYY-MM-DD') as TODATE1,
       to_date('20181225', 'YYYY-MM-DD') as TODATE2
  from dual;
  
-- null ���� �ٸ� ���� ��ü���ִ� �Լ�: NVL(null���� ����ִ� ������ ��, ��ü�� ��)(������ ����ؾ���)
select empno, ename, sal, comm, sal+comm,
       nvl(comm,0),
       sal+nvl(comm,0)
  from emp;

-- null���� �ƴ� �� ��ü�� ���ڵ� ������ �ִ� �Լ�: NVL2(null���� ����ִ� ������ ��, null���� �ƴҋ� ��ü, null���� �� ��ü)
select empno, ename, comm,
       nvl2(comm,'O','X'/* �� ���� �� ��ü�� �Ķ������ ������ Ÿ���� ���� ������ ��.*/),
       nvl2(comm,sal*12+comm,sal*12) as ANNSAL
  from emp;

-- if else ���ǹ�, Ȥ�� switch~case���� �����.
-- decode�� �ݵ�� ������ �Ǵ� �����͸� �����ؼ� ����ؾ� �Ѵ�.
select empno, ename, job, sal,
       decode(job,
             'MANAGER', SAL*1.1,
             'SALESMAN', SAL*1.05,
             'ANALYST', SAL,
             SAL*1.03) AS UPSAL
  from emp;
  
-- decode�Լ��� ���� ������ �ϳ� �� �������� ����, �� ���� ������ �� �� ����
-- case�� ���� ������ �÷��� ��� ����� �����ϴ�.
-- �ڹ��� if ~ else ���� ����ϴ�.
select empno, ename, job, sal,
  case job
       when 'MANAGER' then sal*1.1
       when 'SALESMAN' then sal*1.05
       when 'ANALYST' then sal
       else sal*1.03
   end as UPSAL
  from emp;
 
-- case������ ���� �����Ͱ� ���� ����� ��� ����
select empno, ename, comm,
  case
   when comm is null then '�ش���� ����'
   when comm = 0 then '���� ����'
   when comm > 0 then '����: '|| comm
   end as COMM_TEXT
  from emp;
   