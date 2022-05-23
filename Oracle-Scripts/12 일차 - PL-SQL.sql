12���� - PL/SQL : ����Ŭ���� ���α׷��� ��Ҹ� ������ SQL , �����ϰ� ó���ؼ� ����.
        MSQL : T-SQL 
    SQL : ����ȭ�� ���Ǿ�� ,  ���� : ������ ���α׷��� ����� ������ �� ����.
    
    
set serveroutput on     -- PL/SQL�� ����� Ȱ��ȭ

/* PL SQL�� �⺻ �ۼ� ���� */

begin 
    -- PL/SQL ����    
end;
/

-- PL/SQL���� �⺻ ���

set serveroutput on
begin
    dbms_output.put_line('Welcome to Oracle');
end;
/

-- PL / SQL���� ���� ���� �ϱ�.

    ������ := ��
    
desc employee;

    -- �ڷ��� ����
        1.  Oracle �� �ڷ����� ���.
        2. ���� �ڷ��� : ���̺��� �÷��� ����� �ڷ����� �����ؼ� ���.
            %type : ���̺��� Ư���÷��� �ڷ����� �����ؼ� ���. (���̺��� �÷� 1�� ����)
            %rowtype : ���̺� ��ü �÷��� �ڷ����� ��� �����ؼ� ���.
            
    
set serveroutput on 

declare     -- ���� ���� (���� �����)
    v_eno number(4);                -- ����Ŭ�� �ڷ���
    v_ename employee.ename%type;    -- ���� �ڷ��� : ���̺��� �÷��� �ڷ����� �����ؼ� ����.
begin 
    v_eno := 7788;      --  :=  ������ ���� �Ҵ��� �� ���.
    v_ename := 'SCOTT';
    dbms_output.put_line('�����ȣ      ����̸�');
    dbms_output.put_line('-------------------');
    dbms_output.put_line(v_eno  || '    ' || v_ename);
end;
/

    
/* �����ȣ�� ����̸� ��� �ϱ� */

set serveroutput on 

declare     -- ���� ���� (���� �����)
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    
begin
    dbms_output.put_line('�����ȣ      ����̸�');
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

    /* PL/SQL ���� ��� ����ϱ� */

    /* If ~ End if �� ����ϱ� */
    
    set serveroutput on
    declare
        v_employee employee%rowtype;    -- rowtype : employee ���̺��� ��� �÷��� �ڷ����� �����ؼ� ���.
                                -- v_employee ������ employee ���̺��� ��� �÷��� ����.
        annsal number (7,2);    -- �� ������ �����ϴ� ����
    begin
        select * into v_employee
        from employee
        where ename = 'SCOTT';        
        if (v_employee.commission is null) then
            v_employee.commission := 0;
        end if;        
        annsal := v_employee.salary * 12 + v_employee.commission;    
        dbms_output.put_line('�����ȣ   ����̸�   ����');
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

/* PL/SQL �� ����ؼ� department ���̺��� ������ ��Ƽ� ��� �غ�����. 
    ������ dno = 20 �� ������ ��Ƽ� ���
*/

 %type ��� : ������ data type�� ���̺��� �÷� �ϳ��ϳ��� �����ؼ� �Ҵ�.
set serveroutput on
declare 
    v_dno department.dno%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
    
begin
    select dno, dname, loc into v_dno, v_dname, v_loc
    from department
    where dno = 20;
        
        dbms_output.put_line('�μ���ȣ   �μ���   ��ġ');
        dbms_output.put_line('-------------------------');
        dbms_output.put_line(v.dno ||'   ' || v.dname ||'   '|| v.loc);
end;
/

 %rowtype ��� : ���̺��� ��� �÷��� �����ؼ� ���.
set serveroutput on
declare 
    v_department department%rowtype;
    
begin
    select dno, dname, loc into v_department
    from department
    where dno = 20;
        
        dbms_output.put_line('�μ���ȣ   �μ���   ��ġ');
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
    
    dbms_output.put_line('�����ȣ   �����   �μ���');
    dbms_output.put_line('-----------------------');
    dbms_output.put_line(v_eno ||'   '|| v_ename ||'   ' || v_dname);
end;
/

