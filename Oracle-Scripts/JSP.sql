
-- ȸ�� ������ �����ϴ� ���̺�
create table mbTbl (
    idx number not null,    -- ������ ����, �ڵ� ���� �÷�.
    id varchar2(100) not null,
    pass varchar2(100) not null,
    name varchar2(100) not null,
    email varchar2(100) not null,
    city varchar2(100) null,
    phone varchar2(100) null );
    
select * from mbTbl;

alter table mbTbl
add constraint mbTbl_id_PK primary key (id);

create sequence seq_mbTbl_idx
    increment by 1
    start with 1 
    nocache;
    
/* ���� ������ �Է� */
insert into mbTbl (idx, id, pass, name, email, city, phone)
values ( seq_mbTbl_idx.nextval, 'admin', '1234', '������', 'kosmo@kosmo.com', '����', '010-1111-1111');

commit;