-- 7���� - ���� ����

-- ���̺� ���� : ���̺��� ��ü�� ������.
    -- ���̺��� �����ϸ�, �÷��� ���ڵ常 ���簡 ��
    -- ���̺��� �Ҵ�� ���������� ������� �ʴ´�. (Alter Table�� ����ؼ� �Ҵ��ؾ� �Ѵ�.)
    -- ���� ���� : �÷��� �Ҵ�Ǿ� �ִ�. ���Ἲ�� üũ
            -- NOT NULL, Primary Key, Unique, Foreign Key, check, default
            
-- ���̺��� ��ü ���ڵ带 ����.
Create table dept_copy
as
select * from department;

desc department;
desc dept_copy;

select * from dept_copy;

create table emp_copy
as
select * from employee;

select * from emp_copy;

-- ���̺� ���� : Ư�� �÷��� �����ϱ�
create table emp_second
as
select eno, ename, salary, dno from employee;

select * from emp_second;

-- ���̺� ���� : ������ ����ؼ� ���̺� ����.
create table emp_third
as
select eno, ename, salary 
from employee
where salary > 2000;

select * from emp_third;

-- ���̺� ���� : �÷����� �ٲپ ����
create table emp_forth
as
select eno �����ȣ, ename �����, salary ����
from employee;

select �����ȣ, �����, ���� from emp_forth;    --���̺��, �÷��� ==> ���� ����� ����.

-- ���̺� ���� : ������ �̿��ؼ� ���̺� ���� : �ݵ�� ��Ī �̸��� ����ؾ� �Ѵ�.

create table emp_fifth
as
select eno, ename, (salary * 12) as salary from employee;

select * from emp_fifth;

--���̺� ���� : ���̺� ������ ����, ���ڵ�� �������� �ʴ´�.

create table emp_sixth
as
select * from employee
where 0=1;           -- where ������ : false �� ����

select * from emp_sixth;
desc emp_sixth;

-- ���̺� ���� : Alter Table
create table dept20
as
select * from department;

desc dept20;
select * from dept20;

-- ������ ���̺��� �÷��� �߰� ��.  ���� : �ݵ�� �߰� �� �÷��� NULL�� ����ؾ� �Ѵ�.
Alter table dept20
add (birth date);

alter table dept20
add (email varchar2(100));

alter table dept20
add ( address varchar2(200));

--�÷��� �ڷ����� ���� :
desc dept20;

alter table dept20
modify dname varchar2 (100);

alter table dept20
modify dno number(4);

alter table dept20
modify address Nvarchar2(200);

-- Ư�� �÷� ���� : �����ð� �ܿ� �۾�. (���ϰ� ���� �ɸ� �� �ִ�.)

Alter table dept20
drop column birth;

select * from dept20;

alter table dept20
drop column email;

-- �÷��� �����ÿ� ���ϰ� ���� �߻��� ��.
    -- set unused : Ư�� �÷��� ��� ����(������), �߰��� ����.
    
alter table dept20      -- �������϶� Ư�� �÷��� �������
set unused (address);

desc dept20;

alter table dept20      -- �߰��� ��� ������ �÷��� ����
drop unused column;     -- ������� �ʴ� �÷��� ������.

/* �÷� �̸� ���� */
alter table dept20
rename column LOC to LOCATIONs;

alter table dept20
rename column DNO to D_Number;

/* ���̺� �̸� ���� */
rename dept20 to dept30;

desc dept30;

/* ���̺� ���� */
drop table dept30;

/*
    DDL : Create (����), Alter (����), Drop (����)
        << ��ü >>
        ���̺�, ��, �ε���, Ʈ����, ������, �Լ�, �������ν���...
        
        
    DML : Insert (���ڵ� �߰�), Update (���ڵ� ����), Delete (���ڵ� ����)
        << ���̺��� �� (���ڵ�, �ο�) >>
        
    
    DQL : Select 
    
    
    ���̺��� �����̳� ���̺� ������
    1. delete       : ���̺��� ���ڵ带 ����, where�� ������� ������ ��� ���ڵ� ����. / commit; �ؾߵ�
    2. truncate     : ���̺��� ���ڵ带 ����, �ӵ��� ������ ������. <<���� ����>>      / commit ���ص���
    3. drop         : ���̺� ��ü�� ����
        
*/