/* employee ���̺��� eno, ename, salary, dno �� PL/SQL �� ����ؼ� ���
    ���� commission 1400�� �Ϳ� ���ؼ� */
    
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
    
    dbms_output.put_line('�����ȣ   �����   ����   �μ���ȣ   ���ʽ�');
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
    
    dbms_output.put_line('�����ȣ   �����   ����   �μ���ȣ ');
    dbms_output.put_line('------------------------------');
    dbms_output.put_line(v_employee.eno ||'   '|| v_employee.ename ||'   '|| v_employee.salary ||'   ' || v_employee.dno);
end;
/


/* Ŀ�� (cursor) : PL/SQL���� select �� ����� ���� ���ڵ尡 �ƴ϶� ���ڵ� ���� ���, Ŀ���� �ʿ��ϴ�.
*/
declare
  cursor Ŀ����            1. Ŀ�� ����
  is
  Ŀ���� ������ select ����
begin
  open Ŀ���� ;            2. Ŀ�� ����
  loop
    fetch ����             3. Ŀ���� �̵��ϰ� ���
  end loop;
  close Ŀ����;            4. Ŀ���� ����.
end;
    
    
  end loop;
  close Ŀ����;

end;
/

/* Ŀ���� ����ؼ� department ���̺��� ��� ������ ��� �ϱ� */

set serveroutput on 
declare
    v_dept department%rowtype;      -- ���� ����
    cursor c1                       -- 1. Ŀ�� ����
    is
    select * from department;
    
begin
    dbms_output.put_line('�μ���ȣ   �μ���   �μ���ġ');
    dbms_output.put_line('------------------------');
    open c1;                        -- 2. Ŀ�� ����
    loop 
        fetch c1 into v_dept.dno, v_dept.dname, v_dept.loc;
        exit when c1%notfound;
        dbms_output.put_line(v_dept.dno ||'   '|| v_dept.dname ||'   '|| v_dept.loc);
    end loop;
    close c1;                       -- 4. Ŀ�� ����
    
end;
/

/* Ŀ���� �Ӽ��� ��Ÿ���� �Ӽ��� 
 Ŀ����%notfound : Ŀ������ ���� ��� �ڷᰡ FETCH �Ǿ��ٸ� true
 Ŀ����%found  : Ŀ������ ���� FETCH �����ʴ� �ڷᰡ �����ϸ� true
 Ŀ����%isopen : Ŀ���� ���µǾ��ٸ� true
 Ŀ����%rowcount : Ŀ���� ���� ���ڵ� ����
*/
/*
    �����, �μ���, �μ���ġ, ������ ����ϼ���. PL/SQL
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
    dbms_output.put_line('�����   �μ���   �μ���ġ   ����');
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

/* cursor for loop ������ Ŀ���� ����ؼ� ���� ���ڵ�� ����ϱ�.
    - open, close �� �����ؼ� ���.
    - �� ���̺��� ��ü ������ ����� �� ���.    
*/

set serveroutput on 

declare 
    v_dept department%rowtype;
    cursor c1                   --Ŀ�� ����
    is
    select * from department;
begin
    dbms_output.put_line('�μ���ȣ   �μ���   ������');
    dbms_output.put_line('----------------------');
    for v_dept in c1 loop
        dbms_output.put_line ( v_dept.dno ||'   ' || v_dept.dname ||'   '|| v_dept.loc);    
    end loop ;
    
end;
/

/*employee ���̺� ��系���� cursor for loop �� ���*/

set serverout on
declare
    v_emp employee%rowtype;
    cursor c1
    is
    select * from employee;
begin
    dbms_output.put_line('�����ȣ   �����   ��å   �Ŵ���   �Ի���   ����   ���ʽ�   �μ���ȣ');
    dbms_output.put_line('----------------------------------------------------------');
    for v_emp in c1 loop
    dbms_output.put_line(v_emp.eno||'   '||v_emp.ename||'   '||v_emp.job||'   '||v_emp.manager||'   '
                        ||v_emp.hiredate||'   '||v_emp.salary||'   '||v_emp.commission||'   '||v_emp.dno);
    end loop;
end;
/

/* employee ���̺��� �����ȣ, �����, ����, �μ���ȣ��  ���  ������ 2000�̻� , �μ��� 20,30 �μ��� ���*/

set serverout on
declare
    v_emp employee%rowtype;
    cursor c1
    is
    select * from employee
    where salary > 2000 and dno = 20 or dno = 30;
