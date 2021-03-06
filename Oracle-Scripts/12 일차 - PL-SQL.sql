12일차 - PL/SQL : 오라클에서 프로그래밍 요소를 적용한 SQL , 유연하게 처리해서 적용.
        MSQL : T-SQL 
    SQL : 구조화된 질의언어 ,  단점 : 유연한 프로그래밍 기능을 적용할 수 없다.
    
    
set serveroutput on     -- PL/SQL의 출력을 활성화

/* PL SQL의 기본 작성 구문 */

begin 
    -- PL/SQL 구문    
end;
/

-- PL/SQL에서 기본 출력

set serveroutput on
begin
    dbms_output.put_line('Welcome to Oracle');
end;
/

-- PL / SQL에서 변수 선언 하기.

    변수명 := 값
    
desc employee;

    -- 자료형 선언
        1.  Oracle 의 자료형을 사용.
        2. 참조 자료형 : 테이블의 컬럼의 선언된 자료형을 참조해서 사용.
            %type : 테이블의 특정컬럼의 자료형을 참조해서 사용. (테이블의 컬럼 1개 참조)
            %rowtype : 테이블 전체 컬럼의 자료형을 모두 참조해서 사용.
            
    
set serveroutput on 

declare     -- 변수 선언 (변수 선언부)
    v_eno number(4);                -- 오라클의 자료형
    v_ename employee.ename%type;    -- 참조 자료형 : 테이블의 컬럼의 자료형을 참조해서 적용.
begin 
    v_eno := 7788;      --  :=  변수의 값을 할당할 때 사용.
    v_ename := 'SCOTT';
    dbms_output.put_line('사원번호      사원이름');
    dbms_output.put_line('-------------------');
    dbms_output.put_line(v_eno  || '    ' || v_ename);
end;
/

    
/* 사원번호와 사원이름 출력 하기 */

set serveroutput on 

declare     -- 변수 선언 (변수 선언부)
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    
begin
    dbms_output.put_line('사원번호      사원이름');
    dbms_output.put_line('-------------------');
    
    select eno, ename into v_eno, v_ename
    from employee
    where ename = 'SCOTT';    
    
    dbms_output.put_line(v_eno  || '    ' || v_ename);
    
end;
/
    select eno, ename
    from employee
    where ename = 'SCOTT';

    /* PL/SQL 에서 제어문 사용하기 */

    /* If ~ End if 문 사용하기 */
    
    set serveroutput on
    declare
        v_employee employee%rowtype;    -- rowtype : employee 테이블의 모든 컬럼의 자료형을 참조해서 사용.
                                -- v_employee 변수는 employee 테이블의 모든 컬럼을 참조.
        annsal number (7,2);    -- 총 연봉을 저장하는 변수
    begin
        select * into v_employee
        from employee
        where ename = 'SCOTT';        
        if (v_employee.commission is null) then
            v_employee.commission := 0;
        end if;        
        annsal := v_employee.salary * 12 + v_employee.commission;    
        dbms_output.put_line('사원번호   사원이름   연봉');
        dbms_output.put_line('----------------------');
        dbms_output.put_line(v_employee.eno ||'   '|| v_employee.ename ||'   ' || annsal);
    end;
    /
    
    /*
        v_employee.eno := 7788
        v_employee.ename := 'SCOTT'
        v_employe.job := ANALYST
        v_employee.manager := 7566
        v_employee.hiredate := 87/07/13
        v_employee.salary := 3000
        v_employee.commission := null
        v_employee.dno := 20
    */
    
    
select * from employee
where ename = 'SCOTT';

/* PL/SQL 을 사용해서 department 테이블을 변수에 담아서 출력 해보세요. 
    조건은 dno = 20 을 변수에 담아서 출력
*/

 %type 사용 : 변수의 data type을 테이블의 컬럼 하나하나를 참조해서 할당.
set serveroutput on
declare 
    v_dno department.dno%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
    
begin
    select dno, dname, loc into v_dno, v_dname, v_loc
    from department
    where dno = 20;
        
        dbms_output.put_line('부서번호   부서명   위치');
        dbms_output.put_line('-------------------------');
        dbms_output.put_line(v.dno ||'   ' || v.dname ||'   '|| v.loc);
end;
/

 %rowtype 사용 : 테이블의 모든 컬럼을 참조해서 사용.
set serveroutput on
declare 
    v_department department%rowtype;
    
begin
    select dno, dname, loc into v_department
    from department
    where dno = 20;
        
        dbms_output.put_line('부서번호   부서명   위치');
        dbms_output.put_line('-------------------------');
        dbms_output.put_line(v_department.dno ||'   ' || v_department.dname ||'   '|| v_department.loc);
end;
/

/* IF ~ ELSIF ~ END IF */

