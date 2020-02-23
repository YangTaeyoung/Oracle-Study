-- upper�� ��� �빮�ڷ�, lower�� �� �ҹ��ڷ�, initcap�� ù ���ڸ� �빮�ڷ�
-- �˻�� �� �� like�� �Բ� ���� �����.
-- ����) ����Ŭ���� �����ϴ� ���� ���� �Լ��� ����Ŭ�ּ��� ����� �����ϴ�.
-- �ٸ� DB: MySQL, MariaDB, PostgreSQL
select ename, upper(ename), lower(ename), initcap(ename)
  from emp;

-- ���̸� ����ϴ� �Լ�: length()
select ename, length(ename)
  from emp;
  
select ename, length(ename)
  from emp;
 where length(ename) >= 5;

-- ���ڿ��� �����ϴ� �Լ�: substr(~��° ���ں���, ~���� ����: �� �� ��� ������)
select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5)
  from emp; 

-- ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ����� �˰��� �� ��: instr (���� ������� ����)
select instr('HELLO, ORACLE', 'L') AS INSTR_1
  from dual;
 
-- ���ڿ��� ��ü�ϴ� �Լ�: replace(��ü�� ���ڿ�, ��ü�Ǵ� ���� ����, ��ü�� �ٲ� ����)
select '010-1234-5678' as REPLACE_BEFORE,
       replace('010-1234-5678','-', ' ') AS REPLACE_1,
       replace('010-1234-5678','-') AS REPLACE_1
  from dual;

-- ���ڿ��� Ư�� �κ��� �ٸ� ���ڿ��� ä���ְ� ���� ��
select 'Oracle',
       lpad('Oracle', 10, '#') as LPAD_1,
       rpad('Oracle', 10, '*') as RPAD_1,
       lpad('Oracle', 10) as LPAD_2,
       rpad('Oracle', 10) as RPAD_2
  from dual;
  
-- �ֹε�Ϲ�ȣ �� ���������� ���� �� �����.
select '200208-1122334',
       rpad(substr('200208-1122334',1,7), 14, '*') as LPAD_1,
       substr('200208-1122334',1,7) || '*******' 
       -- �� �� �̻��� ���ڿ��� ���� �� (||)�����ڸ� ����ϱ⵵ �� 
  from dual;

-- �� ���ڿ� �����͸� ��ġ�� �Լ�: CONCAT (���ٴ� ||�� ���� ���)
-- concat(��ĥ ���ڿ�1, ��ĥ ���ڿ�2)

-- Ư�� ���ڸ� ����� �Լ�: trim(������ ���ڿ�, ������ ����: �� ���� ��������)
-- ���̵� �����̽��� ���� ��쿡 ���� �����.
select '[' || trim(' _ _Oracle_ _ ') || ']' as TRIM
  from dual;