create table emp30
as
select * from employee;

select * from emp10;

-- emp10 : delete�� ����ؼ� ����.
    delete emp10;
    commit;
    
    select * from emp10;
-- emp20 : truncate �� ����ؼ� ����
    truncate table emp20;
    -- commit ���ص���
    select * from emp20;

-- emp30 : drop �� ����ؼ� ����.
    drop table emp30;
    
    select * from emp30;

drop table EMP;
drop table emp_copy;


/*
    ������ ���� : �ý����� ���� ������ ������ִ� ���̺�
        user_   :   �ڽ��� ������ ���� ��ü������ ���
        all_    :   �ڽ��� ������ ������ ��ü�� ������ �ο����� ��ü ������ ���
        dba_    :   ������ ���̽� �����ڸ� ���� ������ ��ü ������ ���.  / ������ �������� ����
        
*/

show user;
select * from user_tables;          -- ����ڰ� ������ ���̺� ���� ���
select table_name from user_tables;
select * from user_views;           -- ����ڰ� ������ �信 ���� ���� ���
select * from user_indexes;         -- ����ڰ� ������ �ε��� ����.
select * from user_constraints;      -- �������� Ȯ��.
select * from user_sequences;
where table_name = 'EMPLOYEE';

select * from all_tables;       -- ��� ���̺��� ���, ������ �ο� ���� ���̺� ���.
select * from all_views;

select * from dba_tables;       --������ ���������� ���డ��

/*
    �������� : ���̺��� ���Ἲ�� Ȯ���ϱ� ���ؼ� �÷��� �ο��Ǵ� ��Ģ.
        1. Primary Key
        2. Unique
        3. not null
        4. check 
        5. Foreign key
        6. Default
*/

-- 1. Primary key : �ߺ��� ���� ���� �� ����.

    -- a. ���̺� ������ �÷��� �ο�
        -- ���� ���� �̸� : �������� ���� ��� : Oracle���� ������ �̸����� ����,
            -- ���� ������ �����Ҷ� �������� �̸��� ����ؼ� ����.
            -- PK_customer01_id : Primary key , customer01, id
            -- NN_customer01_pwd : not null, customer01(���̺��), id (�÷���)
    
    create table customer01 (                   
    id varchar2(20) not null  constraint PK_customer01_id Primary key  ,
    pwd varchar2(20) constraint NN_customer01_pwd not null ,
    name varchar2(20) constraint NN_customer01_name not null ,
    phone varchar2(30) null,
    address varchar2(100) null
    );
    
    select * from user_constraints
    where table_name = 'CUSTOMER01';
    
        create table customer02 (                   
    id varchar2(20) not null Primary key  ,
    pwd varchar2(20)  not null ,
    name varchar2(20)  not null ,
    phone varchar2(30) null,
    address varchar2(100) null
    );
    
        select * from user_constraints
    where table_name = 'CUSTOMER02';

-- ���̺��� �÷� ������ ���� ���� �Ҵ�.
    create table customer03 (                   
    id varchar2(20) not null  ,
    pwd varchar2(20) constraint NN_customer03_pwd not null ,
    name varchar2(20) constraint NN_customer03_name not null ,
    phone varchar2(30) null,
    address varchar2(100) null,
        constraint PK_customer03_id Primary key (id)
    );
    
/*
    Foreign Key (����Ű) : �ٸ� ���̺�(�θ�)�� Primary key, Unique �÷��� �����ؼ� ���� �Ҵ�.
    check : �÷��� ���� �Ҵ��� �� check �� �´� ���� �Ҵ�.
*/
-- �θ� ���̺�
Create table ParentTbl (
    name varchar2(20),
    age number(3) constraint CK_ParentTbl_age check (AGE > 0 and AGE < 200),
    gender varchar(3) constraint CK_ParentTbl_gender check (gender IN ('M','W')),
    infono number constraint PK_ParentTbl_infono Primary key
    );