set serveroutput on
declare
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    v_dname department.dname%type := null;
begin 
    select eno, ename, dno into v_eno, v_ename, v_dno
    from employee
    where ename = 'SCOTT';
    
    if (v_dno = 10) then
        v_dname := 'ACCOUNT';
    elsif (v_dno = 20) then
        v_dname := 'RESERACH';
    elsif (v_dno = 30) then
        v_dname := 'SALES';
    elsif (v_dno = 40) then
        v_dname := 'OPERATIONS';
    end if; 
    
    dbms_output.put_line('사원번호   사원명   부서명');
    dbms_output.put_line('-----------------------');
    dbms_output.put_line(v_eno ||'   '|| v_ename ||'   ' || v_dname);
end;
/

/* employee 테이블의 eno, ename, salary, dno 을 PL/SQL 을 사용해서 출력
    조건 commission 1400인 것에 대해서 */
    
1. %type    

set serveroutput on
declare 
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_dno employee.dno%type;  
    v_commission employee.commission%type;

begin
    select eno,ename,salary,dno,commission into v_eno, v_ename, v_salary, v_dno, v_commission
    from employee
    where commission = 1400;
    
    dbms_output.put_line('사원번호   사원명   월급   부서번호   보너스');
    dbms_output.put_line('--------------------------------------');
    dbms_output.put_line(v_eno ||'   '|| v_ename ||'   '|| v_salary ||'    ' || v_dno || '    ' || v_commission);
end;
/   
    

2.%rowtype

set serveroutput on
declare 
        v_employee employee%rowtype;
begin
    select * into v_employee
    from employee
    where commission = 1400;
    
    dbms_output.put_line('사원번호   사원명   월급   부서번호 ');
    dbms_output.put_line('------------------------------');
    dbms_output.put_line(v_employee.eno ||'   '|| v_employee.ename ||'   '|| v_employee.salary ||'   ' || v_employee.dno);
end;
/


/* 커서 (cursor) : PL/SQL에서 select 한 결과가 단일 레코드가 아니라 레코드 셋인 경우, 커서가 필요하다.
*/
declare
  cursor 커서명            1. 커서 선언
  is
  커서를 부착할 select 구문
begin
  open 커서명 ;            2. 커서 오픈
  loop
    fetch 구문             3. 커서를 이동하고 출력
  end loop;
  close 커서명;            4. 커서를 종료.
end;
    
    
  end loop;
  close 커서명;

end;
/

/* 커서를 사용해서 department 테이블의 모든 내용을 출력 하기 */

set serveroutput on 
declare
    v_dept department%rowtype;      -- 변수 선언
    cursor c1                       -- 1. 커서 선언
    is
    select * from department;
    
begin
    dbms_output.put_line('부서번호   부서명   부서위치');
    dbms_output.put_line('------------------------');
    open c1;                        -- 2. 커서 오픈
    loop 
        fetch c1 into v_dept.dno, v_dept.dname, v_dept.loc;
        exit when c1%notfound;
        dbms_output.put_line(v_dept.dno ||'   '|| v_dept.dname ||'   '|| v_dept.loc);
    end loop;
    close c1;                       -- 4. 커서 종료
    
end;
/

/* 커서의 속성을 나타내는 속성값 
 커서명%notfound : 커서영역 내의 모든 자료가 FETCH 되었다면 true
 커서명%found  : 커서영역 내의 FETCH 되지않는 자료가 존재하면 true
 커서명%isopen : 커서가 오픈되었다면 true
 커서명%rowcount : 커서가 얻어온 레코드 개수
*/
/*
    사원명, 부서명, 부서위치, 월급을 출력하세요. PL/SQL
*/

set serveroutput on
declare 
    v_ename employee.ename%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
    v_salary employee.salary%type;
    cursor cc1
    is 
    select ename, dname, loc, salary from employee e, department d
    where e.dno = d.dno;

begin
    dbms_output.put_line('사원명   부서명   부서위치   월급');
    dbms_output.put_line('-----------------------------');
    open cc1;
    loop 
        fetch cc1 into v_ename, v_dname, v_loc, v_salary;
        exit when cc1%notfound;
        dbms_output.put_line(v_ename ||'   '|| v_dname||'   '||v_loc||'   '||v_salary);
        end loop;
        close cc1;

end;
/

/* cursor for loop 문으로 커서를 사용해서 여러 레코드셋 출력하기.
    - open, close 를 생략해서 사용.
    - 한 테이블의 전체 내용을 출력할 때 사용.    
*/

set serveroutput on 

declare 
    v_dept department%rowtype;
    cursor c1                   --커서 선언
    is
    select * from department;
begin
    dbms_output.put_line('부서번호   부서명   지역명');
    dbms_output.put_line('----------------------');
    for v_dept in c1 loop
        dbms_output.put_line ( v_dept.dno ||'   ' || v_dept.dname ||'   '|| v_dept.loc);    
    end loop ;
    
end;
/

/*employee 테이블 모든내용을 cursor for loop 로 출력*/

set serverout on
declare
    v_emp employee%rowtype;
    cursor c1
    is
    select * from employee;
