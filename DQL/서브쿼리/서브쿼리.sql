-- �� ��������
-- > ���� ���� ����

-- �������� ����ó�� ������ �� �� �̻� �Ἥ ��ȸ �Ͽ��� ����
select sal
  from emp
 where ename = 'JONES'; 
 -- JONES�� SAL�� 2975�̹Ƿ�
 select *
   from emp
  where sal > 2975;

-- �������� ����
-- ����) �� ����� �ڷ���, �÷� ������ ���ƾ� �Ѵ�.
 select *
   from emp
  where sal > (select sal
                 from emp
                where ename = 'JONES');


-- ��¥���� ���������� �̿��� �� ����.

select *
  from emp
 where hiredate < (select hiredate
                     from emp
                    where ename = 'SCOTT');
                    
-- �� ������ ��������
-- > ��ȸ�� ����� �� �ϳ��� ������ ������ ��������
-- > �Լ��� ������ ���� ����.
select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
  from emp e, dept d
 where e.deptno = d.deptno
   and e.deptno = 20
   and e.sal > (select avg(sal)
                  from emp);

-- �� ������ ��������
-- > ���� ����� �ϳ� �̻��� ���, in all, any�����ڸ� ���
select *
  from emp
 where sal in (select max(sal)
                 from emp
                group by deptno);
    
    
-- �� any, some������
-- > ���� ������ ��� �� �߿�, �ϳ��� ���� �����ڿ� �����ϴ� ���� �ִٸ� true�� ������ִ� �������̴�
-- > =any, =some�� in���� ��ü ������
-- > �̻�, ����, �̸�, �ʰ����� �����ڸ� ����� �� ������, ������,
select *
  from emp
 where sal = any(select max(sal)
                   from emp
                  group by deptno);
 
-- �Ʒ��� ��� 2850���ٸ� ������ ��, �ϳ��� ������ �����ϸ� �ǹǷ�
select *
  from emp
 where sal < any(select sal
                   from emp
                  where deptno = 30)
 order by sal, empno;
 
-- max�� ��ä �����ϴ�.
 select *
  from emp
 where sal < (select max(sal)
                   from emp
                  where deptno = 30)
 order by sal, empno;

-- �� ������ �Ʒ� min�Լ��� �� �Ͱ� �����ϴ�. 
 select *
  from emp
 where sal > any(select sal
                   from emp
                  where deptno = 30);
 
-- min�Լ� ���
select *
  from emp
 where sal > (select min(sal)
                   from emp
                  where deptno = 30);

-- �� all ������
-- > �캯 �� ��� ������ �����ؾ� true�� �����.              

-- �� ��� �ּҰ� sal ���� ������ �ǹǷ� min �Լ��� ��ü�� ������
select *
  from emp
 where sal < all (select sal
                    from emp
                   where deptno = 30); 
                   
 -- min �Լ� ����
 select *
  from emp
 where sal < (select min(sal)
                from emp
               where deptno = 30); 
                 
               
-- �� ��� sal�� �ִ밪 ���� ũ�� ����
select *
  from emp
 where sal > all (select sal
                    from emp
                   where deptno = 30); 
-- max�� ��ü �����ϴ�.
select *
  from emp
 where sal > (select max(sal)
                    from emp
                   where deptno = 30); 

-- exist ������
-- > ���������� ����� �����ϸ�, ��� true(�ϳ��̴� �������� ��� ����)
-- > ���������� ����� �������� ������ ��� false
select *
  from emp
 where exists(select dname
                from dept
               where deptno = 10);
            
-- deptno = 50�� �������� �����Ƿ� ����� ��µ��� ����.
select *
  from emp
 where exists(select dname
                from dept
               where deptno = 50);
               
-- �� ���� ���� �������� ���߿� ��������(�ڡڡڡ�)
-- > �ǹ����� �� Ȱ������ ������, �����ڵ��� �� ��.
select *
  from emp
 where (deptno, sal) in (select deptno, max(sal)
                           from emp
                          group by deptno);

-- �� from���� ����ϴ� ��������
-- > �Ϲ������� from���� ���̺��� �ۼ��Ѵ�.
-- > ������, from������ ���̺�� ���� row, column���� ������ � ��ü�� ��ð� �����ϴ�.
-- > from���� ���������� ����ϸ�, ���������� ����� �ϳ��� ���̺� ó�� ����� �� �ִ�.
-- > from���� ����� ����������, �ݵ�� ��Ī�� �����ؾ� �Ѵ�. (��Ī�� ������ ���̺� ó�� �̿��� ������)
-- > from ���� ������ select���� ����Ͽ�, ������ ���̺�ó�� ��� �� �� �ִ� ������ ������ inline-view ��� �Ѵ�.
-- > �̹� ������� sql���� �̿��Ͽ� ����� ��찡 ����.(������ ����� ���� ���̺��� ��ġ�ִ� ���̺��� ���)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
  from (select * from  emp where deptno = 10) e10, 
       (select * from dept) d
 where e10.deptno = d.deptno;

with
e10 as (select * from emp where deptno = 10),
d   as (select * from dept)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
  from e10, d
 where e10.deptno = d.deptno;
 
   
