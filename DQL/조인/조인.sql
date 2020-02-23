-- ● 조인(★★★★★)
-- > 여러 개의 테이블을 가로로 연결해서 하나의 테이블처럼 보고 싶을 때 사용
-- > FROM절에 테이블을 여러개 써주면 됨,

-- 문제가 있는 방식, 데이터 베이스는 어떻게 붙여야 할 지, 판단할 수 없음.
select *
  from emp, dept
  order by empno;
  
-- where절을 이용해서 row를 뽑아와야 한다.
select *
  from emp , dept
 where emp.deptno = dept.deptno
 order by empno;
 
 -- 테이블에도 별칭을 사용할 수 있음.
 select *
  from emp e , dept d
 where e.deptno = d.deptno
 order by empno;

-- ● 등가 조인
-- > 조인 하는 조건 식이 (테이블1.어떤 컬럼 = 테이블2.어떤 컬럼) 형식인 방식

-- and 연산자를 이용, 조건을 추가로 설정할 수 있음.
select sal, ename, sal, e.deptno, dname, loc
  from emp e , dept d
 where e.deptno = d.deptno
   and sal>=3000
 order by empno;
 
 -- ※ 조인 테이블 개수와 조건식 개수의 관계
 --> select문에서 조인에 사용될 테이블이 n개라면, 이 조인에 필요한 조인 조건식은 n-1개다.
 --> ex. A라는 테이블과 B라는 테이블을 조인할 때: A<->B 관계가 있는 조건식 최소 하나가 필요하다.
 --> A<->B, B<->B, 혹은 
 --> A<->B, A<->C, 와 같은 조건식이 최소한 두 개 필요하다.  

-- ● 비등가 조인
-- > (=)이 아닌 이상, 이하, 초과, 미만으로  범위 조인 조건식을 설정해 주고 싶을 때 사용
-- > 실무에서 많이 사용하지는 않는다.
select *
  from emp e, salgrade s
 where e.sal between s.losal and s.hisal;
 
-- ● Self Join(자체조인)
-- > 같은 테이블 2개를 조인 시키는 방식
-- > 저장용량, 속도에서 문제가 일어날 수 있음 (속도 문제가 더 큼)
-- > 상당히 자주 사용한다.
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr = e2.empno;
 
-- ● 외부 조인(★★★★★)(꼭 기억하기)
-- > 면접에서 질문으로 자주 나온다.
-- > null값을 처리하는 데 자주 사용한다.
-- > 조인 대상의 테이블에서, 조인의 기준이 되는 컬럼의 값이 null이어서, 
--   결과 조회대상에서 제외된 데이터도 강제로 출력하기 위해 사용되는 조인방식

-- 왼쪽 외부조인
select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno, 
       e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr = e2.empno(+)
 order by e1.empno;
 
-- 오른쪽 외부조인
select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno,
       e2.ename as mgr_ename
  from emp e1, emp e2
 where e1.mgr(+) = e2.empno
 order by e1.empno;
 
-- ● 표준 문법 조인
-- > 오라클에서는 기본적으로 SQL-91 방식, SQL-99방식
-- > 실무에서는 두 개 다 쓴다.
-- > 개발자 입장에서는 이전 방식이 편한 경우가 많다.
-- > 최근 트렌드는 표준 조인 방식을 사용하려고 하는 경우가 많다. 
--  (데이터 베이스가 바뀌는 경우가 흔하는 경우가 많기 때문이다.)
-- > 알아보기는 힘들지만, where절과 구분되어 있기 때문에 어떤 컬럼이 조인되어 있는지 파악하기 용이하다.
-- > 두 개 테이블이 동일한 이름의 컬럼을 단 하나 가지고 있을 때 사용 가능
select e.empno, e.ename, e.job, e.hiredate, e.sal, e.comm, 
       deptno, d.dname, d.loc
  from emp e natural join dept d
 order by deptno, e.empno;
 
-- ※ natural join을 사용하지 못할 때
-- > 조인할 컬럼이 이름이 다를 때
-- > 동일한 이름의 컬럼이 여러 개 일 때

-- ● join~using
-- > 조인할 때 어떤 컬럼을 기준으로 등가 조인할 지 지정해 줄 수 있다.
-- > natural과 비슷함.
-- > 두 개 테이블 간에 같은 이름이 여러 개 일 때 사용 가능
-- > 두 개 테이블 간에 같은 이름이 여러개 없다면 사용 불가능.
select e.empno, e.ename, e.job, e.hiredate, e.sal, e.comm, 
       deptno, d.dname, d.loc
  from emp e join dept d using(deptno)
 where sal >= 3000
 order by deptno, e.empno;
 
-- 참고) 
-- > 기존 조인(where 이용)을 사용 할 때는, 조인 기준이 되는 컬럼 앞에 어떤 테이블 소속인지 꼭 명시해야 한다.
-- where e.deptno = deptno(X) / where e.deptno = d.deptno(O)
-- > 따라서 모든 컬럼 앞에 소속 테이블을 적어주는게 일반적이다.

-- ※ 주의 사항
-- > natural join, join ~ using()의 경우, 조인할 컬럼의 소속을 명시하지 않아야 한다.

-- ● join ~ on
-- > 기존의 where절을 대체함. 
-- > where절이 길 때 유용함.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.hiredate, e.sal, e.comm, 
       e.deptno, d.dname, d.loc
  from emp e join dept d on(e.deptno = d.deptno)
 where sal <= 3000
 order by deptno, e.empno;

-- ● outer join(외부 조인의 표준문법)
-- > 전체 외부조인을 할 수 있음.

-- 왼쪽 외부조인
select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 left outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- 오른쪽 외부조인
select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 right outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- 전체 외부조인
 select e1.empno, e1.ename, e1.mgr,  e2.empno, e2.ename
  from emp e1 full outer join emp e2 on(e1.mgr = e2.empno)
 order by e1.empno;
 
-- ● 3개 이상의 테이블을 조인할 때
-- > join을 뒤에 더 붙여주면 된다. 
