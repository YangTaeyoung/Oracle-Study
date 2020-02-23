-- ● 데이터 질의어(DQL)
-- > 객체의 조회(SELECT) 관련 기능을 수행

-- ● 데이터 조작어(DML)
-- > 요소의 생성, 수정, 삭제에 관한 기능을 수행
-- > insert, update, delete

-- ● 데이터 정의어(DDL)
-- > 객체의 생성(CREATE)·변경(ALTER)·삭제(DROP) 관련 기능을 수행함.
-- > DDL 명령은 Auto-commit임 (rollback을 해도 취소할 수 없음) 따라서 신중히 사용하여야 한다.

-- ● CREATE
-- > 테이블을 생성하는 명령어
create table emp_ddl
(
    empno       number(4),
    ename       varchar2(10),
    job         varchar2(9),
    mgr         number(4),
    hiredate    date,
    sal         number(7,2), -- 콤마가 있을 경우 소숫점 자리 숫자를 포함함.
    comm        number(7,2),
    deptno      number(2)
);

-- ● ALTER
-- > 오라클 내 이미 존재하는 객체의 특성을 변경하기 위한 명령어
-- > 테이블을 ALTER 명령어로 구조를 변경하는 방식은 외울 필요 없음.
-- > 책에 있거나, 인터넷 검색을 통해서 필요할 때 꺼내볼 수 있는 정보만 되어도 된다.
-- > 사용 빈도가 그리 높지 않다.

create table emp_alter as select * from emp;

select * from emp_alter;

-- ● 컬럼을 새로 추가하는 명령어 add
alter table emp_alter
  add hp varchar2(20);
  
  select * from emp_alter;

-- ● 테이블의 이름을 바꾸는 명령어 rename ~ to
alter table emp_alter
    rename column hp to tel;
    
    select * from emp_alter;

-- ● 컬럼의 자료형을 바꾸는 명령어 MODIFY
-- > 바꾸려는 데이터 타입이 기존의 데이터 타입과 호환되지 않을경우 변경 불가
-- > 바꾸려는 자릿 수가 기존의 자릿 수보다 작을 경우 변경 불가
alter table emp_alter
modify empno number(5);

desc emp_alter;

-- ● 테이블내의 컬럼을 삭제하는 명령어 DROP
alter table emp_alter
 drop column tel;

select * from emp_alter;
 
-- ● DROP
-- > 오라클 내 존재하는 객체를 삭제하기 위한 명령어
-- > 원래는 제거한 테이블은 복구할 수 없으나, flashback을 이용해서 복구할 수 있음

 

-- ● TRUNCATE
-- > 테이블 내의 데이터를 삭제하는 명령어
-- > DDL이므로 사용하고 되돌릴 수 없음.
-- > DELETE 보다 속도가 빠르다. (복구할 여지를 남길 필요가 없으므로)
