-- ● 데이터 조작어(DML)
-- > 데이터를 추가하거나, 삭제하거나, 변경하는 조작어

create table dept_temp -- dept_temp 라는 테이블을 새로 생성하겠음.
    as select * from dept;
    
drop table dept_temp; -- 테이블을 잘못 생성하였을 때 지우는 조작어
 
select * from dept_temp;

-- ● insert문
-- > 데이터를 추가하는 명령어, 컬럼부분은 생략가능
insert into dept_temp(deptno, dname, loc) -- 컬럼 부분의 순서가 바뀔 경우, 값의 순서도 바꿔어야 함.
              values (50, 'DATABASE', 'SEOUL');

-- 컬럼부분은 생략할 수도 있음.
insert into dept_temp -- 컬럼 부분의 순서가 바뀔 경우, 값의 순서도 바꿔어야 함.
               values (60, 'NETWORK', 'BUSAN');
     
-- ● 값에 NULL값 넣기

-- 1. ''를 입력하기(실무에서 잘 사용되지 않음 -> 언어 특성마다 다르기 때문)
insert into dept_temp(deptno, dname, loc) 
              values (80, 'MOBILE', '');
     
-- 2. 명시적 방법 (값에 직접 NULL을 입력)(명시적 NULL 삽입법)(가장 표준)
insert into dept_temp(deptno, dname, loc) 
              values (70, 'WEB', NULL);
              
-- 3. 컬럼을 명시하지 않기.(암시적 NULL 삽입법)(실무에서 잘 사용하지 않음: 프로그래머들끼리의 효율을 높이기 위함.)
insert into dept_temp(deptno, loc) 
              values (90, 'INCHEON');

select * from dept_temp;

-- ● 테이블의 컬럼 정보만을 복사해서 새로운 테이블을 만들고 싶을 때
create table emp_temp
          as select * 
               from emp
              where 1<>1;

select * from emp_temp;

-- ● 날짜관련 정보를 삽입할 떄
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (9999, '홍길동', 'PRESIDENT', null, '2001/01/01', 5000, 1000, 10);

select * from emp_temp;

-- 지정된 포멧 외 ('-')를 사용해서 날짜 정보를 삽입하기.
-- > 사용하지 말기. 오류 가능성. (이렇게 저장할 경우, 형변환 함수 to_date() 사용
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
              
select * from emp_temp;

-- 날짜의 순서가 달라질 경우, 데이터가 제대로 들어가지 않음
/* 
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20); -- 오류
*/

-- 순서가 달라질 경우 형변환 함수 to_date()를 사용하기.
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (2111, '이순신', 'MANAGER', 9999, to_date('07/01/2001', 'dd/mm/yyyy'), 4000, NULL, 20);
              
select * from emp_temp;


-- 지금 날짜, 지금 시간으로 날짜 데이터 집어넣기.(sysdate 이용)
insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
              values (3111, '심청이', 'MANAGER', 9999, sysdate, 4000, NULL, 30);

select * from emp_temp;

-- 서브 쿼리를 이용하여 한번에 여럭 데이터 추가하기 (예제 10-14)
-- > 잘 사용하지 않으나 기억해두기.