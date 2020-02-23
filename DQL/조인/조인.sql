-- �� ����(�ڡڡڡڡ�)
-- > ���� ���� ���̺��� ���η� �����ؼ� �ϳ��� ���̺�ó�� ���� ���� �� ���
-- > FROM���� ���̺��� ������ ���ָ� ��,

-- ������ �ִ� ���, ������ ���̽��� ��� �ٿ��� �� ��, �Ǵ��� �� ����.
select *
  from emp, dept
  order by empno;
  
-- where���� �̿��ؼ� row�� �̾ƿ;� �Ѵ�.
select *
  from emp , dept
 where emp.deptno = dept.deptno
 order by empno;
 
 -- ���̺��� ��Ī�� ����� �� ����.
 select *
  from emp e , dept d
 where e.deptno = d.deptno
 order by empno;

-- �� � ����
-- > ���� �ϴ� ���� ���� (���̺�1.� �÷� = ���̺�2.� �÷�) ������ ���

-- and �����ڸ� �̿�, ������ �߰��� ������ �� ����.
select sal, ename, sal, e.deptno, dname, loc
  from emp e , dept d
 where e.deptno = d.deptno
   and sal>=3000
 order by empno;
 
 -- �� ���� ���̺� ������ ���ǽ� ������ ����
 --> select������ ���ο� ���� ���̺��� n�����, �� ���ο� �ʿ��� ���� ���ǽ��� n-1����.
 --> ex. A��� ���̺�� B��� ���̺��� ������ ��: A<->B ���谡 �ִ� ���ǽ� �ּ� �ϳ��� �ʿ��ϴ�.
 --> A<->B, B<->B, Ȥ�� 
 --> A<->B, A<->C, �� ���� ���ǽ��� �ּ��� �� �� �ʿ��ϴ�.  

-- �� �� ����
-- > (=)�� �ƴ� �̻�, ����, �ʰ�, �̸�����  ���� ���� ���ǽ��� ������ �ְ� ���� �� ���
-- > �ǹ����� ���� ��������� �ʴ´�.
select *
  from emp e, salgrade s
 where e.sal between s.losal and s.hisal;
 
-- �� Self Join(��ü����)
-- > ���� ���̺� 2���� ���� ��Ű�� ���
-- > ����뷮, �ӵ����� ������ �Ͼ �� ���� (�ӵ� ������ �� ŭ)
-- > ����� ���� ����Ѵ�.
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr = e2.empno;
 
-- �� �ܺ� ����(�ڡڡڡڡ�)(�� ����ϱ�)
-- > �������� �������� ���� ���´�.
-- > null���� ó���ϴ� �� ���� ����Ѵ�.
-- > ���� ����� ���̺���, ������ ������ �Ǵ� �÷��� ���� null�̾, 
--   ��� ��ȸ��󿡼� ���ܵ� �����͵� ������ ����ϱ� ���� ���Ǵ� ���ι��

-- ���� �ܺ�����
select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno, 
       e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr = e2.empno(+)
 order by e1.empno;
 
-- ������ �ܺ�����
select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno,
       e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr(+) = e2.empno
 order by e1.empno;
 
-- �� ǥ�� ���� ����
-- > ����Ŭ������ �⺻������ SQL-91 ���, SQL-99���
-- > �ǹ������� �� �� �� ����.
-- > ������ ���忡���� ���� ����� ���� ��찡 ����.
-- > �ֱ� Ʈ����� ǥ�� ���� ����� ����Ϸ��� �ϴ� ��찡 ����. 
--  (������ ���̽��� �ٲ�� ��찡 ���ϴ� ��찡 ���� �����̴�.)
-- > �˾ƺ���� ��������, where���� ���еǾ� �ֱ� ������ � �÷��� ���εǾ� �ִ��� �ľ��ϱ� �����ϴ�.
-- > �� �� ���̺��� ������ �̸��� �÷��� �� �ϳ� ������ ���� �� ��� ����
select e.empno, e.ename, e.job, e.hiredate, e.sal, e.comm, 
       deptno, d.dname, d.loc
  from emp e natural join dept d
 order by deptno, e.empno;
 
-- �� natural join�� ������� ���� ��
-- > ������ �÷��� �̸��� �ٸ� ��
-- > ������ �̸��� �÷��� ���� �� �� ��

-- �� join~using
-- > ������ �� � �÷��� �������� � ������ �� ������ �� �� �ִ�.
-- > natural�� �����.
-- > �� �� ���̺� ���� ���� �̸��� ���� �� �� �� ��� ����
-- > �� �� ���̺� ���� ���� �̸��� ������ ���ٸ� ��� �Ұ���.
select e.empno, e.ename, e.job, e.hiredate, e.sal, e.comm, 
       deptno, d.dname, d.loc
  from emp e join dept d using(deptno)
 where sal >= 3000
 order by deptno, e.empno;
 
-- ����) 
-- > ���� ����(where �̿�)�� ��� �� ����, ���� ������ �Ǵ� �÷� �տ� � ���̺� �Ҽ����� �� ����ؾ� �Ѵ�.
-- where e.deptno = deptno(X) / where e.deptno = d.deptno(O)
-- > ���� ��� �÷� �տ� �Ҽ� ���̺��� �����ִ°� �Ϲ����̴�.

-- �� ���� ����
-- > natural join, join ~ using()�� ���, ������ �÷��� �Ҽ��� ������� �ʾƾ� �Ѵ�.

-- �� join ~ on
-- > ������ where���� ��ü��. 
-- > where���� �� �� ������.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.hiredate, e.sal, e.comm, 
       e.deptno, d.dname, d.loc
  from emp e join dept d on(e.deptno = d.deptno)
 where sal <= 3000
 order by deptno, e.empno;

-- �� outer join(�ܺ� ������ ǥ�ع���)
-- > ��ü �ܺ������� �� �� ����.

-- ���� �ܺ�����
select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 left outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- ������ �ܺ�����
select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 right outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- ��ü �ܺ�����
 select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 full outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- �� 3�� �̻��� ���̺��� ������ ��
-- > join�� �ڿ� �� �ٿ��ָ� �ȴ�. 
