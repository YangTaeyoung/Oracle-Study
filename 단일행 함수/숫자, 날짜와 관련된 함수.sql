-- 특정 위치에서 반올림 하는 함수: round(숫자, 반올림할 위치)
-- 0은 소숫점 첫째자리 1은 소숫점 둘쨰자리 ~~
-- -1은 일의자리, -2는 둘째자리
select round(1234.5678,0) as ROUND,
       round(1234.5678,1) as ROUND_1,
       round(1234.5678,2) as ROUND_2,
       round(1234.5678,-1) as ROUND_MINUS1,
       round(1234.5678,-2) as ROUND_MINUS2
  from dual;
-- 특정 위치에서 버리는 함수: trunc(숫자, 반올림할 위치)
-- round랑 숫자 위치 비슷함.
select trunc(12251.52678,4) as TRUNC_EX1,
       trunc(123424.51678,2) as TRUNC_EX2,
       trunc(1234.5678,-1) as TRUNC_EX3
  from dual;     

-- 나머지 함수: MOD(나눗셈 될 숫자, 나눌 숫자)
-- 데이터 베이스에서 하기보단, 자바에서 하는 경우가 많음.
-- 이런 함수가 존재한다. 정도만 기억

-- 날짜 관련 함수 : sysdate
select sysdate as NOW,
       sysdate+1 as TOMORROW,
       sysdate-1 as yesterday
  from dual;
 
-- 몇 개월 후의 날짜를 구하기: add_month(더해질 대상 날짜, 더할 개월 수)
select sysdate,
       add_months(sysdate, 3)
  from dual;
  
  -- 두 날짜간의 개월 수 차이를 구하는 함수: months_between( , )
select empno, ename, hiredate, sysdate,
       months_between(hiredate, sysdate) as MONTH1,
       months_between(sysdate, hiredate) as MONTH2,
       trunc(months_between(sysdate,hiredate)) as MONTH3
  from emp;
 
-- 특정 날짜를 기준으로 다움주 월요일 날짜를 반환하는 함수: next_day(특정 날짜,요일)
-- 특정 날짜가 속해있는 달의 마지막 날짜를 반환하는 함수: last_day(끝날을 알고 싶은 날짜)
select sysdate,
       next_day(sysdate,'월요일'),
       last_day(sysdate)
  from dual;