--- 10 일차 테이블 정의서 - 와인




==================================================================
계정명 : wine_account
암호 : 1234

기본 테이블 스페이스 : WINE_DATAFILE     100MB 100MB 증가 무제한 증가 <== A HDD
임시 테이블 스페이스 : WINE_LOG          100MB 100MB 증가 1GB  <== B HDD

테이블 10개 생성 후 : 각 테이블의 값 ( 레코드 : 3개씩 추가)
===================================================================

create table sale(
    sale_date date not null default 0 constraint PK_sale_sale_date primary key,
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
    
insert into grade_pt_rade
values ('MVP', '1.1');
    

create table today (
    today_code varchar2(6) not null constraint PK_today_today_code primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
    );

insert into today
values ('t1234','1','2','3');
    
    
create table nation (
    nation_code varchar2(26) not null constraint PK_nation_nation_code primary key,
    nation_name varchar2(50) not null
    );

insert into nation
values ('n1234' , '한국');
    
    
create table wine (
    wine_code varchar2(26) not null PK_wine_wine_code primary key,
    wine_name varchar2(100) not null,
    wine_url blob,
    nation_code varchar2(6) constraint FK_wine_nation_code foreign key (nation_code) references nation_table(nation_code),
    wine_type_code varchar2(6)constraint FK_wine_wine_type_code foreign key (wine_type_code) references wine_type(wine_type_code),
    wine_sugar_code number(2),
    wine_price number(15) not null default 0,
    wine_vintage date,
    theme_code varchar2(6) constraint FK_wine_theme_code foreign key theme_code references theme(theme_code),
    today_code varchar2(6) constraint FK_wine_today_code foreign key today_code references today(today_code)
    );
    
    
create table theme (
    theme_code varchar2(6) not null constraint PK_theme_theme_code primary key,
    theme_name varchar2(50) not null
    );
    
insert into theme
values ('1234', '테마');
    

create table stock_management (
    stock_code varchar2(6) not null constraint PK_stock_management_stock_code Primary key,
    wine_code varchar2(6) constraint FK_stock_management_wine_code foreign key (wine_code) references wine(wine_code),
    manager_id varchar2(30) constraint FK_stock_management_manager_id foreign key (manager_id) references manager(manager_id),
    stock_amount number(5) not null defatult 0
    );
    
    
create table manager (
    manager_id varchar2(3) not null constraint PK_manager_manager_id primary key,
    manager_pwd varchar2(20) not null,
    manager_tel varchar2(20) 
    );
    
insert into manager
values ('aaa','pwd','000-0000-0000');
    
    
    
create table wine_type (
    wine_type_code varchar2(6) not null constraint PK_wine_type_wine_type_code primary key,
    wine_type_name varchar2(50)
    );
    
insert into wine_type
values ('1111', '위스키');
    
    
    
    
    