desc parentTbl;
select * from user_constraints
where table_name = 'PARENTTBL';

select * from ParentTbl;
insert into ParentTbl
values ('ȫ�浿', 30, 'M', 1);

insert into ParentTbl
values ('��ʶ�', 300, 'K', 1);     -- ���� �߻� : 300 (check ����), K (check ����), 1 (Primary Key ����)

insert into ParentTbl
values ('��ʶ�', 50, 'M', 2);


-- �ڽ� ���̺�
Create table ChildTbl(
    id varchar2(40) constraint PK_childTbl_id Primary Key,
    pw varchar2(40), 
    infono number ,
    constraint FK_ChildTbl_infono foreign key (infono) references ParentTbl(infono)
    );
    
insert into ChildTbl 
values ('aaa', '1234', 1);

insert into ChildTbl
values ('bbb', '1234', 2);

commit;

select * from ChildTbl;

-- �θ����̺�
create table ParentTbl2 (
    dno number(2) not null Primary key,
    dname varchar2(50) ,
    loc varchar2(50)
    );
    
    insert into ParentTbl2
    values (10, 'SALES', 'SEOUL');
    
    
--�ڽ� ���̺�
create table ChildTbl2(
    no number not null,
    ename varchar2(50),
    dno number(2) not null,
    foreign key (dno) references ParentTbl2(dno)
    );

    insert into ChildTbl2
    values (1, 'Park', 10);
    
    select * from childTbl2;

-- Default ���� ���� : ���� �Ҵ� ���� ������ default ���� �Ҵ�.

Create table emp_sample01 (
    eno number(4) not null Primary key,
    ename varchar2(50),
    salary number(7,2) default 1000
    );

select * from emp_sample01; 

--default �÷��� ���� �Ҵ��� ���.
insert into emp_sample01
values (1111, 'ȫ�浿', 1500);

--default �÷��� ���� �Ҵ����� �ʴ� ���. default�� �Ҵ�� ���� ����
insert into emp_sample01 (eno, ename)
values (2222, 'ȫ���');

insert into emp_sample01
values (3333, '������', default);

Create table emp_sample02 (
    eno number(4) not null Primary key,
    ename varchar2(50) default 'ȫȫȫ',
    salary number(7,2) default 1000
    );
insert into emp_sample02 (eno)
values(10);

select * from emp_sample02;

insert into emp_sample02
values(20, default, default);

/*
    Primary Key, Foreign Key, Unique, Check, Default, not null
    
*/

create table member10 (
    no number not null constraint PK_member10_no Primary key,
    name varchar(50) constraint NN_member10_name Not null,
    birthday date default sysdate,
    age number (3) check (age >0 and age < 150),
    gender char(1) check (gender in ('M', 'W')),
    dno number(2) Unique
    );
insert into member10
values (1, 'ȫ�浿', default,30,'M', 10);

select * from member10;

insert into member10
values (2, '������', default,30,'M', 10);

create table orders10 (
    no number not null Primary key,    
    p_no varchar(100) not null,
    p_name varchar(100) not null,
    Price number check (price>10),
    phone varchar(100) default '010-0000-0000',
    dno number(2) not null,
    foreign key (dno) references member10(dno)
    );
    
insert into orders10
values (1, '11111', '������', 5000, default, 10);

select * from orders10;
    
drop table member;
drop table orders;


/* ���� ���� ���� (Alter Table) : ������ ���̺� ���� ������ ���� */

create table emp_copy50
as
select * from employee;

create table dept_copy50
as
select * from department;

select * from emp_copy50;
select * from dept_copy50;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT');

select * from user_constraints
where table_name in ('EMP_COPY50', 'DEPT_COPY50');



-- ���̺��� �����ϸ� ���ڵ常 ���簡 �ȴ�. ���̺��� ���� ������ ����Ǿ� ���� �ʴ´�. 
--  Alter Table�� ����ؼ� ���������� ����

select * from emp_copy50;

-- Primary Key
alter table emp_copy50
add constraint PK_emp_copy50_eno primary key (eno);

alter table dept_copy50
add constraint PK_dept_copy50 primary key (dno);

