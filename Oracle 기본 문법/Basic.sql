/* Formatted on 2020/02/02 ���� 12:42:18 (QP5 v5.354) */
/*��� emp���̺��� ���� �� ����*/
SELECT * FROM emp;
/*���ڵ��� ������ Ȯ�� �ϴ� Ű����: desc*/
desc emp;

DESC dept;

/*��� emp���� �����ϳ�, deptno�� 20�� �ุ ������ ��: where ���*/
SELECT *
  FROM emp
 WHERE deptno = 20;

/*�ߺ� ���� ������ ��: discinct*/
SELECT DISTINCT deptno
  FROM emp;

/*�� ���̺� ���Ƿ� �̸��� ���̰� ���� ��: as*/
  SELECT ename               AS �̸�,
         sal                 AS ����,
         sal * 12 + comm     AS ����,
         comm                AS �μ�Ƽ��
    FROM emp
ORDER BY sal DESC, ename ASC;


SELECT *
  FROM emp
 WHERE deptno = 30 OR job = 'CLERK';