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

 