Create table guestboard(
    name varchar2(100),
    email varchar2(100),
    inputdate varchar2(100) primary key,
    subject varchar2(100),
    content varchar2(2000)
    );
    
    drop table guestboard;
    
    desc guestboard;
    select * from guestboard;
    
    delete guestboard where name = '����';    
    commit;   
    
    select * from guestboard order by name;
    
    create table guestboard2(
	name varchar2(100),
	email varchar2(100),
	inputdate varchar2(100) primary key,
	subject varchar2(100),
	content varchar2(2000)
	);
    
    select * from guestboard2;
    rollback;
    commit;
    desc guestboard2;
    select * from guestboard2 order by inputdate desc;
    
    insert into guestboard2 (name,email,inputdate,subject,content) values('�ϴ�','','2022. 5. 16. ���� 11:37:52','�ϴ���','�ϴû� ');
	commit;
    
    delete guestboard2 where name = 'null';
    
    
    