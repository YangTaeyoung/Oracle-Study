-- upper은 모두 대문자로, lower은 다 소문자로, initcap는 첫 글자만 대문자로
-- 검색어를 쓸 때 like와 함께 많이 사용함.
-- 참고) 오라클에서 제공하는 지금 배우는 함수는 오라클애서만 사용이 가능하다.
-- 다른 DB: MySQL, MariaDB, PostgreSQL
select ename, upper(ename), lower(ename), initcap(ename)
  from emp;

-- 길이를 출력하는 함수: length()
select ename, length(ename)
  from emp;
  
select ename, length(ename)
  from emp;
 where length(ename) >= 5;

-- 문자열을 추출하는 함수: substr(~번째 글자부터, ~글자 추출: 안 쓸 경우 끝까지)
select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5)
  from emp; 

-- 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알고자 할 때: instr (많이 사용하지 않음)
select instr('HELLO, ORACLE', 'L') AS INSTR_1
  from dual;
 
-- 문자열을 대체하는 함수: replace(대체할 문자열, 대체되는 기존 문자, 대체할 바뀔 문자)
select '010-1234-5678' as REPLACE_BEFORE,
       replace('010-1234-5678','-', ' ') AS REPLACE_1,
       replace('010-1234-5678','-') AS REPLACE_1
  from dual;

-- 문자열의 특정 부분을 다른 문자열로 채워주고 싶을 때
select 'Oracle',
       lpad('Oracle', 10, '#') as LPAD_1,
       rpad('Oracle', 10, '*') as RPAD_1,
       lpad('Oracle', 10) as LPAD_2,
       rpad('Oracle', 10) as RPAD_2
  from dual;
  
-- 주민등록번호 등 개인정보에 대해 잘 사용함.
select '200208-1122334',
       rpad(substr('200208-1122334',1,7), 14, '*') as LPAD_1,
       substr('200208-1122334',1,7) || '*******' 
       -- 두 개 이상의 문자열을 붙일 때 (||)연산자를 사용하기도 함 
  from dual;

-- 두 문자열 데이터를 합치는 함수: CONCAT (보다는 ||를 많이 사용)
-- concat(합칠 문자열1, 합칠 문자열2)

-- 특정 문자를 지우는 함수: trim(삭제할 문자열, 삭제할 문자: 안 쓰면 공백제거)
-- 아이디에 스페이스가 들어가는 경우에 종종 사용함.
select '[' || trim(' _ _Oracle_ _ ') || ']' as TRIM
  from dual;

