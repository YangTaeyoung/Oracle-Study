--자바랑 다르게 유연한 편
select empno, ename, empno + '500' -- string이나 문자열이 숫자면 숫자데이터 타입 컬럼과의 연산 가능
  from emp;
 where ename = 'SCOTT';
 
 -- 날짜 데이터를 문자로 바꾸는 함수: TO_CHAR, 문자 데이터를 날짜로 바꾸는 함수는 정말 많이 사용함.
select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
  from dual;
  
-- 문자 데이터를 날짜 데이터로 바꾸는 함수: TO_DATE
select to_date('2018-12-25', 'YYYY-MM-DD') as TODATE1,
       to_date('20181225', 'YYYY-MM-DD') as TODATE2
  from dual;
  
-- null 값을 다른 값을 대체해주는 함수: NVL(null값이 들어있는 데이터 열, 대체할 값)(무조건 기억해야함)
select empno, ename, sal, comm, sal+comm,
       nvl(comm,0),
       sal+nvl(comm,0)
  from emp;

-- null값이 아닐 때 대체할 문자도 지정해 주는 함수: NVL2(null값이 들어있는 데이터 열, null값이 아닐떄 대체, null값일 때 대체)
select empno, ename, comm,
       nvl2(comm,'O','X'/* 참 거짓 때 대체할 파라미터의 데이터 타입은 같게 지정할 것.*/),
       nvl2(comm,sal*12+comm,sal*12) as ANNSAL
  from emp;

-- if else 조건문, 혹은 switch~case문과 비슷함.
-- decode는 반드시 기준이 되는 데이터를 지정해서 사용해야 한다.
select empno, ename, job, sal,
       decode(job,
             'MANAGER', SAL*1.1,
             'SALESMAN', SAL*1.05,
             'ANALYST', SAL,
             SAL*1.03) AS UPSAL
  from emp;
  
-- decode함수와 같은 역할을 하나 더 가독성이 좋고, 더 많은 역할을 할 수 있음
-- case는 기준 데이터 컬럼이 없어도 사용이 가능하다.
-- 자바의 if ~ else 문과 비슷하다.
select empno, ename, job, sal,
  case job
       when 'MANAGER' then sal*1.1
       when 'SALESMAN' then sal*1.05
       when 'ANALYST' then sal
       else sal*1.03
   end as UPSAL
  from emp;
 
-- case문에서 기준 데이터가 없는 경우의 사용 예시
select empno, ename, comm,
  case
   when comm is null then '해당사항 없음'
   when comm = 0 then '수당 없음'
   when comm > 0 then '수당: '|| comm
   end as COMM_TEXT
  from emp;
   