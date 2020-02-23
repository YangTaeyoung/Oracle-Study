-- �� ������ ���Ǿ�(DQL)
-- > ��ü�� ��ȸ(SELECT) ���� ����� ����

-- �� ������ ���۾�(DML)
-- > ����� ����, ����, ������ ���� ����� ����
-- > insert, update, delete

-- �� ������ ���Ǿ�(DDL)
-- > ��ü�� ����(CREATE)������(ALTER)������(DROP) ���� ����� ������.
-- > DDL ����� Auto-commit�� (rollback�� �ص� ����� �� ����) ���� ������ ����Ͽ��� �Ѵ�.

-- �� CREATE
-- > ���̺��� �����ϴ� ��ɾ�
create table emp_ddl
(
    empno       number(4),
    ename       varchar2(10),
    job         varchar2(9),
    mgr         number(4),
    hiredate    date,
    sal         number(7,2), -- �޸��� ���� ��� �Ҽ��� �ڸ� ���ڸ� ������.
    comm        number(7,2),
    deptno      number(2)
);

-- �� ALTER
-- > ����Ŭ �� �̹� �����ϴ� ��ü�� Ư���� �����ϱ� ���� ��ɾ�
-- > ���̺��� ALTER ��ɾ�� ������ �����ϴ� ����� �ܿ� �ʿ� ����.
-- > å�� �ְų�, ���ͳ� �˻��� ���ؼ� �ʿ��� �� ������ �� �ִ� ������ �Ǿ �ȴ�.
-- > ��� �󵵰� �׸� ���� �ʴ�.

create table emp_alter as select * from emp;

select * from emp_alter;

-- �� �÷��� ���� �߰��ϴ� ��ɾ� add
alter table emp_alter
  add hp varchar2(20);
  
  select * from emp_alter;

-- �� ���̺��� �̸��� �ٲٴ� ��ɾ� rename ~ to
alter table emp_alter
    rename column hp to tel;
    
    select * from emp_alter;

-- �� �÷��� �ڷ����� �ٲٴ� ��ɾ� MODIFY
-- > �ٲٷ��� ������ Ÿ���� ������ ������ Ÿ�԰� ȣȯ���� ������� ���� �Ұ�
-- > �ٲٷ��� �ڸ� ���� ������ �ڸ� ������ ���� ��� ���� �Ұ�
alter table emp_alter
modify empno number(5);

desc emp_alter;

-- �� ���̺��� �÷��� �����ϴ� ��ɾ� DROP
alter table emp_alter
 drop column tel;

select * from emp_alter;
 
-- �� DROP
-- > ����Ŭ �� �����ϴ� ��ü�� �����ϱ� ���� ��ɾ�
-- > ������ ������ ���̺��� ������ �� ������, flashback�� �̿��ؼ� ������ �� ����

 

-- �� TRUNCATE
-- > ���̺� ���� �����͸� �����ϴ� ��ɾ�
-- > DDL�̹Ƿ� ����ϰ� �ǵ��� �� ����.
-- > DELETE ���� �ӵ��� ������. (������ ������ ���� �ʿ䰡 �����Ƿ�)
