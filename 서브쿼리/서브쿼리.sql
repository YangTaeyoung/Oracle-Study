-- ● 서브쿼리
-- > 쿼리 속의 쿼리

-- 기존에는 예시처럼 쿼리를 두 번 이상 써서 조회 하여야 했음
select sal
  from emp
 where ename = 'JONES'; 
 -- JONES의 SAL이 2975이므로
 select *
   from emp
  where sal > 2975;

-- 서브쿼리 사용시
-- 주의) 비교 대상의 자료형, 컬럼 갯수가 같아야 한다.
 select *
   from emp
  where sal > (select sal
                 from emp
                where ename = 'JONES');


-- 날짜에도 서브쿼리를 이용할 수 있음.

select *
  from emp
 where hiredate < (select hiredate
                     from emp
                    where ename = 'SCOTT');
                    
-- ● 단일행 서브쿼리
-- > 조회한 결과가 단 하나의 행으로 나오는 서브쿼리
-- > 함수를 적용할 수도 있음.
select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
  from emp e, dept d
 where e.deptno = d.deptno
   and e.deptno = 20
   and e.sal > (select avg(sal)
                  from emp);

-- ● 다중행 서브쿼리
-- > 실행 결과가 하나 이상인 경우, in all, any연산자를 사용
select *
  from emp
 where sal in (select max(sal)
                 from emp
                group by deptno);
    
    
-- ● any, some연산자
-- > 서브 쿼리의 결과 값 중에, 하나라도 단일 연산자에 부합하는 값이 있다면 true로 만들어주는 연산자이다
-- > =any, =some는 in으로 대체 가능함
-- > 이상, 이하, 미만, 초과등의 연산자를 사용할 때 용이함, 하지만,
select *
  from emp
 where sal = any(select max(sal)
                   from emp
                  group by deptno);
 
-- 아래의 경우 2850보다만 작으면 됨, 하나만 조건을 충족하면 되므로
select *
  from emp
 where sal < any(select sal
                   from emp
                  where deptno = 30)
 order by sal, empno;
 
-- max로 대채 가능하다.
 select *
  from emp
 where sal < (select max(sal)
                   from emp
                  where deptno = 30)
 order by sal, empno;

-- 위 내용은 아래 min함수를 쓴 것과 동일하다. 
 select *
  from emp
 where sal > any(select sal
                   from emp
                  where deptno = 30);
 
-- min함수 사용
select *
  from emp
 where sal > (select min(sal)
                   from emp
                  where deptno = 30);

-- ● all 연산자
-- > 우변 중 모든 조건을 만족해야 true로 출력함.              

-- 이 경우 최소값 sal 보다 작으면 되므로 min 함수로 대체가 가능함
select *
  from emp
 where sal < all (select sal
                    from emp
                   where deptno = 30); 
                   
 -- min 함수 사용시
 select *
  from emp
 where sal < (select min(sal)
                from emp
               where deptno = 30); 
                 
               
-- 이 경우 sal이 최대값 보다 크면 가능
select *
  from emp
 where sal > all (select sal
                    from emp
                   where deptno = 30); 
-- max로 대체 가능하다.
select *
  from emp
 where sal > (select max(sal)
                    from emp
                   where deptno = 30); 

-- exist 연산자
-- > 서브쿼리에 결과가 존재하면, 모두 true(하나이던 여러개든 상관 없이)
-- > 서브쿼리에 결과가 존재하지 않으면 모두 false
select *
  from emp
 where exists(select dname
                from dept
               where deptno = 10);
            
-- deptno = 50은 존재하지 않으므로 결과가 출력되지 않음.
select *
  from emp
 where exists(select dname
                from dept
               where deptno = 50);
               
-- ● 비교할 열이 여러개인 다중열 서브쿼리(★★★☆)
-- > 실무에서 잘 활용하진 않으나, 개발자들이 잘 모름.
select *
  from emp
 where (deptno, sal) in (select deptno, max(sal)
                           from emp
                          group by deptno);

-- ● from절에 사용하는 서브쿼리
-- > 일반적으로 from에는 테이블을 작성한다.
-- > 하지만, from절에는 테이블과 같이 row, column으로 구성된 어떤 개체도 명시가 가능하다.
-- > from절에 서브쿼리를 사용하면, 서브쿼리의 결과를 하나의 테이블 처럼 사용할 수 있다.
-- > from절에 사용한 서브쿼리는, 반드시 별칭을 지정해야 한다. (별칭이 가상의 테이블 처럼 이용이 가능함)
-- > from 절에 별도의 select문을 사용하여, 가상의 테이블처럼 사용 할 수 있는 데이터 묶음을 inline-view 라고 한다.
-- > 이미 만들어진 sql문을 이용하여 만드는 경우가 있음.(기존에 만들어 놓은 테이블이 가치있는 테이블일 경우)
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
 
   
