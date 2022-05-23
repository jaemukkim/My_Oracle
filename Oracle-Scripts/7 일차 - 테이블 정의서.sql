-- ���̺� ���Ǽ�

-- 1
create table member(
    id varchar2(20) not null constraint PK_member_id Primary key,
    pwd varchar2(20) ,
    name varchar2(50),
    zipcode varchar2(7),
    addrres varchar2(20),
    tel varchar2(13),
    indate date default sysdate,
    constraint FK_member_id_tb_zipcode foreign key (zipcode) references tb_zipcode (zipcode)
    );
    select * from member;
    
insert into member
values ('addd','pwd','kjm','1223','@12343','02-000000',sysdate);
insert into member
values ('1abd','pwd','kjm','bbb','@12343','02-000000',sysdate);
insert into member
values ('ad123d','pwd','kjm','ccc','@12343','02-000000',sysdate);
insert into member
values ('ad123','pwd123456677666899','kjm','ddd','@12343','02-000000',sysdate);
select * from member;
-- 2
create table tb_zipcode(
    zipcode varchar2(7) not null constraint PK_tb_zipcode_zipcode primary key,
    sido varchar2(30) ,
    gugum varchar2(30),
    dong varchar2(30),
    bungi varchar2(30)
    );
    
insert into tb_zipcode
values ('1223','2222','3333','4444','5555');
insert into tb_zipcode
values ('bbb','����','��','��굿','237');
insert into tb_zipcode
values ('ccc','����','Ư����','������','1234');
insert into tb_zipcode
values ('ddd','����','Ư����','������','1235');


select * from tb_zipcode;
desc tb_zipcode;

-- 3 
create table products(
    product_code varchar2(20) not null constraint PK_products_product_code primary key,
    product_name varchar2(100),
    product_kind char(1),
    product_price1 varchar2(10),
    product_price2 varchar2(10),
    product_content varchar2(1000),
    product_image varchar2(50),
    sizeSt varchar2(5),
    sizeEt varchar2(5),
    product_quantity varchar2(5),
    useyn char(1),
    indate date
    );
    
insert into products
values ('1111','��ǰ',1,'1000','2000','1234','image','big','high','good',1,sysdate);
insert into products
values ('2222','��ǰ',2,'3000','4000','9999','image','big','high','good',2,sysdate);
insert into products
values ('3333','��ǰ',3,'4000','7000','8888','image','big','high','good',3,sysdate);

select * from products;

-- 4
create table orders(
    o_seq number(10) not null constraint  PK_orders_o_seq primary key,
    product_code varchar2(20),
    id varchar2(16),
    product_size varchar2(5),
    quantity varchar2(5),
    result char(1),
    indate date,
    constraint  FK_orders_product_code foreign key (product_code) references member product_code,
    constraint  FK_orders_id_member foreign key (id) references member (id)
    );

select * from orders;

    
----------------------------------------------------------------------------------------
/*
    Foreign Key�� �����Ǵ� ���̺� ������
        1. �ڽ� ���̺��� ���� ���� �� �θ� ���̺� ����
        2. Foreign Key ���� ������ ��� ������ ���̺� ����
        3. cascade constraints �ɼ����� ���̺��� ���� ����

*/


-- ���̺� ������ ���� ���� : �ٸ� ���̺��� Foreign key�� �ڽ��� ���̺��� �����ϰ� ������ ������ �ȵȴ�.
    -- �ٸ� ���̺��� ���� �ϰ� �ִ��� ������ �����ϴ� �ɼ� : cascade
drop table orders;
drop table member;       -- ���� �߻� : orders ���̺��� id �÷��� member ���̺��� id �÷��� �����ϰ� �ִ�.
drop table tb_zipcode;   -- ���� �߻� : member ���̺��� zipcode �÷��� tb_zipcode ���̺��� zipcode �÷��� �����ϰ� �ִ�.
drop table products;

-- ���� ���� �����Ŀ� ���̺� ����. (Foreign Key)
alter table member
drop constraint FK_MEMBER_ID_TB_ZIPCODE;

alter table orders
drop constraint FK_ORDERS_ID_MEMBER;

alter table orders
drop constraint FK_ORDERS_PRODUCT_CODE;

-- ���� ���� Ȯ��
select * from user_constraints
where table_name = 'ORDERS';


drop table member ;

-- cascade constraints �ɼ��� ����ؼ� ����, <== Foreign Key ���� ������ ���� ������ ����.

drop table member cascade constraints ;
drop table tb_zipcode cascade constraints;
drop table products cascade constraints;
drop table Orders cascade constraints;



