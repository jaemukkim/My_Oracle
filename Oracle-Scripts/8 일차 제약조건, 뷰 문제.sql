-- 8���� ����


10 : ������ ���Ἲ�� ���� ����, 11 ��

1. employee ���̺��� ������ �����Ͽ� emp_sample �� �̸��� ���̺��� ����ÿ�. ��� ���̺��� �����ȣ �÷��� ���̺� ������ primary key ���������� �����ϵ� �������� �̸��� my_emp_pk�� �����Ͻÿ�. 
create table emp_sample
as
select * from employee
where 0=1;

alter table emp_sample
add constraint my_emp_pk primary key (eno);

select * from user_constraints
where table_name = 'EMP_SAMPLE';

2. department ���̺��� ������ �����Ͽ� dept_sample �� �̸��� ���̺��� ����ÿ�. �μ� ���̺��� �μ���ȣ �÷��� ������ primary key ���� ������ �����ϵ� ���� �����̸��� my_dept_pk�� �����Ͻÿ�. 
create table dept_sample
as
select * from department
where 0=1;

alter table dept_sample
add constraint my_dept_pk primary key (dno);

select * from user_constraints
where table_name = 'DEPT_SAMPLE';

3. ��� ���̺��� �μ���ȣ �÷��� �������� �ʴ� �μ��� ����� �������� �ʵ��� �ܷ�Ű ���������� �����ϵ� ���� �����̸��� my_emp_dept_fk �� �����Ͻÿ�. [���� : �� ������ ���̺��� ����Ͻÿ�]
alter table emp_sample
add constraint my_emp_dept_fk foreign key (dno) references dept_sample(dno);

select * from user_constraints
where table_name in ('DEPT_SAMPLE','EMP_SAMPLE');

4. ������̺��� Ŀ�Լ� �÷��� 0���� ū ������ �Է��� �� �ֵ��� ���� ������ �����Ͻÿ�. [���� : �� ������ ���̺��� ����Ͻÿ�]
alter table emp_sample
add constraint my_emp_pk_commission check (commission > 0);

5. ������̺��� ���� �÷��� �⺻ ������ 1000 �� �Է��� �� �ֵ��� ���� ������ �����Ͻÿ�. [���� : �� ������ ���̺��� ����Ͻÿ�]
alter table emp_sample
modify salary default 1000;

6. ������̺��� �̸� �÷��� �ߺ����� �ʵ���  ���� ������ �����Ͻÿ�. [���� : �� ������ ���̺��� ����Ͻÿ�]
alter table emp_sample
add constraint UK_emp_sample_ename unique (ename);

7. ������̺��� Ŀ�Լ� �÷��� null �� �Է��� �� ������ ���� ������ �����Ͻÿ�. [���� : �� ������ ���̺��� ����Ͻÿ�]
alter table emp_sample
modify commission NOT NULL;

update emp_sample
set commission = 0
where commission is null;

select * from emp_sample;

8. ���� ������ ��� ���� ������ ���� �Ͻÿ�. 
select * from user_constraints
where table_name in ('DEPT_SAMPLE','EMP_SAMPLE');

alter table emp_sample
drop primary key cascade;

alter table dept_sample
drop primary key cascade;

alter table emp_sample
drop constraint MY_EMP_PK_COMMISSION;

alter table emp_sample
drop constraint UK_EMP_SAMPLE_ENAME;

alter table emp_sample
drop constraint SYS_C007092;

-- ���� ������ ���Ž� : Foreign Key �����ϸ� ���Ű� �ȵȴ�.
    -- 1. Foreign Key�� ���� ������ Primary key ����
    -- 2. Primary key�� ������ �� cascade �ɼ��� ��� : Foregin key ���� ���ŵǰ� PK �� ���ŵ�.


�� ���� 

1. 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸��� �μ���ȣ�� ����ϴ� select ���� �ϳ��� view �� ���� �Ͻÿ�.
	���� �̸� : v_em_dno  
create view v_em_dno
as
select eno, ename, dno
from employee
where dno = 20;

select * from v_em_dno;

2. �̹� ������ ��( v_em_dno ) �� ���ؼ� �޿� ���� ��� �� �� �ֵ��� �����Ͻÿ�.
create or replace view v_em_dno
as
select  eno, ename, dno,salary
from employee;

3. ������  �並 ���� �Ͻÿ�. 
drop view v_em_dno;

4. �� �μ��� �޿���  �ּҰ�, �ִ밪, ���, ������ ���ϴ� �並 ���� �Ͻÿ�. 
	���̸� : v_sal_emp
    create view v_sal_emp
    as
    select dno, min(salary) MIN, max(salary) MAX, avg(salary) AVG
    from employee
    group by dno;
    
    select * from v_sal_emp;

5. �̹� ������ ��( v_em_dno ) �� ���ؼ� <<�б� ���� ���>> ���� 
create view v_em_dno_read
as
select * from v_em_dno with read only;

select * from v_em_dno_read;





������ ����. 

1. emp01 ���̺��� �Ʒ��� ���� �����Ͻÿ�. 

�÷���	������Ÿ��	ũ��	NULL		��������
-----------------------------------------------------------------------------------
empno	number		4	NOT NULL	Primary key
ename	varchar2		10	NULL
hiredate	date			NULL

2. emp01 ���̺��� �����ȣ�� �ڵ����� �����ǵ��� �������� ���� �Ͻÿ�. 
   �ʱⰪ : 1
   ������ : 1
   �ִ밪 : 100000

3. �����ȣ�� �������� ���� �߱� �����ÿ�. 
