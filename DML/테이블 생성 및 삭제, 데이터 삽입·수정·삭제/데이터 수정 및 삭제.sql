-- �� ������ ���� (UPDATE��)
create table dept_temp2
    as select * from dept;
     
select * from dept_temp2;       

-- row�� ���� ������� ���� ��� ��� �÷��� ���� �� �ٲ�
update dept_temp2
   set loc = 'SEOUL';
   
select * from dept_temp2;       

-- �� rollback
-- >������ �����ߴ� ��ɾ �����
rollback;

-- �� row�� �����ؼ� �ش� ������ �����ϱ�
-- > where���� �̿���.
-- > ���� �����͸� ������ ��� �޸�(,)�� �̿��Ͽ� ����
update dept_temp2
   set dname = 'DATABASE',
         loc = 'SEOUL'
 where deptno = 40;
 
select * from dept_temp2;
 
-- �� ���������� �̿��Ͽ� ������ �����ϱ�
-- > ���� 10-19 ����, �� ������� ������, ����صα�

-- �� UPDATE���� WHERE���� ���������� �̿��Ͽ� �����͸� �����ϴ� ���
-- > ���������λӸ� �ƴ϶�, �ǹ����� ������ �߿��ϴ�.
-- > UPDATE�� ����ϱ� ���� WHERE���� ������ �����͸� SELECT�� �̿��Ͽ�, Ȯ���غ��ƾ� ��.

-- +��) ���� �����ؾ� �Ǵ� �����Ͱ� �ʹ� ���� ������ üũ�� ���� ���� ���.
-- > count�� �̿��Ͽ� ������ �������� ������ ��ȸ�غ���.

-- �� ���̺� �ִ� ������ �����ϱ�
create table emp_temp2
    as select * from emp;

 select * from emp_temp2;
 
-- WHERE���� �Է����� ���� ���, ��� �����Ͱ� ������.
delete from emp_temp2
 where job = 'MANAGER';
  
select * from emp_temp2;
 

