show user;

-- �ְ� ������ ���� (sys) : ������ ������ �� �ִ� ������ ������ �ִ�.

-- ���̵� : usertest01 , ��ȣ : 1234
create user usertest01 identified by 1234;

-- ������ ��ȣ�� �����ߴٰ� �ؼ� ����Ŭ�� ������ �� �ִ� ������ �ο� �޾ƾ� ���� ����

-- System Privileges : 
    -- Create Session : ����Ŭ�� ���� �� �� �ִ� ����.
    -- Create Table : ����Ŭ���� ���̺��� ������ �� �ִ� ����.
    -- Create Sequence : ������ ������ �� �ִ� ����.
    -- Create view : �並 ������ �� �ִ� ����.
    
-- ������ �������� ����Ŭ�� ������ �� �ִ� Create Session ������ �ο�.    

DDL : ��ü ���� (Create, Alter, drop)
DML : ���ڵ� ���� (Insert, update,delete)
DQL : ���ڵ� �˻� (Select)
DTL : Ʈ����� ( Begin transaction, rollback, commit)
DCL : ���Ѱ��� ( Grant, Revoke, Deny )

-- ������ �������� ����Ŭ�� ������ �� �ִ� Create Session ������ �ο�.
-- grant �ο��� ���� to ������
grant create session to usertest01;

-- ����Ŭ�� �����ߴٶ���ؼ� ���̺��� ������ �� �ִ� ������ ����.
grant create table to usertest01;

/* ���̺� �����̽� (Table Space) : ��ü ( ���̺�, ��, ������, �ε���, Ʈ����, �������ν���, �Լ�...)
    �� �����ϴ� ����.  ������ �������� �� ����ں� ���̺� �����̽��� Ȯ��.
    SYSTEM : DBA (������ ���������� ���� ����)
*/
select * from dba_users;    -- dba_ : sys (�ְ� ������ �������� Ȯ��)

select username, default_tablespace as DataFile , temporary_tablespace as LogFile
from dba_users
where username in ('HR', 'USERTEST01');

-- �������� ���̺� �����̽� ���� (SYSTEM ==> USERS) ����,
alter user usertest01
default tablespace users    --DataFile ���� : ��ü�� ����Ǵ� ���� (���̺�,��,Ʈ����,�ε���...)
temporary tablespace temp;  -- LOG �� ���� : DML ( Insert, Update, Delete)
                            -- LOG �� ȣĪ�Ҷ� Trasaction Log. �ý����� ���� �߻��� ��������� �ƴ϶� ������ �������� ����

-- ���̺� �����̽� : ��ü�� Log�� �����ϴ� �������� ����
    -- DataFile : ��ü�� �����ϰ� �ִ�. (���̺�, ��, �ε���...)
    -- Log : Transation Log �� ����
    
    -- DataFile �� Log ������ ���������� �ٸ� �ϵ������ �����ؾ� ������ ���� �� �ִ�.
        -- RAID �� ������ �����ϸ� ������ ���� �� �ִ�.




-- �������� Users ���̺� �����̽��� ����� �� �ִ� ���� �Ҵ�. ( users ���̺� �����̽��� 2mb�� ��� �����Ҵ�)
alter user usertest01
quota 2m on users;

-----------------------------------------------
-- ���� : usertest02 ������ ���� �Ŀ� users ���̺� �����̽����� ���̺� (tbl2) ������ insert.

create user usertest02 identified by 1234;

grant create session to usertest02;
grant create table to usertest02;

select username, default_tablespace as DataFile, temporary_tablespace as LogFile
from dba_users
where username in ('HR', 'USERTEST02');

alter user usertest02
default tablespace users
temporary tablespace temp;

alter user usertest02
quota 2m on users;

select * from all_tables    -- ���̺��� �����ָ� ����� �ش�. �������� ������ ���̺��� ����� �� �ִ�.
where owner in ('HR', 'USERTEST01', 'USERTEST02');


==================================================================
������ : wine_account
��ȣ : 1234

�⺻ ���̺� �����̽� : WINE_DATAFILE     100MB 100MB ���� ������ ���� <== A HDD
�ӽ� ���̺� �����̽� : WINE_LOG          100MB 100MB ���� 1GB  <== B HDD

���̺� 10�� ���� �� : �� ���̺��� �� ( ���ڵ� : 3���� �߰�)
===================================================================

create table sale(
    sale_date date not null constraint PK_sale_sale_date primary key,
    wine_code varchar2(6) not null constraint FK_sale_wine_code foreign key (wine_code) references wine(wine_code),
    mem_id varchar2(30) not null constraint FK_sale_sale_mem_id foreign key (mem_id) references member(mem_id),
    sale_amount varchar2(5) not null default 0,
    sale_price varchar2(6) not null default 0,
    sale_tot_price varchar(15) not null default 0
    );
    
    
create table member(
    mem_id varchar2(6) not null constraint PK_member_mem_id primary key,
    mem_grade varchar2(20) constraint FK_member_mem_grade foreign key (mem_grade) references grade_pt_rade(mem_grade),
    mem_pw varchar2(20) not null,
    mem_birth date not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) not null
    );
    
    
create table grade_pt_rade (
    mem_grade varchar2(20) not null constraint PK_grade_pt_rade_mem_grade primary key,
    grade_pt_rate number(3,2)
    );
    

create table today (
    today_code varchar2(6) not null constraint PK_today_today_code primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
    );
    
    
create table nation (
    nation_code varchar2(26) not null constraint PK_nation_nation_code primary key,
    nation_name varchar2(50) not null
    );
    
    
create table wine (
    wine_code varchar2(26) not null PK_wine_wine_code primary key,
    wine_name varchar2(100) not null,
    wine_url blob,
    nation_code varchar(6) constraint 
    
    


grant create table to public;








