-- �÷��� �� ���� ����ϴ� �Լ�(������ �Լ�): sum(���� ���ϰ��� �ϴ� �÷�)
select sum(sal)
  from emp;
 
-- ������ �Լ��� ����� ���� ������
--> row�� �ϳ��� ��ȯ�ǹǷ� ���� row�� ��ȯ�Ǵ� �÷��� select�ϸ� �ȵ�.

-- row�� ������ �����ִ� �Լ�: count(������ �� �÷�)
select count(*)
  from emp;

select count(*) as 
  from emp
 where deptno = 30;
 
-- �ִ밪�� ���ϴ� �Լ�: max()
select max(sal)
  from emp
 where deptno = 10;
-- �ּҰ��� ���ϴ� �Լ�: min()
select min(sal)
  from emp
 where deptno = 10;
 
--��¥�� ���ؼ��� max, min�Լ��� ������ �� ����(��¥�� ���ؼ��� ũ��񱳰� �����ϹǷ�)
select max(hiredate)
  from emp
 where deptno = 20;
 
select min(hiredate)
  from emp
 where deptno = 20;
 
-- ������ �÷��� ��հ��� ����ϴ� �Լ�: avg()
 select avg(sal)
   from emp
  where deptno = 30;
  
-- ��� ���� ���ϴ� ���� ���� ����ϴ� ��: group by
select avg(sal), deptno
  from emp
 group by deptno
 order by deptno;
 
-- �׷��� �߰��Ͽ� ������ ��跮�� ����� ���� ����
 select avg(sal), deptno,job
  from emp
 group by deptno,job
 order by deptno,job;
 
 /*
 [GROUP BY���� ����� ���� ������]
 -> GROUP BY���� ��õǾ� ���� ���� �÷��� SELECT�� ��� ���� ��� ������ ����Ѵ�.
 */
 
 -- groupby�� ���� ��µ� row�� �����ϱ� ����:having��
 -- groupby���� where��� ��������.
 select avg(sal), deptno, job
  from emp
 group by deptno, job
  having avg(sal) >= 2000
 order by deptno, job;
 
 /* having vs where (���� �߿���)*/
 -- where: ���̺� �ִ� ��, �� row�� �ɷ����� ���� ����Ѵ�.
 -- having: group by�� ���� ���� �׷��� �ɷ����� ���� ����Ѵ�.
 -- ������)
 -- where�� ���������� ����.
 -- where ���ǽ��� �������� ���ϴ� row�� Groupȭ ����� �ƴϴ�.
 
/*
 ����)
  select
    from
   where <- ���� ���� ����� row�� �� �ɷ���
   group by <- where���� ���� �ɷ��� �� ��Ƴ��� row��θ� �׷��� ����
  having <- group by�� ������� �׷��߿��� ����� �׷츸 �ɷ���
*/

-- �׷�ȭ �Լ��� �ſ� ��Ʊ� ������ �ǹ������� ���Ǵ� �Լ��� ���� ����.
-- �׷캰 ��谪�� ���� �����ִ� �Լ�: rollup()
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
  from emp;
 group by rollup(deptno, job);
 
-- ��� ������ ���ؼ� ��谪�� �����ִ� �Լ�: cube()
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
  from emp;
 group by cube(deptno, job)
 order by deptno, job;
 