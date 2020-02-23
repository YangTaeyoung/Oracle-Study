-- Q.1
-- ич
create table empidx
    as select *
         from emp
        where 1!=1;
        
select * from empidx;

-- иш
create index idx_emp_empno
    on empidx(empno);

-- ищ
select * from user_ind_columns;

insert into empidx
        select * from emp;
        
-- Q.2
create view empidx_over15k
    as (select empno, ename, job, deptno, sal, nvl2(to_char(comm),'O','X') as comm
          from empidx
         where sal > 1500);

select * from empidx_over15k;

-- Q.3
-- ич
create table deptseq as select * from dept;
-- иш
create sequence seq_deptseq_sequence
increment by 1
start with 1
maxvalue 99
minvalue 1
nocycle
nocache;
-- ищ
insert into deptseq (deptno, dname, loc)
             values (seq_deptseq_sequence.nextval, 'DATABASE', 'SEOUL');

insert into deptseq (deptno, dname, loc)
             values (seq_deptseq_sequence.nextval, 'WEB', 'BUSAN');

insert into deptseq (deptno, dname, loc)
             values (seq_deptseq_sequence.nextval, 'MOBILE', 'ILSAN');
             
select * from deptseq;