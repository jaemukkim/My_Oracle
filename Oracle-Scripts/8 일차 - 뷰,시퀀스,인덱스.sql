8���� - ��, ������, �ε���
/*
    �� (view) : ������ ���̺��� ��(view)�� �Ѵ�.
        -- ���̺��� ������ ���� ������ �ִ�.
        -- ��� ������ ���� ������ �ʴ´�. ���� �ڵ常 �� �ִ�.
        -- �並 ����ϴ� ���� :
            1. ������ ���ؼ� : ���� ���̺��� Ư�� �÷��� �����ͼ� ���� ���̺��� �߿� �÷��� ���� �� �ִ�.
            2. ������ ������ �並 �����ؼ� ���ϰ� ����� �� �ִ�. (������ JOIN ����)
        -- ��� �Ϲ������� select ������ �´�. 
        -- ��� insert, update, delete ������ �� �� ����.
        -- �信 ���� insert �ϸ� ���� ���̺� ����ȴ�. ���� ���̺��� ���� ������ �� �����ؾ� �ȴ�.
        -- �信 ���� insert �� ��� ���� ���̺��� ���� ���ǿ� ���� insert �� ���� �ְ� �׷��� ���� ���� �ִ�.
*/

create table dept_copy60 
as
select * from department;

create table emp_copy60
as
select * from employee;

-- �� ���� 
create view v_emp_job
as
select eno, ename, dno, job
from emp_copy60
where job like 'SALESMAN';

-- �� ���� Ȯ��
select * from user_views;

-- ���� ���� ( select * from �� �̸�)
select * from v_emp_job;


-- ������ ���� ������ �信 ����� �α�

create view v_join
as
select e.dno, ename, job, dname, loc
from employee e, department d
where e.dno = d.dno
and job = 'RESERACH';

select * from v_join;

-- �並 ����ؼ� ���� ���̺��� �߿��� ���� �����. (����)

select * from emp_copy60;

create view simple_emp
as
select ename, job, dno
from emp_copy60;

select * from simple_emp;   -- view�� ����ؼ� ���� ���̺��� �߿� �÷��� �����.

select * from user_views;

-- �並 ������ �� �ݵ�� ��Ī �̸��� ����ؾ� �ϴ� ���, group by �Ҷ� 

create view v_groupping
as
select dno, count(*) groupCount, avg(salary) AVG, sum(salary) SUM
from emp_copy60
group by dno;

select * from v_groupping;

-- �並 �����Ҷ� as ������ select ���� �;��Ѵ�. insert, update, delete ���� �� �� ����.
create view v_error
as
as insert into dno
values (60,'HR', 'BUSAN');

--view �� ���� insert �� �� ������? �÷��� ���� ������ �����ϸ� view ���� ���� ���� �� �ִ�.

create view v_dept
as
select dno, dname
from dept_copy60;

select * from v_dept;

insert into v_dept      -- View �� ���� Insert, ���������� ��ġ�Ҷ� ���� �� �ִ�.
values ( 70, 'HR');

select * from dept_copy60;

create or replace view v_dept     -- v_dept �� �������� ���� ��� : create, ������  ��� : replace (����)
as 
select dname, loc
from dept_copy60;

insert into v_dept
values ('HR2', 'BUSAN');

select * from v_dept;
select * from dept_copy60;

update dept_copy60
set dno = 80
where dno is null;
commit;

alter table dept_copy60
add constraint PK_dept_copy60 Primary key (dno);
select * from user_constraints
where table_name = 'DEPT_COPY60';

select * from v_dept;

insert into v_dept          -- 
values ('HR3' , 'BUSAN2');  


select * from user_views;

select * from v_groupping;      -- �׷��ε� view ���� insert �� �� ����.


create or replace view v_groupping
as
select dno, count(*) groupCount, round(AVG(salary),2) AVG, SUM(salary) SUM
from emp_copy60
group by dno;

-- insert, update, delete �� ������ ��
create view v_dept10
as
select dno, dname, loc
from dept_copy60;

insert into v_dept10
values (90, 'HR4', 'BUSAN4');

select * from v_dept10;

update v_dept10
set dname = 'HR5' , loc = 'BUSAN5'
where dno = 90;

delete v_dept10
where dno = 90;

commit;

-- �б⸸ ������ �並 ���� : (insert, update, delete ���ϵ��� ����)

create view v_readonly
as
select dno, dname, loc
from dept_copy60 with read only ;

select * from v_readonly;

-- insert , update, delete �Ұ���
insert into v_readonly
values (88, 'HR7', 'BUSAN7');

update v_readonly
set dname = 'HR77', loc = 'BUSAN77'
where dno = 88;

delete v_readonly
where dno = 88;







