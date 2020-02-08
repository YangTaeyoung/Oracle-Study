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

 