-- ���̺� ������(Foreign Key) : �θ����̺� (FK ���� ���̺�) �� ���� �����ؾ� �Ѵ�. �ڽ����̺� ����.
    -- �ڽ� ���̺��� ������ �� FK�� ���� �ʰ� ���� ��, �θ����̺� ������, Alter table �� ����ؼ� ���߿� FK�� �־��ش�.
    

----------���̺� ���� ------------
CREATE TABLE tb_zipcode(
    zipcode VARCHAR2(7) NOT NULL CONSTRAINT PK_tb_zipcode_zipcode PRIMARY KEY,
    sido VARCHAR2(30),
    gugum VARCHAR2(30),
    dong VARCHAR2(30),
    bungi VARCHAR2(30)
    );
    
    
CREATE TABLE member(
    id VARCHAR(20) NOT NULL CONSTRAINT PK_member_id PRIMARY KEY,
    pwd VARCHAR(20),
    name VARCHAR(20),
    zipcode VARCHAR(7), CONSTRAINT FK_member_zipcode_tb_zipcode FOREIGN KEY (zipcode) REFERENCES tb_zipcode(zipcode)
    );

CREATE TABLE products (
    product_code VARCHAR2(20) NOT NULL CONSTRAINT PK_products_product_code PRIMARY KEY,
    product_name VARCHAR2(100),
    product_kind CHAR(1),
    product_price1 VARCHAR2(10),
    product_price2 VARCHAR2(10),
    product_content VARCHAR2(1000),
    product_image VARCHAR2(50),
    sizeSt VARCHAR2(5),
    sizeEt VARCHAR2(5),
    product_quantity VARCHAR2(5),
    useyn CHAR(1),
    indate DATE
    );
    
    CREATE TABLE orders(
    o_seq NUMBER(10) NOT NULL CONSTRAINT PK_orders_o_seq PRIMARY KEY,
    product_code VARCHAR2(20), CONSTRAINT FK_orders_product_code FOREIGN KEY (product_code) REFERENCES products(product_code),
    id VARCHAR2(16), CONSTRAINT FK_orders_id_member FOREIGN KEY (id) REFERENCES member(id),
    product_size VARCHAR2(5),
    quantity VARCHAR2(5),
    result CHAR(1),
    indate DATE
    );
    
    
    
    
-- zip.sql ����� ���� ���̺�� �ٸ� ���� �����ؼ� insert �Ͻÿ�.

-- Ʈ����� �߻� : DML : insert, update, delete  <== commit

select * from tb_zipcode;

-- 1. ���� �÷� �߰�
alter table tb_zipcode
add zip_seq varchar2(30);

-- 2. �÷� �̸� ����.
alter table tb_zipcode
rename column bungi to bunji;

alter table tb_zipcode
rename column gugum to gugun;

--3. ������ �ڸ��� �÷��ֱ�
alter table tb_zipcode
modify ZIPCODE varchar2(100);

alter table tb_zipcode
modify DONG varchar2(100);

-- ���� ���� ��� ��Ȱ��ȭ �ϱ�. (��� ��Ȱ��ȭ)  
    --      ==> Bulk Insert (�뷮���� Insert) : ���� �������� ���ؼ� insert �Ǵ� �ӵ��� ������ ����.
    
    
alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode;    -- ���� �߻� : member ���̺��� zipcode �÷��� �����ϰ� �ִ�.

alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode cascade;    -- Member ���̺��� FK �� ����� �������ǵ� �Բ� disable

select constraint_name, table_name, status  from user_constraints
where table_name in ('MEMBER' , 'TB_ZIPCODE');

select count(*) from tb_zipcode;

select * from tb_zipcode;

truncate table tb_zipcode;  -- ������ ���ڵ常 ��� ���� (������ ��� ���ڵ� ����)

delete tb_zipcode;      -- ������ ���ڵ常 ��� ���� (������ ������ - �뷮�� ���)
commit;

-- ���� ���� Ȱ��ȭ �ϱ�

alter table member
enable novalidate constraint FK_member_zipcode_tb_zipcode;

alter table tb_zipcode
enable novalidate constraint PK_tb_zipcode_zipcode;

select constraint_name, table_name, status from use_constraints
where table_name in ( 'MEMBER', 'TB_ZIPCODE');


-- zip_seq �÷��� ������ ����� �ȵ� ����, ����� ���� �ǵ���
    -- ���� ���� �������� ��µ�, to_number �� ���ڷ� ����ȯ �� ����

select * from tb_zipcode
order by to_number (zip_seq, 9999999) asc;

truncate table tb_zipcode;


desc tb_zipcode;

select * from tb_zipcode;


    
    