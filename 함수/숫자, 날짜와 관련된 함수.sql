-- Ư�� ��ġ���� �ݿø� �ϴ� �Լ�: round(����, �ݿø��� ��ġ)
-- 0�� �Ҽ��� ù°�ڸ� 1�� �Ҽ��� �Ѥ��ڸ� ~~
-- -1�� �����ڸ�, -2�� ��°�ڸ�
select round(1234.5678,0) as ROUND,
       round(1234.5678,1) as ROUND_1,
       round(1234.5678,2) as ROUND_2,
       round(1234.5678,-1) as ROUND_MINUS1,
       round(1234.5678,-2) as ROUND_MINUS2
  from dual;
-- Ư�� ��ġ���� ������ �Լ�: trunc(����, �ݿø��� ��ġ)
-- round�� ���� ��ġ �����.
select trunc(12251.52678,4) as TRUNC_EX1,
       trunc(123424.51678,2) as TRUNC_EX2,
       trunc(1234.5678,-1) as TRUNC_EX3
  from dual;     

-- ������ �Լ�: MOD(������ �� ����, ���� ����)
-- ������ ���̽����� �ϱ⺸��, �ڹٿ��� �ϴ� ��찡 ����.
-- �̷� �Լ��� �����Ѵ�. ������ ���

select sysdate as NOW,
       sysdate+1 as TOMORROW,
       sysdate-1 as yesterday
  from dual;