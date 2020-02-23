-- �� ����Ŭ ��ü
-- > ����Ŭ���� ������ ������ ���� ����ϴ� ���̺��� ������ ���� �������

-- �� ���̺� ����
-- 1. ����� ���̺�
-- > emp,dept�� ���� ������ ���� �����͸� ������ ���̺�, �� ����ڰ� ����� ���� ���̺�
-- > ��) ������ ���� Program Files �ȿ� �ִ� ���ø����̼�
-- 2. ������ ����
-- > ����Ŭ �����ͺ��̽� ��ü�� �����ϱ� ���� ���̺�, ���̷�Ʈ�� ��ȸ�� �Ұ����ϴ�.
-- > �ٸ�, �ʿ信 ���� ������ ���� ���� ���� ���ؼ� ���������� ��ȸ�� ������
-- > ��) ������ ���� Windows ����

-- ������ ���� ���� ���̺��� ������ ������
select * from user_tables;

-- ������ ���� + �ٸ� ���� ���������� ���� ������ ������ ����� �㰡�� ���̺��� ������
select * from all_tables;

-- scott������ ������ ���̺��� �� ������ ���� ������ ���� �߻�.
select * from dba_tables;

-- �� �ε���
-- > Ư�� ���̺��� ��ȸ�ӵ��� ����Ű�� ����, Ư���÷��� ������ ����� �δ� ��ü
-- > �߰��� ���θ� �ϸ� ����
-- > �����Ͱ� �ּ� ���鸸 �� �̻� �Ǿ�� ü����.

-- scott�� ������ �ε��� ���� ����ϱ�
select * from user_indexes;

-- �÷��� �ε��� ���� ����ϱ�
select * from user_ind_columns;

-- > �ε����� �ʿ��� �÷��� ����ڰ� ���� ������ �� �� �ִ�.
-- > �̹� �߿��� �÷����� Ȯ���Ǿ� �ִ� �÷����� ����Ŭ�� �ڵ����� �ε��� ����.
-- > primary key�� �������.

-- �� ��� �÷��� �ε����� �ִ� ���� ������?
-- > select���� ��������, �ٸ� DML, DCL, DDL ���� ������

-- sal�÷��� �ε��� �����ϱ�.
create index idx_emp_sal
    on emp(sal);

-- ������ �ε��� �����ϱ�
drop index idx_emp_sal;

-- �� SQL Tunning
-- > �ε����� �����ȹ(excution plan) ���� Ȱ���Ͽ�, ���� SELECT���� �ӵ��� ����Ű�� �۾�
-- > ���� ��� �ʿ�� ����. �����͸� ��Ȯ�� �̱⵵ ��Ʊ� ������

-- �� ��
-- > �������̺�ε� �Ҹ�. 
-- > SQL���� ����ȭ, ������ ���� ����
-- > ������ ������ �Ǳ⵵ ��.(��� �����͸� �������� �ʱ� ����)

-- �� �����ϱ�
create view vw_emp20
    as (select empno, ename, job, deptno
          from emp
         where deptno = 20);

-- �� ���� Ȯ��
select * from user_views;

-- ������ �� ��ȸ�ϱ�
select * from vw_emp20;

-- �� �����ϱ�
drop view vw_emp20;

-- �� �信 insert, update�� ������ �����Ѱ�?
-- > ��� ��������� ���� ���� �ʱ� ������, ������ �ϳ� �������� ������ �߻��� �� �����Ƿ� ���� ������� �� ��.

-- �� inline view�� ����� TOP_N SQL��
-- > rownum�� ������ ���� ������ �Ű���
select rownum,e.*
  from emp e;
  
select rownum,e.*
  from emp e
 order by sal desc;

-- > rownum�� �̿� �ֻ��� 3���� �̰� ���� ��� 
-- > ������ ���ؼ� ���� ����� �ƴ�(���� �����ϱ� ����)
select rownum, e.*
  from (select *
          from emp e
         order by sal desc)e
 where rownum <= 3;

with e as (select * 
             from emp 
            order by sal desc)
select rownum, e.*
  from e;
  
-- �� ������
-- > primary key�� �ߺ��� �̿��� �����ϱ� ���� ��ȣ�� �ִ� ������ ��.
-- > ����� ����� ����� �ʿ�� ����
-- > ��� ��������ִ� �������� ����ϴ� ����� �ݵ�� �˾ƾ� ��.

-- �������� ����� ���̺��� ����
create table dept_sequence
    as select *
         from dept
        where 1!=1;

-- ������ ����
create sequence seq_dept_sequence 
 increment by 10
 start with 10
 maxvalue 90
 minvalue 0
 nocycle
 cache 2;
 
 -- �� �������� ���� (�ݵ�� ����ϱ�)
 insert into dept_sequence (deptno, dname, loc)
 values(seq_dept_sequence.nextval /*nextval: ������ �� ������*/, 'DATABASE', 'SEOUL');
 
 select * from dept_sequence order by deptno;
 