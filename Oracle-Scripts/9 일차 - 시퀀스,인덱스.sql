-- 9���� ������, �ε���,

/*
    ������ : �ڵ� ��ȣ �߻���    
        -- ��ȣ�� �ڵ� �߻��� �Ǹ� �ڷ� �ǵ��� �� ����. (���� �� �ٽ� �����ؾ� �Ѵ�.)
        -- Primary Key Ű �÷��� ��ȣ�� �ڵ����� �߻���Ű�� ���ؼ� ���.
        -- Primary Key Ű �÷����� �ߺ����� �ʴ� ������ ���� �Ű��� �Ƚᵵ �ȴ�.
*/

-- �ʱⰪ : 10, ������ : 10
create sequence sample_seq  
    increment by 10          -- ������ 
    start with 10;           -- �ʱⰪ
    
-- �������� ������ ����ϴ� ������ ����
select * from user_sequences;

select sample_seq.nextval from dual; -- �������� ���� ���� ���
select sample_seq.currval from dual; -- ���� �������� ���� ���

-- �ʱⰪ : 2, ���� �� : 2
create sequence sample_seq2
    increment by 2
    start with 2
    nocache;            -- ĳ���� ������� �ʰڴ�. (RAM)  -- ������ ���ϸ� �ٿ��� �� �ִ�.
    
select sample_seq2.nextval from dual;
select sample_seq2.currval from dual;

-- �������� Primary Key�� �����ϱ�

create table dept_copy80
as
select * from department
where 0=1;

select * from dept_copy80;

-- ������ ���� : �ʱⰪ : 10, ������ : 10
create sequence dept_seq
    increment by 10
    start with 10
    nocache ;    
    

    
    /* Sequence �� cache�� ����ϴ� ��� / ������� �ʴ� ��� */
        -- cache : ������ ������ ��� �ϱ� ���ؼ� ��� ( �⺻�� : 20��)
        -- ������ �ٿ�� ��� : ĳ���� �ѹ����� ��� ����. ���ο� ���� �Ҵ� �޴´�.       
        
    
insert into dept_copy80 (dno, dname, loc)
values (dept_seq.nextval, 'HR', 'SEOUL');

select * from dept_copy80;

create sequence emp_seq_no 
    increment by 1
    start with 1
    nocache;
    
create table emp_copy80
as
select * from employee
where 0=1;

select * from emp_copy80;

-- �������� ���̺��� Ư�� �÷��� ����

insert into emp_copy80
values ( emp_seq_no.nextval, 'SMITH', 'SALESMAN', 2222, sysdate, 3000, 300, 20);


-- ������ ������ ����

select * from user_sequences;

alter sequence emp_seq_no
    maxvalue 1000;          -- �ִ밪 : 1000
    
alter sequence emp_seq_no
    cycle;                   -- �ִ밪�� ����ǰ� �ٽ� ó������ ��ȯ
    
alter sequence emp_seq_no
    nocycle;
    
select * from user_sequences;    
    
drop sequence SAMPLE_SEQ;
    
/*
    INDEX : ���̺��� �÷��� ����, Ư�� �÷��� �˻��� ������ ����� �� �ֵ��� �Ѵ�.
        - INDEX Page : �÷��� �߿� Ű���带 �ɷ��� ��ġ ������ ��Ƴ��� �������� INDEX Page�� �Ѵ�.
            - DB������ 10% 
        - ����(index) : å�� ����, å�� ������ �߿� Ű���带 �����ؼ� ��ġ�� �˷���.
        - ���̺� ��ĵ  : ���ڵ��� ó�� ~ ���������� �˻� (�˻� �ӵ��� ������.), �ε����� ������� �ʰ� �˻�.
            -- Index�� �����Ǿ� ���� �ʴ� �÷��� ���̺� ��ĵ�� �Ѵ�.
        - Primary Key, Unique Ű�� ����� �÷��� index page �� �����Ǿ� �˻��� ������ �Ѵ�.
        - Where ������ ���� �˻��� �ϴ� �÷��� Index �� ����.
        - ���̺��� �˻��� �����ϴ� �÷��� Index����, ���̺� ��ĵ�� ���� �ʰ� 
            Index Page�� �˻��ؼ� ��ġ�� ������ ã�´�.
        - Index �� ������ �� ���ϰ� ���� �ɸ���. �ַ� �����ð��� ���ؼ� �߰��� ������.
        - Index�� �� �����ؾ� �Ѵ�.
            
    
*/

-- index ������ ����Ǿ� �ִ� ������ ���� . 
    -- user_column, user_ind_columns
    
select * from user_tab_columns;
select * from user_ind_columns;

select * from user_tab_columns
where table_name in ('EMPLOYEE', 'DEPARTMENT');
    
select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMPLOYEE', 'DEPARTMENT');

select * from employee;     -- ENO �÷��� Primary Key  ==> �ڵ����� Index �� ������.


/*
    index �ڵ� ����, (Primary Key, Unique ) �÷����� Index Page�� �ڵ����� �����ȴ�.
*/

create table tbl1 (
    a number (4) constraint PK_tbl1_a Primary Key,
    b number (4),
    c number (4)
    );
    
