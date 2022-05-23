
create table mvcboard(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(50),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
    );
    
create sequence seq_board_num
    increment by 1
    start with 1
    nocache;
    
-- 더미 데이터 입력 (5개 정도 값 입력)
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.', '내용1', '1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.', '내용2', '1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.', '내용3', '1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.', '내용4', '1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.', '내용5', '1234');
commit;

select * from mvcboard;

desc mvcboard;

-- DB에서 특정 레코드만 출력할 때 (검색 없이 출력)

SELECT * FROM ( 
SELECT Tb.*, ROWNUM rNum FROM ( 
SELECT * FROM mvcboard  ORDER BY idx DESC ) Tb  )
WHERE rNum BETWEEN 5 AND 6;

-- 검색 기능을 사용해서 출력할 때

SELECT * FROM (
SELECT Tb.*, ROWNUM rNum FROM (
SELECT * FROM mvcboard  WHERE title LIKE '%제목%' 
ORDER BY idx DESC) Tb  )  
WHERE rNum BETWEEN 1 AND 2;

desc mvcboard;

select * from mvcboard
where idx = 5;

select count(*) from mvcboard
where pass = '1234' and idx = 1;
        
        



