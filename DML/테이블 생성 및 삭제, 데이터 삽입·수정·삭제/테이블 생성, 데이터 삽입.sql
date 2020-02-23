-- �� ������ ���۾�(DML)
-- > �����͸� �߰��ϰų�, �����ϰų�, �����ϴ� ���۾�

create table dept_temp -- dept_temp ��� ���̺��� ���� �����ϰ���.
    as select * from dept;
    
drop table dept_temp; -- ���̺��� �߸� �����Ͽ��� �� ����� ���۾�
 
select * from dept_temp;

-- �� insert��
-- > �����͸� �߰��ϴ� ��ɾ�, �÷��κ��� ��������
insert into dept_temp(deptno, dname, loc) -- �÷� �κ��� ������ �ٲ� ���, ���� ������ �ٲ��� ��.
              values (50, 'DATABASE', 'SEOUL');

-- �÷��κ��� ������ ���� ����.
insert into dept_temp -- �÷� �κ��� ������ �ٲ� ���, ���� ������ �ٲ��� ��.
               values (60, 'NETWORK', 'BUSAN');
     
-- �� ���� NULL�� �ֱ�

-- 1. ''�� �Է��ϱ�(�ǹ����� �� ������ ���� -> ��� Ư������ �ٸ��� ����)
insert into dept_temp(deptno, dname, loc) 
              values (80, 'MOBILE', '');
     
-- 2. ����� ��� (���� ���� NULL�� �Է�)(����� NULL ���Թ�)(���� ǥ��)
insert into dept_temp(deptno, dname, loc) 
              values (70, 'WEB', NULL);
              
-- 3. �÷��� ������� �ʱ�.(�Ͻ��� NULL ���Թ�)(�ǹ����� �� ������� ����: ���α׷��ӵ鳢���� ȿ���� ���̱� ����.)
insert into dept_temp(deptno, loc) 
              values (90, 'INCHEON');

select * from dept_temp;

-- �� ���̺��� �÷� �������� �����ؼ� ���ο� ���̺��� ����� ���� ��
create table emp_temp
          as select * 
               from emp
              where 1<>1;

select * from emp_temp;

-- �� ��¥���� ������ ������ ��
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (9999, 'ȫ�浿', 'PRESIDENT', null, '2001/01/01', 5000, 1000, 10);

select * from emp_temp;

-- ������ ���� �� ('-')�� ����ؼ� ��¥ ������ �����ϱ�.
-- > ������� ����. ���� ���ɼ�. (�̷��� ������ ���, ����ȯ �Լ� to_date() ���
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
              
select * from emp_temp;

-- ��¥�� ������ �޶��� ���, �����Ͱ� ����� ���� ����
/* 
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (2111, '�̼���', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20); -- ����
*/

-- ������ �޶��� ��� ����ȯ �Լ� to_date()�� ����ϱ�.
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (2111, '�̼���', 'MANAGER', 9999, to_date('07/01/2001', 'dd/mm/yyyy'), 4000, NULL, 20);
              
select * from emp_temp;


-- ���� ��¥, ���� �ð����� ��¥ ������ ����ֱ�.(sysdate �̿�)
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (3111, '��û��', 'MANAGER', 9999, sysdate, 4000, NULL, 30);

select * from emp_temp;

-- ���� ������ �̿��Ͽ� �ѹ��� ���� ������ �߰��ϱ� (���� 10-14)
-- > �� ������� ������ ����صα�.