select index_name, table_name, column_name
from user_ind_columns
where table_name in ('TBL1','TBL2','EMPLOYEE', 'DEPARTMENT');

select * from tbl1;
    
create table tbl2 (
    a number (4) constraint PK_tbl2_a Primary Key, 
    b number (4) constraint UK_tbl2_b Unique,
    c number (4) constraint UK_tbl2_c unique,
    d number (4),
    e number (4)
    );    
select * from tbl2;

create table emp_copy90
as
select * from employee;

select * from emp_copy90;
    
select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP_COPY90');

select * from emp_copy90
where ename = 'KING';           -- ename �÷��� index�� �����Ƿ� KING�� �˻��ϱ� ���ؼ� ���̺� ��ĵ�Ѵ�.

select * from emp_copy90
where job = 'SALESMAN';


-- ename �÷��� index �����ϱ�. (�߰��� �۾��ؾ� �Ѵ�. ���ϰ� ���� �ɸ���.)

-- �÷��� index�� �����Ǿ� ���� ������ ���̺� ��ĵ�� �Ѵ�. ó������ �ϳ��ϳ� �˻��Ѵ�.
-- �÷��� index�� �����Ǿ� ������ Index Page (å�� ����)�� �˻��Ѵ�. ������ �˻��Ѵ�.

create index id_emp_ename
on emp_copy90(ename);

drop index id_emp_ename;

/*
    Index�� �ֱ������� REBUILD ����� �Ѵ�. , (1����, 1��)
        - Index�� �������� (Insert, update, delete) ����ϰ� �Ͼ�� 
    
*/

-- Index REBUILD�� �ؾ��ϴ� ���� ��� :
--          Index�� Tree ���̰� 4�̻��� ��찡 ��ȸ�Ǹ� Rebuild �� �ʿ䰡 �ִ�.

SELECT I.TABLESPACE_NAME,I.TABLE_NAME,I.INDEX_NAME, I.BLEVEL,
       DECODE(SIGN(NVL(I.BLEVEL,99)-3),1,DECODE(NVL(I.BLEVEL,99),99,'?','Rebuild'),'Check') CNF
FROM   USER_INDEXES I
WHERE   I.BLEVEL > 4
ORDER BY I.BLEVEL DESC;

-- Index rebuild : 

alter index id_emp_ename rebuild;   -- index �� ���Ӱ� ����.

select * from emp_copy90;

/*
    Index �� ����ؾ� �ϴ� ��� 
        1. ���̺��� ��(�ο�, ���ڵ�)�� ������ ���� ���
        2. where ������ ���� ���Ǵ� �÷�.
        3. Join �� ���Ǵ� Ű �÷�.
        4. �˻� ����� ���� ���̺� �������� 2% 4% ���� �Ǵ� ���
        5. �ش� �÷��� null�� �����ϴ� ��� (������ null�� ����)
        
        
    Index �� ����ϸ� ������ ���
        1. ���̺��� ���� ������ ���� ���.
        2. �˻� ����� ���� ���̺��� ���� ������ �����ϴ� ���
        3. insert, update, delete �� ����ϰ� �Ͼ�� �÷�.
*/

/*
    index ����
        1. ���� �ε��� (Unique Index) : �÷��� �ߺ����� �ʴ� ������ ���� ���� Index (Primary Key, Unique)
        2. ���� �ε��� (Single Index) : �� �÷��� �ο��Ǵ� Index 
        3. ���� �ε��� (Composite Index) : ���� �÷��� ��� ������ Index
        4. �Լ� �ε��� (Function Base Index) : �Լ��� ������ �÷��� ������ Index
        
*/
select * from emp_copy90;

-- ���� �ε��� ����.
create index inx_emp_copy90_salary
on emp_copy90 (salary);

-- ���� �ε��� ���� : �� �÷��̻��� �����ؼ� �ε��� ����.

create table dept_copy91
as
select * from department;

create index idx_dept_copy91_dname_loc
on dept_copy91 (dname, loc);

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('DEPT_COPY91');

-- �Լ� ��� �ε��� : �Լ��� ������ �÷��� �ο��Ǵ� index

create table emp_copy91
as
select * from employee;

create index idx_empcopy91_allsal
on emp_copy91 (salary * 12);        -- �÷��� �Լ�, ������ ������ �ε���.


/*  �ε��� ���� */

drop index idx_empcopy91_allsal;

/* ���� ����
    
    ������ : DBMS�� ���� ���� ���
        - �� ����ں��� ������ ���� : DBMS�� ������ �� �ִ� ����ڸ� ����.
            (���� (Authentication : Credetial ( Identity + Password ) Ȯ��
            (�㰡 (Authorization : ������ ����ڿ��� Oracle�� �ý��� ����, ��ü (���̺�, ��, Ʈ����, �Լ�) ����
                - System Privileges : ����Ŭ�� �������� ���� �Ҵ�
                - Object Privileges : ���̺�, ��, Ʈ����, �Լ�, �������ν���, ������, �ε��� ) ���� ����.
*/

-- Oracle ���� ���� ����. ( �Ϲ� ���������� ������ ������ �� �ִ� ������ ����. )
show user;
create user usertest01 identified by 1234;




