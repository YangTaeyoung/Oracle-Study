-- ���� ������. ���� ������� ������ ������ ����.
-- �� �� �̻��� select���� ���η� ���ؼ� �����.
-- ���� ����: 
-- 1. �� �Ʒ� select���� column�� ������ �����ؾ� �Ѵ�.
-- 2. �� �Ʒ� select���� ������ Ÿ���� �����ؾ� �Ѵ�.
-- 3. ���������� ǥ�õǴ� column�� �̸��� ���� select���� �̸��� ���󰣴�.
-- union�� �ߺ� ����, union all�� �ߺ����� ���� ���(union all �� �� ���� ����ϴ� �߼�)
-- minus�� ������, intersect�� ������
select empno, ename, sal, deptno
  from emp
 where deptno = 10
union
select empno, ename, sal, deptno
  from emp
 where deptno = 20;
 