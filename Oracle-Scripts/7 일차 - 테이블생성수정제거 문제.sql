-- 08 ���̺� ���� ���� ����

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

-- DB ������ ����, NULL ��� ���ΰ� �ٸ��� ���õǾ� ���� �� �ִ�.

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

-- ���̺� ����� ���������� ������� �ʴ´�.
    --NOT NULL, Primary Key, Unique, Foreign Key, check, default

--5. 
drop table emp;

--6.
rename employee2 to EMP;

select * from emp;

--7. 
alter table dept
drop column dname;

-- ���� ��ϴ� �ý��ۿ����� ���ڵ尡 ���� ����ִ�. �÷����Ž� ���ϰ� ���� �߻�, (�߰��� ����)

desc dept;

--8. DEPT ���̺��� LOC �÷��� UNUSED�� ǥ�� �Ͻÿ�.  <== ������ �÷��� ��Ȱ��ȭ. (�����ð�)
alter table dept
set unused (loc);

desc dept;

--9.
alter table dept
drop unused column;

desc dept;



-- 09. ������ ���۰� Ʈ����� ����.
--=============================================================

--1. EMP ���̺��� ������ �����Ͽ� EMP_INSERT �� �̸��� �� ���̺��� ����ÿ�.  hiredate �÷��� date �ڷ������� �߰��ϼ���.
create table EMP_INSERT
as
select * from employee
where 0=1;          -- ������ false �� �����ϸ�

alter table emp_insert
modify hiredate varchar2(100);

select * from emp_insert;
desc emp_insert;

--2. ������ EMP_INSERT ���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��Ͻÿ�. 
insert into emp_insert
values ( 1, '���繬', 'student',1111,sysdate,1000,0,10);
commit;

-- ���̺� �÷��� �߰��Ҷ��� NULL ����ϸ鼭 �߰��ؾ���

--3. EMP_INSERT ���̺� �� ����� �߰��ϵ� TO_DATE �Լ��� �̿��ؼ� �Ի����� ������ �Է��Ͻÿ�. 
insert into emp_insert
values (2, '�̴���', 'student', 2222, sysdate - 1, 3000, 0, 20);

--4. employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ����ÿ�. 
create table EMP_COPY
as
select * from employee;

select * from emp_copy;
--5. �����ȣ�� 7788�� ����� �μ���ȣ�� 10������ �����Ͻÿ�. [ EMP_COPY ���̺� ���] 
update emp_copy
set dno = 10
where eno = 7788;


select eno, dno
from emp_copy
where eno = 7788;
--6. �����ȣ�� 7788 �� ��� ���� �� �޿��� �����ȣ 7499�� ������ �� �޿��� ��ġ �ϵ��� �����Ͻÿ�. [ EMP_COPY ���̺� ���]
update emp_copy
set job = 'SALESMAN', salary = 1600
where eno = 7788;



select eno,job,salary
from emp_copy
where eno = 7788;

select eno,job,salary       
from emp_copy
where eno = 7499;       --salesman, 1600

--7. �����ȣ 7369�� ������ ������ ����� �μ���ȣ�� ��� 7369�� ���� �μ���ȣ�� ���� �Ͻÿ�. [ EMP_COPY ���̺� ���] 
update emp_copy
set dno = 20
where job = 'SALESMAN';


select eno,job,dno                  --7369 - 20, salesman 20����
from emp_copy
where job = 'SALESMAN';

--8. department ���̺��� ������ ������ �����Ͽ� DEPT_COPY �� �̸��� ���̺��� ����ÿ�. 
create table DEPT_COPY
as
select * from department;

--9. DEPT_COPY�� ���̺��� �μ����� RESEARCH�� �μ��� ���� �Ͻÿ�. 
delete dept_copy
where dname = 'RESEARCH';

select * from dept_copy;

--10. DEPT_COPY ���̺��� �μ���ȣ�� 10 �̰ų� 40�� �μ��� ���� �Ͻÿ�. 

delete dept_copy
where dno = 10 or dno =40;

commit;











