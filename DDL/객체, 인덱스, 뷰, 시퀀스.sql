-- ● 오라클 객체
-- > 오라클에서 데이터 관리를 위해 사용하는 테이블을 포함한 여러 구성요소

-- ● 테이블 종류
-- 1. 사용자 테이블
-- > emp,dept와 같이 목적을 위해 데이터를 저장할 테이블, 즉 사용자가 만들어 쓰는 테이블
-- > 예) 윈도우 내의 Program Files 안에 있는 어플리케이션
-- 2. 데이터 사전
-- > 오라클 데이터베이스 자체를 관리하기 위한 테이블, 다이렉트로 조회가 불가능하다.
-- > 다만, 필요에 따라서 데이터 사전 뷰라는 것을 통해서 제한적으로 조회가 가능함
-- > 예) 윈도우 내의 Windows 폴더

-- 접속한 계정 내의 테이블의 정보를 보여줌
select * from user_tables;

-- 접속한 계정 + 다른 계정 소유이지만 지금 접속한 계정에 사용이 허가된 테이블을 보여줌
select * from all_tables;

-- scott계정은 관리자 테이블을 볼 권한이 없기 때문에 에러 발생.
select * from dba_tables;

-- ● 인덱스
-- > 특정 테이블의 조회속도를 향상시키기 위해, 특정컬럼의 색인을 만들어 두는 객체
-- > 추가로 공부를 하면 좋음
-- > 데이터가 최소 수백만 건 이상 되어야 체감됨.

-- scott가 소유한 인덱스 정보 출력하기
select * from user_indexes;

-- 컬럼의 인덱스 정보 출력하기
select * from user_ind_columns;

-- > 인덱스는 필요한 컬럼에 사용자가 직접 지정해 줄 수 있다.
-- > 이미 중요한 컬럼임이 확정되어 있는 컬럼에는 오라클이 자동으로 인덱스 생성.
-- > primary key에 만들어짐.

-- ※ 모든 컬럼에 인덱스를 넣는 것은 좋은가?
-- > select문은 빨라지나, 다른 DML, DCL, DDL 등은 느려짐

-- sal컬럼에 인덱스 생성하기.
create index idx_emp_sal
    on emp(sal);

-- 생성한 인덱스 삭제하기
drop index idx_emp_sal;

-- ● SQL Tunning
-- > 인덱스와 실행계획(excution plan) 등을 활용하여, 기존 SELECT문의 속도를 향상시키는 작업
-- > 당장 배울 필요는 없다. 데이터를 정확히 뽑기도 어렵기 때문에

-- ● 뷰
-- > 가상테이블로도 불림. 
-- > SQL문을 간소화, 재사용을 위한 목적
-- > 보안이 목적이 되기도 함.(모든 데이터를 보여주지 않기 위함)

-- 뷰 생성하기
create view vw_emp20
    as (select empno, ename, job, deptno
          from emp
         where deptno = 20);

-- 뷰 정보 확인
select * from user_views;

-- 생성한 뷰 조회하기
select * from vw_emp20;

-- 뷰 삭제하기
drop view vw_emp20;

-- ※ 뷰에 insert, update등 가공이 가능한가?
-- > 뷰는 모든정보를 갖고 있지 않기 때문에, 가능은 하나 데이터의 누락이 발생할 수 있으므로 절대 사용하지 말 것.

-- ● inline view를 사용한 TOP_N SQL문
-- > rownum은 뽑혀온 열에 순서를 매겨줌
select rownum,e.*
  from emp e;
  
select rownum,e.*
  from emp e
 order by sal desc;

-- > rownum을 이용 최상위 3개만 뽑고 싶은 경우 
-- > 엄밀히 말해서 좋은 방식은 아님(많이 정렬하기 때문)
select rownum, e.*
  from (select *
          from emp e
         order by sal desc)e
 where rownum <= 3;

with e as (select * 
             from emp 
            order by sal desc)
select rownum, e.*
  from e;
  
-- ● 시퀀스
-- > primary key의 중복을 미연에 방지하기 위해 번호를 주는 역할을 함.
-- > 만드는 방법을 기억할 필요는 없음
-- > 대신 만들어져있는 시퀀스를 사용하는 방법을 반드시 알아야 함.

-- 시퀀스를 사용할 테이블을 생성
create table dept_sequence
    as select *
         from dept
        where 1!=1;

-- 시퀀스 생성
create sequence seq_dept_sequence 
 increment by 10
 start with 10
 maxvalue 90
 minvalue 0
 nocycle
 cache 2;
 
 -- ● 시퀀스의 사용법 (반드시 기억하기)
 insert into dept_sequence (deptno, dname, loc)
 values(seq_dept_sequence.nextval /*nextval: 다음에 들어갈 시퀀스*/, 'DATABASE', 'SEOUL');
 
 select * from dept_sequence order by deptno;
 