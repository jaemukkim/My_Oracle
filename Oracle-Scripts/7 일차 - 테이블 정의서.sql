-- 테이블 정의서

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
values ('bbb','서울','시','당산동','237');
insert into tb_zipcode
values ('ccc','서울','특별시','영등포','1234');
insert into tb_zipcode
values ('ddd','서울','특별시','영등포','1235');


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
values ('1111','상품',1,'1000','2000','1234','image','big','high','good',1,sysdate);
insert into products
values ('2222','상품',2,'3000','4000','9999','image','big','high','good',2,sysdate);
insert into products
values ('3333','상품',3,'4000','7000','8888','image','big','high','good',3,sysdate);

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
    Foreign Key로 참조되는 테이블 삭제시
        1. 자식 테이블을 먼저 삭제 후 부모 테이블 삭제
        2. Foreign Key 제약 조건을 모두 제거후 테이블 삭제
        3. cascade constraints 옵션으로 테이블을 강제 삭제

*/


-- 테이블 삭제시 주의 사항 : 다른 테이블에서 Foreign key로 자신의 테이블을 참조하고 있으면 삭제가 안된다.
    -- 다른 테이블이 참조 하고 있더라도 강제로 삭제하는 옵션 : cascade
drop table orders;
drop table member;       -- 오류 발생 : orders 테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하고 있다.
drop table tb_zipcode;   -- 오류 발생 : member 테이블의 zipcode 컬럼이 tb_zipcode 테이블의 zipcode 컬럼을 참조하고 있다.
drop table products;

-- 제약 조건 제거후에 테이블 삭제. (Foreign Key)
alter table member
drop constraint FK_MEMBER_ID_TB_ZIPCODE;

alter table orders
drop constraint FK_ORDERS_ID_MEMBER;

alter table orders
drop constraint FK_ORDERS_PRODUCT_CODE;

-- 제약 조건 확인
select * from user_constraints
where table_name = 'ORDERS';


drop table member ;

-- cascade constraints 옵션을 사용해서 삭제, <== Foreign Key 제약 조건을 먼저 제거후 삭제.

drop table member cascade constraints ;
drop table tb_zipcode cascade constraints;
drop table products cascade constraints;
drop table Orders cascade constraints;



-- 테이블 생성시(Foreign Key) : 부모테이블 (FK 참조 테이블) 을 먼저 생성해야 한다. 자식테이블 생성.
    -- 자식 테이블을 생성할 때 FK를 넣지 않고 생성 후, 부모테이블 생성후, Alter table 을 사용해서 나중에 FK를 넣어준다.
    

----------테이블 설계 ------------
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
    
    
    
    
-- zip.sql 적용시 실제 테이블과 다른 점을 수정해서 insert 하시오.

-- 트랜잭션 발생 : DML : insert, update, delete  <== commit

select * from tb_zipcode;

-- 1. 누락 컬럼 추가
alter table tb_zipcode
add zip_seq varchar2(30);

-- 2. 컬럼 이름 변경.
alter table tb_zipcode
rename column bungi to bunji;

alter table tb_zipcode
rename column gugum to gugun;

--3. 부족한 자리수 늘려주기
alter table tb_zipcode
modify ZIPCODE varchar2(100);

alter table tb_zipcode
modify DONG varchar2(100);

-- 제약 조건 잠시 비활성화 하기. (잠시 비활성화)  
    --      ==> Bulk Insert (대량으로 Insert) : 제약 조건으로 인해서 insert 되는 속도가 굉장히 느림.
    
    
alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode;    -- 오류 발생 : member 테이블의 zipcode 컬럼이 참조하고 있다.

alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode cascade;    -- Member 테이블의 FK 가 적용된 제약조건도 함께 disable

select constraint_name, table_name, status  from user_constraints
where table_name in ('MEMBER' , 'TB_ZIPCODE');

select count(*) from tb_zipcode;

select * from tb_zipcode;

truncate table tb_zipcode;  -- 기존의 레코드만 모두 제거 (빠르게 모든 레코드 삭제)

delete tb_zipcode;      -- 기존의 레코드만 모두 제거 (삭제가 느리다 - 대량일 경우)
commit;

-- 제약 조건 활성화 하기

alter table member
enable novalidate constraint FK_member_zipcode_tb_zipcode;

alter table tb_zipcode
enable novalidate constraint PK_tb_zipcode_zipcode;

select constraint_name, table_name, status from use_constraints
where table_name in ( 'MEMBER', 'TB_ZIPCODE');


-- zip_seq 컬럼이 정렬이 제대로 안된 이유, 제대로 정렬 되도록
    -- 문자 정렬 형식으로 출력됨, to_number 로 숫자로 형변환 후 정렬

select * from tb_zipcode
order by to_number (zip_seq, 9999999) asc;

truncate table tb_zipcode;


desc tb_zipcode;

select * from tb_zipcode;


    
    