-- Foreign key
alter table emp_copy50
add constraint FK_emp_copy50_dno_dept_copy50 foreign key (dno) references dept_copy50(dno);

-- NOT NULL ���� ���� �߰�. (������ �ٸ���, add ��ſ� modify �� ���)
desc employee;
desc emp_copy50;    -- Not Null�� ���� �ʾ�����, Primary Key ���� ������ �Ҵ�,
desc department;
desc dept_copy50;   -- Primary key �������� �ڵ����� Not Null

    -- ������ null �� ���ִ� ������ not null �÷����� ������ �� ����.
select ename from emp_copy50
where ename is null;

alter table emp_copy50
modify ename constraint NN_emp_copy50_ename not null;

    -- commission �÷��� not null �Ҵ� �ϱ� : null �� �� �ִ� ��� null �� ó��
alter table emp_copy50
modify commission constraint NN_emp_copy50_commission not null;

update emp_copy50
set commission = 0
where commission is null;

-- Unique ���� ���� �߰� : �÷��� �ߺ��� ���� ������ �Ҵ� ���� ���Ѵ�.

select ename, count(*)
from emp_copy50
group by ename
having count(*) > 2;

alter table emp_copy50
add constraint UK_emp_copy50_ename unique (ename);

-- check ���� ���� �߰�
select * from emp_copy50;

alter table emp_copy50
add constraint CK_emp_copy50_salary check ( salary > 0 and salary < 10000);

-- default ���� ���� �߰�  < ���� ������ �ƴ� : �������� �̸��� �Ҵ��� �� ����. >
    -- ���� ���� ���� ��� default �� ������ ���� ����.
alter table emp_copy50
modify salary default 1000;

alter table emp_copy50
modify hiredate default sysdate;


desc emp_copy50;
insert into emp_copy50 (eno, ename, commission)
values (9999, 'JULI', 100);

insert into emp_copy50
values ( 8888, 'JULIA', null, null, default, default, 1500, null);

/*  ���� ���� ���� : Alter Table  ���̺�� drop */

-- Primary key ����  :  ���̺� �ϳ��� ������.

alter table emp_copy50  -- ���� ���� ���ŵ�.
drop primary key ;

alter table dept_copy50  -- ���� �߻� : foregin key�� �����ϱ� ������ ���� �ȵ�.
drop primary key;

alter table dept_copy50     -- Foreign key �� ���� �����ϰ� primary key ����
drop primary key cascade;

select * from user_constraints
where table_name in ('EMP_COPY50', 'DEPT_COPY50');

-- not null �÷� ���� �ϱ� :  < ���� ���� �̸����� ���� >
alter table emp_copy50
drop constraint NN_EMP_COPY50_ENAME;

alter table emp_copy50
drop constraint UK_EMP_COPY50_ SALARY;

alter table emp_copy50
drop constraint NN_EMP_COPY50_COMMISSION;

-- default �� null ��� �÷��� default null �� ���� : default ���� ������ ���� �ϴ°�.
alter table emp_copy50
modify hiredate default null;

select * from dept_copy50;

/* ���� ���� disable / enable
    - ���� ������ ��� ���� Ŵ.
    - �뷮(Bluk Insert) ���� ���� ���̺� �߰��� �� ���ϰ� �� ���� �ɸ���.  disable ==> enable
    - Index�� ������ ���ϰ� ���� �ɸ���.   disable == > enable
    
*/

alter table dept_copy50
add constraint PK_dept_copy50_dno primary key (dno);

alter table emp_copy50
add constraint PK_emp_copy50_eno primary key ( eno);

alter table emp_copy50
add constraint FK_emp_copy50_dno foreign key (dno) references dept_copy50 (dno);


select * from user_constraints
where table_name in ('EMP_COPY50', 'DEPT_COPY50');

select * from emp_copy50;
select * from dept_copy50;

alter table emp_copy50
disable constraint FK_emp_copy50_dno;

insert into emp_copy50 (eno, ename, dno)
values (8989, 'aaaa',50);

insert into dept_copy50
values (50, 'HR', 'SEOUL');

alter table emp_copy50
enable constraint FK_emp_copy50_dno;





