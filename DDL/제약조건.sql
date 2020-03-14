-- ● 제약조건
-- > 테이블의 특정 열에 지정하는 데이터의 속성.

-- - Not Null
-- > 데이터의 중복을 허용, null은 들어가면 안됨.

create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel       varchar2(20)
);

desc table_notnull;

insert into table_notnull (login_id, login_pwd, tel)
                   values ('TEST_ID_01', NULL/*제약조건이 not null이기 때문에 null값 입력이 되지 않음.*/, '010-1234-5678');

-- - Unique
-- > 데이터의 중복을 허용하지 않음, null값은 포함가능
create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel       varchar2(20)
);

insert into table_unique (login_id, login_pwd, tel)
                   values ('TEST_ID_01', 'PWD01', '010-1234-5678');

insert into table_unique (login_id, login_pwd, tel)
                   values ('TEST_ID_01', 'PWD01', '010-1234-5678'); -- id가 중복되었으므로 값이 들어가지 않음.

insert into table_unique (login_id, login_pwd, tel)
                   values (null, 'PWD01', '010-1234-5678'); -- 제약조건이 unique이므로 null값은 들어가짐.
                   
-- - Primary Key
-- > 데이터의 중복을 허용하지 않음, null값도 들어가면 안 됨.
-- > 개념적으로 중요함
-- > 주민등록번호, 고객번호, 결제번호 등이 이에 해당함.
-- > 기본키 제약조건으로 지정된 컬럼에는 자동으로 인덱스가 만들어진다.
-- > 기본키에 의해 자동으로 생성된 인덱스는 사용자가 임의로 삭제할 수 없음(기본키 제약조건이 없어질 때까지)

-- - Foreign Key(외래키)
-- > 다른 테이블에 있는 컬럼 값을 참조하는 키 예) emp 테이블의 deptno 
-- > foreign key 제약조건은 실무에서 잘 사용하지 않음. (삽입, 수정 등이 어렵기 때문)
-- > 테이블들간의 관계를 탄탄하게 만들어 주나, 해당 데이터를 삭제할 경우 관련된 데이터들이 모두 영향을 받기 때문에, 개발의 편의를 위해 잘 사용하지 않는다.

-- - 외래키 확인하기
select owner, constraint_name, constraint_type, table_name,r_owner, r_constraint_name
  from user_constraints
 where table_name in('DEPT','EMP'); 

create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dname  varchar2(14),
    loc    varchar2(13)
);

create table emp_fk
(
    empno    number(4) constraint empfk_empno_pk primary key,
    ename    varchar2(10),
    job      varchar2(9),
    mgr      number(4),
    hiredate date,
    sal      number(7,2),
    comm     number(7,2),
    deptno   number(2) constraint empfk_deptno_fk references dept_fk(deptno)  
);

-- ● Check
-- > 열에 저장할 수 있는 값의 범위 또는 패턴을 정의할 떄 사용됨
create table table_check
(
    login_id varchar2(20) constraint tblck_loginid_pk primary key,
    login_pwd varchar2(20) constraint tblck_loginpw_ck check(length(login_pwd)>3/*적어도 3글자 초과로 만들어야 함*/),
    tel varchar2(20)
);

select * from table_check; 

-- - 제약조건에 의해 들어가지 않는 예시) 비밀번호 길이가 3이기 때문에 조건에 충족하지 않음
insert into table_check
                 values('TEST_ID', '123', '010-1234-5678');
                 
-- ● Default
-- > 특정 열에 저장할 값이 지정되지 않았을 경우에 기본값을 지정할 수 있음.


-- dept 테이블에 데이터가 존재하지 않으므로 자료를 삽입할 수 없음
insert into emp_fk
        values(9999,'TEST_MNAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

-- dept 테이블에 자료를 삽입함
insert into dept_fk
        values(10, 'TEST_DNAME','TEST_LOC');

-- 동일 데이터 삽입 시 10번 부서가 생겼기 때문에 잘 삽입되는 것을 확인할 수 있음.
insert into emp_fk
        values(9999,'TEST_MNAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

select * from emp_fk;

-- deptno 테이블에 있는 10 번부서를 지우고 싶다면, emp테이블 중 10번 부서에 있는 인원을 모두 없애야만 dept테이블의 10번 부서를 없앨 수 있다.

-- ● 제약조건에 이름 붙이기
create table table_notnull2(
    login_id varchar2(20)  constraint tblnn2_lgnid_nn not null,
    login_pwd varchar2(20) constraint tblnn2_lgnpw_nn  not null,
    tel       varchar2(20)
);

select owner, constraint_name, constraint_type, table_name
  from user_constraints;



-- ● 데이터 무결성
-- > 데이터 베이스에 저장되는 데이터의 정확성과 일관성을 보장한다는 의미.
-- > 크게 영역 무결성, 개체 무결성, 참조 무결성으로 나뉜다.
-- > 알아서 오라클에서 해결해줌.