begin
    dbms_output.put_line('사원번호   사원명   직책   매니저   입사일   월급   보너스   부서번호');
    dbms_output.put_line('----------------------------------------------------------');
    for v_emp in c1 loop
    dbms_output.put_line(v_emp.eno||'   '||v_emp.ename||'   '||v_emp.job||'   '||v_emp.manager||'   '
                        ||v_emp.hiredate||'   '||v_emp.salary||'   '||v_emp.commission||'   '||v_emp.dno);
    end loop;
end;
/

/* employee 테이블의 사원번호, 사원명, 월급, 부서번호를  출력  월급이 2000이상 , 부서가 20,30 부서만 출력*/

set serverout on
declare
    v_emp employee%rowtype;
    cursor c1
    is
    select * from employee
    where salary > 2000 and dno = 20 or dno = 30;
begin
    dbms_output.put_line('사원번호   사원명   월급   부서번호');
    dbms_output.put_line('------------------------------');
    for v_emp in c1 loop
    dbms_output.put_line( v_emp.eno ||'   '||v_emp.ename||'   '||v_emp.salary||'   '||v_emp.dno);
    end loop;
end;
/

--------------------13 일차--------------------------------  
/*
    트리거 (Trigger) : 권총의 방아쇠 (트리거), 방아쇠를 당기면 총알이 발사됨.
        - 테이블에 부착되어 있다.
        - 테이블에 이벤트가 발생될때 자동으로 작동되는 프로그램 코드
        - 테이블에 발생되는 이벤트 (Insert, Update, Delete)        
        - 트리거에서 정의된 begin ~ end 사이의 문장이 실행됨.
        - before 트리거 : 테이블에서 트리거를 먼저 실행후 Insert, Update, Delete 가 적용.
        - after 트리거 : Insert, Update, delete 가 실행후 트리거를 실행.
        -- 예) 주문 테이블에 값을 넣었을때 배송 테이블에 자동으로 저장
        -- 예) 중요 테이블의 로그를 남길때도 사용됨.
        -- :new : 가상의 임시테이블, 트리거가 부착된 테이블에 새롭게 들어오는 레코드의 임시 테이블
        -- :old : 가상의 임시테이블, 트리거가 부착된 테이블에 삭제되는 레코드의 임시 테이블
        -- 트리거는 하나의 테이블에 총 3개까지 부착됨, (insert, update, delete)
*/  

-- 실습 테이블 2개 생성 : 테이블의 구조만 복사 (dept_original, dept_copy)
create table dept_original 
as
select * from department
where 0=1;

create table dept_copy
as
select * from department
where 0=1;

select * from dept_original;
select * from dept_copy;

-- 트리거 생성 (dept_original 테이블에 부착, insert 이벤트가 발생될때 자동으로 작동)

create or replace trigger tri_sample1
    -- 트리거가 부착될 테이블, 이벤트(Insert, update, delete), Before, After,
    after insert        -- insert 이벤트가 작동후 트리거가 작동 ( begin ~ end 사이의 코드)
    on dept_original    -- on 부착될 테이블
    for each row        -- 모든 row 에 대해서

begin       -- 트리거가 실행할 코드
     if inserting then 
            dbms_output.put_line('Insert Trigger 발생 !!!!');
            insert into dept_copy
            values ( :new.dno, :new.dname, :new.loc);   -- new -> 가상 임시 테이블
        end if;       

end;
/

/* 트리거 확인 데이터 사전 : user_source */
select * from user_source where name = 'TRI_SAMPLE1';

select * from dept_original;
select * from dept_copy;
    
insert into dept_original
values (14, 'PROGRAM4','BUSAN4');

/* delete 트리거 : dept_orginal 에서 제거 ===> dept_copy 에서 해당 내용을 제거*/

create or replace trigger tri_del
    -- 트리거가 작동시킬 테이블, 이벤트
    after delete  -- 원본 테이블의 delete를 먼저 실행후 트리거 작동
    on dept_original    -- dept_original 테이블에 트리거 부착
    for each row     
begin   -- 트리거가 작동할 코드
    dbms_output.put_line('Delete Trigger 발생됨 !!!');
    delete dept_copy
    where dept_copy.dno = :old.dno;     -- dept_original에서 삭제되는 가상 임시테이블 : old
end;
/

select * from dept_original;
select * from dept_copy;

delete dept_original
where dno = 14;

/* update 트리거 : dept_original 테이블의 특정 값을 수정하면 dept_copy 테이블의 내용을 업데이트 함 */

create or replace trigger tri_update
    after update 
    on dept_original
    for each row 
begin
    dbms_output.put_line('update trigger 발생 !!!');
    update dept_copy
    set dept_copy.dname = :new.dname
    where dept_copy.dno = 13;

end;
/

select * from dept_original;    -- <주문 테이블 가정>
select * from dept_copy;        -- <배송 테이블 가정>
    
update dept_original
set dname = 'prog'
where dno = 13;
    
    
    
    


    