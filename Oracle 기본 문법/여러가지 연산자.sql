/*����Ŭ���� ����ϴ� �⺻���� ������ ��7*/

-- �񱳿����� 
select * 
  from emp
 where sal >=3000;
 
 -- � �� ������
 select *
   from emp
  where sal <> 3000;

-- in �����ڰ� ���� ��\
select *
  from emp
 where job = 'MANAGER'
    or job = 'SALESMAN'
    or job = 'CLEAK';

-- in �����ڸ� ����� �� (�ݵ�� �˾� �� ��)
select *
  from emp
 where job in('MANAGER', 'SALESMAN','CLErK');  
  
-- �ݴ��� �ǹ̸� ���� ������ not in
select *
  from emp
 where job not in('MANAGER', 'SALESMAN', 'CLERK');

-- not in�� ���� ���� ��
select *
  from emp
 where job != 'MANAGER'
   and job != 'SALESMAN'
   and job != 'CLERK';
  
-- between A and B �����ڸ� ���� ���� ��
select *
  from emp
 where sal >= 2000
   and sal <= 3000;

-- between A and B �����ڸ� ���
select *
  from emp
 where sal between 2000 and 3000; 

-- not between�� ����� �� ����   
select *
  from emp
 where sal not between 2000 and 3000;

-- not between�� ������� ���� ���
select *
  from emp
 where sal < 2000
    or sal > 3000;
   
-- like �����ڿ� ���ϵ� ī��(�˻�� ���, �߿���)
/* like�� ������ ���� �����͸� �߷��� �� ���� 
   (%)�� � ���ڵ� � ���̵� ������� �� �� ���� */
select *
  from emp
 where ename like 'S%';

-- S�� �̸��� ���ԵǾ� �ֱ⸸ �ϸ� ���
select *
  from emp
 where ename like '%S%';

-- �ι�° ���ڰ� L�� ���� like �����ڸ� �̿��Ͽ� ����ϱ�
-- _(��� ��)�� � ���ڵ� ��� ���� �ϳ��� ���ڸ� �ǹ���.
-- like�� �� �˻��ϴ� �ӵ��� ����. ����(=)�� like���� ���� ����.
 select *
   from emp
  where ename like '_L%';
 
-- like �տ��� not�� ���� �� ����.
select *
  from emp
 where ename  not like '%AM%';
 
-- �⺻������ �׸� null���� ���� ��µ��� ����
select *
  from emp;
 where comm = null; 
 
-- is null�� ���, ���� null�� ���� ����� �� ����
select *
  from emp;
 where comm is null;

-- is not null�� ���, ���� null�� ���� ����� �� ����
select *
  from emp;
 where comm is not null;