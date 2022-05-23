-- 08 테이블 생성 수정 제거

--1.
create table dept(
DNO number(2) not null,
DNAME varchar2(14) null,
LOC varchar2(13) null);

desc dept;

--2.
create table EMP(
ENO number(4) not null,
ENAME varchar2(10) null,
DNO number(2) null);
desc EMP;

-- DB 설정에 따라서, NULL 허용 여부가 다르게 세팅되어 있을 수 있다.

--3.
alter table EMP
modify ENAME varchar(25);

desc emp;

select length(ename) from employee
where length (ename) > 5;


--4.
create table employee2
as
select eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID
from employee;

select * from employee2;

-- 테이블 복사시 제약조건은 복사되지 않는다.
    --NOT NULL, Primary Key, Unique, Foreign Key, check, default

--5. 
drop table emp;

--6.
rename employee2 to EMP;

select * from emp;

--7. 
alter table dept
drop column dname;

-- 실제 운영하는 시스템에서는 레코드가 많이 들어있다. 컬럼제거시 부하가 많이 발생, (야간에 진행)

desc dept;

--8. DEPT 테이블에서 LOC 컬럼을 UNUSED로 표시 하시오.  <== 제거할 컬럼을 비활성화. (업무시간)
alter table dept
set unused (loc);

desc dept;

--9.
alter table dept
drop unused column;

desc dept;



-- 09. 데이터 조작과 트랜잭션 문제.
--=============================================================

--1. EMP 테이블의 구조만 복사하여 EMP_INSERT 란 이름의 빈 테이블을 만드시오.  hiredate 컬럼을 date 자료형으로 추가하세요.
create table EMP_INSERT
as
select * from employee
where 0=1;          -- 조건을 false 로 설정하면

alter table emp_insert
modify hiredate varchar2(100);

select * from emp_insert;
desc emp_insert;

--2. 본인을 EMP_INSERT 테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하시오. 
insert into emp_insert
values ( 1, '김재묵', 'student',1111,sysdate,1000,0,10);
commit;

-- 테이블에 컬럼을 추가할때는 NULL 허용하면서 추가해야함

--3. EMP_INSERT 테이블에 옆 사람을 추가하되 TO_DATE 함수를 이용해서 입사일을 어제로 입력하시오. 
insert into emp_insert
values (2, '이다은', 'student', 2222, sysdate - 1, 3000, 0, 20);

--4. employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드시오. 
create table EMP_COPY
as
select * from employee;

select * from emp_copy;
--5. 사원번호가 7788인 사원의 부서번호를 10번으로 수정하시오. [ EMP_COPY 테이블 사용] 
update emp_copy
set dno = 10
where eno = 7788;


select eno, dno
from emp_copy
where eno = 7788;
--6. 사원번호가 7788 의 담당 업무 및 급여를 사원번호 7499의 담당업무 및 급여와 일치 하도록 갱신하시오. [ EMP_COPY 테이블 사용]
update emp_copy
set job = 'SALESMAN', salary = 1600
where eno = 7788;



select eno,job,salary
from emp_copy
where eno = 7788;

select eno,job,salary       
from emp_copy
where eno = 7499;       --salesman, 1600

--7. 사원번호 7369와 업무가 동일한 사원의 부서번호를 사원 7369의 현재 부서번호로 갱신 하시오. [ EMP_COPY 테이블 사용] 
update emp_copy
set dno = 20
where job = 'SALESMAN';


select eno,job,dno                  --7369 - 20, salesman 20으로
from emp_copy
where job = 'SALESMAN';

--8. department 테이블의 구조와 내용을 복사하여 DEPT_COPY 란 이름의 테이블을 만드시오. 
create table DEPT_COPY
as
select * from department;

--9. DEPT_COPY란 테이블에서 부서명이 RESEARCH인 부서를 제거 하시오. 
delete dept_copy
where dname = 'RESEARCH';

select * from dept_copy;

--10. DEPT_COPY 테이블에서 부서번호가 10 이거나 40인 부서를 제거 하시오. 

delete dept_copy
where dno = 10 or dno =40;

commit;











