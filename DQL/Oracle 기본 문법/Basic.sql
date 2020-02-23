/* Formatted on 2020/02/02 오후 12:42:18 (QP5 v5.354) */
/*모든 emp테이블을 선택 후 열람*/
SELECT * FROM emp;
/*레코드의 정보를 확인 하는 키워드: desc*/
desc emp;

DESC dept;

/*모든 emp열을 열람하나, deptno가 20인 행만 열람할 때: where 사용*/
SELECT *
  FROM emp
 WHERE deptno = 20;

/*중복 없이 열람할 때: discinct*/
SELECT DISTINCT deptno
  FROM emp;

/*각 테이블에 임의로 이름을 붙이고 싶을 때: as*/
  SELECT ename               AS 이름,
         sal                 AS 월급,
         sal * 12 + comm     AS 연봉,
         comm                AS 인센티브
    FROM emp
ORDER BY sal DESC, ename ASC;


SELECT *
  FROM emp
 WHERE deptno = 30 OR job = 'CLERK';