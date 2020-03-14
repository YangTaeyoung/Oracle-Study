-- Q.1
create table dept_const
(
    deptno number(2) constraint deptconst_deptno_pk primary key,
    dname varchar2(14) constraint deptconst_dname_unq unique,
    loc varchar(13) constraint deptconst_loc_nn not null
);

create table emp_const
(
    empno number(4) constraint empconst_empno_pk primary key,
    ename varchar2(10) constraint empconst_ename_nn not null,
    job varchar2(9),
    tel varchar2(20) constraint empconst_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint empconst_sel_chk check(sal between 1000 and 9999),
    comm number(7,2),
    deptno number(2) constraint  empconst_deptno_fk references dept_const(deptno)
);

select table_name, constraint_name, constraint_type
  from user_constraints