begin
    dbms_output.put_line('�����ȣ   �����   ����   �μ���ȣ');
    dbms_output.put_line('------------------------------');
    for v_emp in c1 loop
    dbms_output.put_line( v_emp.eno ||'   '||v_emp.ename||'   '||v_emp.salary||'   '||v_emp.dno);
    end loop;
end;
/

--------------------13 ����--------------------------------  
/*
    Ʈ���� (Trigger) : ������ ��Ƽ� (Ʈ����), ��Ƽ踦 ���� �Ѿ��� �߻��.
        - ���̺� �����Ǿ� �ִ�.
        - ���̺� �̺�Ʈ�� �߻��ɶ� �ڵ����� �۵��Ǵ� ���α׷� �ڵ�
        - ���̺� �߻��Ǵ� �̺�Ʈ (Insert, Update, Delete)        
        - Ʈ���ſ��� ���ǵ� begin ~ end ������ ������ �����.
        - before Ʈ���� : ���̺��� Ʈ���Ÿ� ���� ������ Insert, Update, Delete �� ����.
        - after Ʈ���� : Insert, Update, delete �� ������ Ʈ���Ÿ� ����.
        -- ��) �ֹ� ���̺� ���� �־����� ��� ���̺� �ڵ����� ����
        -- ��) �߿� ���̺��� �α׸� ���涧�� ����.
        -- :new : ������ �ӽ����̺�, Ʈ���Ű� ������ ���̺� ���Ӱ� ������ ���ڵ��� �ӽ� ���̺�
        -- :old : ������ �ӽ����̺�, Ʈ���Ű� ������ ���̺� �����Ǵ� ���ڵ��� �ӽ� ���̺�
        -- Ʈ���Ŵ� �ϳ��� ���̺� �� 3������ ������, (insert, update, delete)
*/  

-- �ǽ� ���̺� 2�� ���� : ���̺��� ������ ���� (dept_original, dept_copy)
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

-- Ʈ���� ���� (dept_original ���̺� ����, insert �̺�Ʈ�� �߻��ɶ� �ڵ����� �۵�)

create or replace trigger tri_sample1
    -- Ʈ���Ű� ������ ���̺�, �̺�Ʈ(Insert, update, delete), Before, After,
    after insert        -- insert �̺�Ʈ�� �۵��� Ʈ���Ű� �۵� ( begin ~ end ������ �ڵ�)
    on dept_original    -- on ������ ���̺�
    for each row        -- ��� row �� ���ؼ�

begin       -- Ʈ���Ű� ������ �ڵ�
     if inserting then 
            dbms_output.put_line('Insert Trigger �߻� !!!!');
            insert into dept_copy
            values ( :new.dno, :new.dname, :new.loc);   -- new -> ���� �ӽ� ���̺�
        end if;       

end;
/

/* Ʈ���� Ȯ�� ������ ���� : user_source */
select * from user_source where name = 'TRI_SAMPLE1';

select * from dept_original;
select * from dept_copy;
    
insert into dept_original
values (14, 'PROGRAM4','BUSAN4');

/* delete Ʈ���� : dept_orginal ���� ���� ===> dept_copy ���� �ش� ������ ����*/

create or replace trigger tri_del
    -- Ʈ���Ű� �۵���ų ���̺�, �̺�Ʈ
    after delete  -- ���� ���̺��� delete�� ���� ������ Ʈ���� �۵�
    on dept_original    -- dept_original ���̺� Ʈ���� ����
    for each row     
begin   -- Ʈ���Ű� �۵��� �ڵ�
    dbms_output.put_line('Delete Trigger �߻��� !!!');
    delete dept_copy
    where dept_copy.dno = :old.dno;     -- dept_original���� �����Ǵ� ���� �ӽ����̺� : old
end;
/

select * from dept_original;
select * from dept_copy;

delete dept_original
where dno = 14;

/* update Ʈ���� : dept_original ���̺��� Ư�� ���� �����ϸ� dept_copy ���̺��� ������ ������Ʈ �� */

create or replace trigger tri_update
    after update 
    on dept_original
    for each row 
begin
    dbms_output.put_line('update trigger �߻� !!!');
    update dept_copy
    set dept_copy.dname = :new.dname
    where dept_copy.dno = 13;

end;
/

select * from dept_original;    -- <�ֹ� ���̺� ����>
select * from dept_copy;        -- <��� ���̺� ����>
    
update dept_original
set dname = 'prog'
where dno = 13;
    
    
    
    


    