-- 집합 연산자. 자주 사용하진 않지만 간간히 사용됨.
-- 두 개 이상의 select문을 세로로 합해서 출력함.
-- 제약 사항: 
-- 1. 위 아래 select문의 column의 개수가 동일해야 한다.
-- 2. 위 아래 select문의 데이터 타입이 동일해야 한다.
-- 3. 최종적으로 표시되는 column의 이름은 위의 select문의 이름을 따라간다.
-- union은 중복 제거, union all은 중복제거 없이 출력(union all 을 더 많이 사용하는 추세)
-- minus는 차집합, intersect는 교집합
select empno, ename, sal, deptno
  from emp
 where deptno = 10
union
select empno, ename, sal, deptno
  from emp
 where deptno = 20;
 