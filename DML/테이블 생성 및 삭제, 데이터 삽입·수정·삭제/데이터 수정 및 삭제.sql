-- ● 데이터 수정 (UPDATE문)
create table dept_temp2
    as select * from dept;
     
select * from dept_temp2;       

-- row를 따로 명시하지 않을 경우 모든 컬럼의 값이 다 바뀜
update dept_temp2
   set loc = 'SEOUL';
   
select * from dept_temp2;       

-- ● rollback
-- >앞전에 실행했던 명령어를 취소함
rollback;

-- ● row를 선택해서 해당 정보를 수정하기
-- > where절을 이용함.
-- > 여러 데이터를 수정할 경우 콤마(,)를 이용하여 구분
update dept_temp2
   set dname = 'DATABASE',
         loc = 'SEOUL'
 where deptno = 40;
 
select * from dept_temp2;
 
-- ● 서브쿼리를 이용하여 정보를 수정하기
-- > 예제 10-19 참고, 잘 사용하진 않으나, 기억해두기

-- ● UPDATE문의 WHERE절에 서브쿼리를 이용하여 데이터를 수정하는 경우
-- > 문법적으로뿐만 아니라, 실무에서 굉장히 중요하다.
-- > UPDATE를 사용하기 전에 WHERE절의 수정할 데이터를 SELECT를 이용하여, 확인해보아야 함.

-- +α) 만약 수정해야 되는 데이터가 너무 많아 일일이 체크할 수가 없을 경우.
-- > count를 이용하여 수정할 데이터의 개수를 조회해보기.

-- ● 테이블에 있는 데이터 삭제하기
create table emp_temp2
    as select * from emp;

 select * from emp_temp2;
 
-- WHERE절을 입력하지 않을 경우, 모든 데이터가 삭제됨.
delete from emp_temp2
 where job = 'MANAGER';
  
select * from emp_temp2;
 

