/*오라클에서 사용하는 기본적인 연산자 ㅕ7*/

-- 비교연산자 
select * 
  from emp
 where sal >=3000;
 
 -- 등가 비교 연산자
 select *
   from emp
  where sal <> 3000;

-- in 연산자가 없을 때\
select *
  from emp
 where job = 'MANAGER'
    or job = 'SALESMAN'
    or job = 'CLEAK';

-- in 연산자를 사용할 때 (반드시 알아 둘 것)
select *
  from emp
 where job in('MANAGER', 'SALESMAN','CLErK');  
  
-- 반대의 의미를 가진 연산자 not in
select *
  from emp
 where job not in('MANAGER', 'SALESMAN', 'CLERK');

-- not in을 쓰지 않을 때
select *
  from emp
 where job != 'MANAGER'
   and job != 'SALESMAN'
   and job != 'CLERK';
  
-- between A and B 연산자를 쓰지 않을 때
select *
  from emp
 where sal >= 2000
   and sal <= 3000;

-- between A and B 연산자를 사용
select *
  from emp
 where sal between 2000 and 3000; 

-- not between을 사용할 수 있음   
select *
  from emp
 where sal not between 2000 and 3000;

-- not between을 사용하지 않을 경우
select *
  from emp
 where sal < 2000
    or sal > 3000;
   
-- like 연산자와 와일드 카드(검색어에 사용, 중요함)
/* like는 패턴을 가진 데이터를 추려낼 수 있음 
   (%)는 어떤 문자든 어떤 길이든 상관없이 올 수 있음 */
select *
  from emp
 where ename like 'S%';

-- S가 이름에 포함되어 있기만 하면 출력
select *
  from emp
 where ename like '%S%';

-- 두번째 글자가 L인 것을 like 연산자를 이용하여 출력하기
-- _(언더 바)는 어떤 문자든 상관 없이 하나의 글자를 의미함.
-- like는 비교 검색하는 속도가 느림. 이퀄(=)은 like보다 빠른 편임.
 select *
   from emp
  where ename like '_L%';
 
-- like 앞에도 not를 붙일 수 있음.
select *
  from emp
 where ename  not like '%AM%';
 
-- 기본적으로 항목에 null값이 들어가면 출력되지 않음
select *
  from emp;
 where comm = null; 
 
-- is null을 사용, 값이 null인 값을 출력할 수 있음
select *
  from emp;
 where comm is null;

-- is not null을 사용, 값이 null인 값을 출력할 수 있음
select *
  from emp;
 where comm is not null;