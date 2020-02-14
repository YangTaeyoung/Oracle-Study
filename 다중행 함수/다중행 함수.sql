-- 컬럼의 총 합을 출력하는 함수(다중행 함수): sum(합을 구하고자 하는 컬럼)
select sum(sal)
  from emp;
 
-- 다중행 함수를 사용할 때의 주의점
--> row가 하나만 반환되므로 여러 row가 반환되는 컬럼은 select하면 안됨.

-- row의 개수를 세어주는 함수: count(개수를 셀 컬럼)
select count(*)
  from emp;

select count(*) as 
  from emp
 where deptno = 30;
 
-- 최대값을 구하는 함수: max()
select max(sal)
  from emp
 where deptno = 10;
-- 최소값을 구하는 함수: min()
select min(sal)
  from emp
 where deptno = 10;
 
--날짜에 관해서도 max, min함수를 적용할 수 있음(날짜에 관해서도 크기비교가 가능하므로)
select max(hiredate)
  from emp
 where deptno = 20;
 
select min(hiredate)
  from emp
 where deptno = 20;
 
-- 선택한 컬럼의 평균값을 출력하는 함수: avg()
 select avg(sal)
   from emp
  where deptno = 30;
  
-- 결과 값을 원하는 열로 묶어 출력하는 절: group by
select avg(sal), deptno
  from emp
 group by deptno
 order by deptno;
 
-- 그룹을 추가하여 각각의 통계량을 출력할 수도 있음
 select avg(sal), deptno,job
  from emp
 group by deptno,job
 order by deptno,job;
 
 /*
 [GROUP BY절을 사용할 때의 유의점]
 -> GROUP BY절에 명시되어 있지 않은 컬럼은 SELECT에 명시 했을 경우 에러를 출력한다.
 */
 
 -- groupby로 인해 출력된 row를 제한하기 위한:having절
 -- groupby만의 where라고 생각하자.
 select avg(sal), deptno, job
  from emp
 group by deptno, job
  having avg(sal) >= 2000
 order by deptno, job;
 
 /* having vs where (아주 중요함)*/
 -- where: 테이블에 있는 행, 즉 row를 걸러내기 위해 사용한다.
 -- having: group by를 통해 묶인 그룹을 걸러내기 위해 사용한다.
 -- 주의점)
 -- where가 위선순위가 높다.
 -- where 조건식을 만족하지 못하는 row는 Group화 대상이 아니다.
 
/*
 예시)
  select
    from
   where <- 제일 먼저 출력할 row를 다 걸러냄
   group by <- where절을 통해 걸러진 후 살아남은 row들로만 그룹을 만듦
  having <- group by로 만들어진 그룹중에서 출력할 그룹만 걸러냄
*/

-- 그룹화 함수는 매우 어렵기 때문에 실무에서도 사용되는 함수가 많이 없음.
-- 그룹별 통계값도 같이 구해주는 함수: rollup()
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
  from emp;
 group by rollup(deptno, job);
 
-- 모든 기준을 통해서 통계값을 구해주는 함수: cube()
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
  from emp;
 group by cube(deptno, job)
 order by deptno, job;
 