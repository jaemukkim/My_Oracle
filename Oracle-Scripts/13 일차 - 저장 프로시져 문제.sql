13 ���� - ���� ���ν��� ���� 

1. �� �μ����� �ּұ޿�, �ִ�޿�, ��ձ޿��� ����ϴ� �������ν����� �����Ͻÿ�. 
	[employee, department ] ���̺� �̿�
    
    set serveroutput on
create or replace procedure sp_ex1
is  -- ���� �����, Ŀ�� ����
    v_dno employee.dno%type;
    v_min employee.salary%type;
    v_max employee.salary%type;
    v_avg employee.salary%type;
    
    cursor c1
    is
    select dno, min(salary), max(salary), avg(salary)
    from employee
    group by dno;
    
begin
    dbms_output.put_line('�μ���ȣ   �ּұ޿�   �ִ�޿�   ��ձ޿�');
    dbms_output.put_line('-----------------------------------');
    open c1;
    loop
        fetch c1 into v_dno, v_min, v_max, v_avg;
        exit when c1%notfound;
        dbms_output.put_line(v_dno ||'    '||v_min||'     '||v_max||'     '||v_avg);
    end loop;
    close c1;
end;
/
exec sp_ex1;

2.  �����ȣ, ����̸�, �μ���, �μ���ġ�� ����ϴ� �������ν����� �����Ͻÿ�.
	[employee, department ] ���̺� �̿�
create or replace procedure sp_ex2
is
    v_eno employee%type;
    v_ename employee%type;
    v_dname department%type;
    v_loc department%type;
    
    cursor c1
    is 
    select eno, ename, dname, loc
    from employee e , department d
    where e.dno = d.dno;
begin
    dbms_output.put_line('�����ȣ   ����̸�   �μ���   �μ���ġ');
    dbms_output.put_line('--------------------------------');
    open c1;
    loop
        fetch c1 into v_eno, v_ename, v_dname, v_loc;
        exit when c1%notfound;
        dbms_output.put_line(v_eno||'   ' || v_ename||'    '|| v_dname|| '    ' || v_loc);
    end loop;
    close c1;
    
end;
/

exec sp_ex2;

3. �޿��� �Է� �޾�  �Է¹��� �޿����� ���� ����� ����̸�, �޿�, ��å�� ��� �ϼ���.
	�������ν����� : sp_salary_b
create or replace procedure sp_ex3(
    v_salary in employee.salary%type
)
is
    v_emp employee%rowtype;
    cursor c1
    is
    select ename, salary, job
    from employee
    where salary > v_salary  ;
    
begin

    open c1;
    loop
        fetch c1 into v_emp.ename, v_emp.salary, v_emp.job;
        exit when c1%notfound;
        dbms_output.put_line('������� ' || v_emp.ename || ' �޿��� ' || v_emp.salary || ' ��å�� '|| v_emp.job);
    end loop;
    close c1;   

end;
/

exec sp_ex3(1500);

    

4. ��ǲ �Ű����� : emp_c10, dept_c10  �ΰ��� �Է� �޾� ���� employee, department ���̺��� �����ϴ� �������ν����� �����ϼ���. 
	�������ν����� : sp_copy_table
    
-- PL/SQL ���ο��� ���̺��� ���� : grant create table to public;  < sys �������� ���� >
-- ���� ���ν��� ������ : revoke create table from public;
    create or replace procedure sp_ex4 (
        v_emp in varchar2, v_dept in varchar2 ) -- ���� : ';' �� ������ �ȵ�, �ڷ����� ũ�⸦ �����ϸ� �ȵ�
    is   
        c1 integer;     -- Ŀ�� ���� ����
        v_sql1  varchar2(500);  -- ���̺� ���� ������ ���� ����
        v_sql2  varchar2(500);
    begin
        v_sql1 := 'create table ' || v_emp || ' as select * from employee' ;
        v_sql2 := 'create table ' ||v_dept||' as select * from department';
        
        c1 := dbms_sql.open_cursor;     -- Ŀ�� ����
        dbms_sql.parse(c1, v_sql1, dbms_sql.v7);
        dbms_sql.parse(c1, v_sql2, dbms_sql.v7);
        dbms_sql.close_cursor(c1);      -- Ŀ�� ����
        
    end;
    /	
exec sp_ex4('emp_c10', 'dept_c10');
select * from emp_c10;
select * from dept_c10;

5. dept_c10 ���̺��� dno, dname, loc �÷��� ���� ��ǲ �޾� ��ǲ ���� ���� insert�ϴ� �������ν����� �����Ͻÿ�. 
	�Է� �� : 50  'HR'  'SEOUL'
	�Է� �� : 60  'HR2'  'PUSAN' 

create or replace procedure sp_ex5(
    v_dno in dept_c10.dno%type ,
    v_dname in dept_c10.dname%type,
    v_loc in dept_c10.loc%type
)
    is        
    begin
        insert into dept_c10
        values ( v_dno, v_dname, v_loc);
        
        dbms_output.put_line (' ���������� �� �Է��� �Ǿ����ϴ�' );
    end;
    /
    exec sp_ex5(50, 'HR', 'SEOUL');
    exec sp_ex5(60, 'HR2', 'BUSAN');
    select * from dept_c10;
    

6. emp_c10 ���̺��� ��� �÷��� ���� ��ǲ �޾� ��ǲ ���� ���� insert�ϴ� �������ν����� �����Ͻÿ�. 
	�Է� �� : 8000  'SONG'    'PROGRAMER'  7788  sysdate  4500  1000  50 
    create or replace procedure sp_ex6(
    v_eno in emp_c10.eno%type,
    v_ename in emp_c10.ename%type,
    v_job in emp_c10.job%type,
    v_manager in emp_c10.manager%type,
    v_hiredate in emp_c10.hiredate%type,
    v_salary in emp_c10.salary%type,
    v_commission in emp_c10.commission%type,
    v_dno in emp_c10.dno%type
    )
    is    
    begin
        insert into emp_c10
        values( v_eno, v_ename, v_job, v_manager, v_hiredate, v_salary, v_commission, v_dno);
        
        dbms_output.put_line (' ���������� �� �ԷµǾ����ϴ�.');    
    end;
    /
    exec sp_ex6 (8000, 'SONG', 'PROGRAMER', 7788,  sysdate,  4500,  1000,  50);
    select * from emp_c10;
    
    

7. dept_c10 ���̺��� 4�������� �μ���ȣ 50�� HR �� 'PROGRAM' ���� �����ϴ� �������ν����� �����ϼ���. 
	<�μ���ȣ�� �μ����� ��ǲ�޾� �����ϵ��� �Ͻÿ�.> 
	�Է°� : 50  PROGRAMER 
    create or replace procedure sp_ex7 (
        v_dno in dept_c10.dno%type,
        v_dname in dept_c10.dname%type)
    is
    begin
        update dept_c10
        set dname = v_dname
        where dno = v_dno;
        
        dbms_output.put_line('�� ������Ʈ �Ǿ����ϴ�.');
    end;
    /
    exec sp_ex7 (50, 'PROGRAMER');
    select * from dept_c10;  
    

8. emp_c10 ���̺��� �����ȣ�� ��ǲ �޾� ������ �����ϴ� ���� ���ν����� �����Ͻÿ�.
	�Է� �� : 8000  6000
    create or replace procedure sp_ex8 (
    v_eno in emp_c10.eno%type,
    v_salary in emp_c10.salary%type)
    is
    begin
        update emp_c10
        set salary = v_salary
        where eno = v_eno;
        
        dbms_output.put_line('�� �����Ǿ����ϴ�.');
    
    end;
    /
    exec sp_ex8 (8000, 6000);
    select * from emp_c10;
    
    

9. ���� �� ���̺���� ��ǲ �޾� �� ���̺��� �����ϴ� �������ν����� ���� �Ͻÿ�. 
    create or replace procedure sp_ex9 (
        v_emp in varchar2, v_dept in varchar2 ) -- ���� : ';' �� ������ �ȵ�, �ڷ����� ũ�⸦ �����ϸ� �ȵ�
    is   
        c1 integer;     -- Ŀ�� ���� ����
        v_sql1  varchar2(500);  -- ���̺� ���� ������ ���� ����
        v_sql2  varchar2(500);
    begin
        v_sql1 := 'drop table ' || v_emp ;
        v_sql2 := 'drop table ' ||v_dept ;
        
        c1 := dbms_sql.open_cursor;     -- Ŀ�� ����
        dbms_sql.parse(c1, v_sql1, dbms_sql.v7);
        dbms_sql.parse(c1, v_sql2, dbms_sql.v7);
        dbms_sql.close_cursor(c1);      -- Ŀ�� ����
        
    end;
    /
    select * from emp_c10;
    select * from dept_c10;
    exec sp_ex9 ('emp_c10', 'dept_c10');
    

10. �̸��� ��ǲ �޾Ƽ� �����, �޿�, �μ���ȣ, �μ���, �μ���ġ�� OUT �Ķ���Ϳ� �Ѱ��ִ� ���ν����� PL / SQL���� ȣ��
create or replace procedure sp_ex10(
    v_ename in employee.ename%type,
    v_o_ename out employee.ename%type,
    v_salary out employee.salary%type,
    v_dno out employee.ename%type,
    v_dname out department.dname%type,
    v_loc out department.loc%type)    
is
begin
    select ename, salary, e.dno, d.dname, loc into v_o_ename , v_salary, v_dno, v_dname, v_loc
    from employee e ,department d
    where ename = v_ename and e.dno = d.dno;
    
end;
/

declare     -- OUT �Ķ��Ÿ ���� ���� ����
    v_o_ename employee.ename%type;
    v_salary employee.salary%type;
    v_dno employee.dno%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
begin
    -- �͸� ��������� exec/execute �� ������
    sp_ex10('SCOTT', v_o_ename, v_salary, v_dno, v_dname, v_loc);
    
    dbms_output.put_line('�����   ����   �μ���ȣ   �μ���   �μ���ġ');
    dbms_output.put_line('-------------------------------------');
    dbms_output.put_line(v_o_ename ||'   '|| v_salary||'    ' || v_dno ||'    '|| v_dname ||'    '|| v_loc);    
   
end;
/

11. �����ȣ�� �޾Ƽ� �����, �޿�, ��å, �μ���, �μ���ġ�� OUT �Ķ���Ϳ� �Ѱ��ִ� ���ν����� PL / SQL���� ȣ��
create or replace procedure sp_ex11(
    v_eno in employee.eno%type,
    v_ename out employee.ename%type,
    v_salary out employee.salary%type,
    v_job out employee.job%type,
    v_dname out department.dname%type,
    v_loc out department.loc%type
    )
is
begin
    select e.ename, salary, job, d.dname, d.loc into v_ename, v_salary, v_job, v_dname, v_loc
    from employee e, department d
    where e.dno = d.dno
    and eno = v_eno;

end;
/

declare
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_job employee.job%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
begin
    sp_ex11(7369, v_ename, v_salary, v_job, v_dname, v_loc);
    
    dbms_output.put_line('�����   �޿�   ��å   �μ���   �μ���ġ');
    dbms_output.put_line('--------------------------------------------');
    dbms_output.put_line(v_ename||'   '||v_salary||'   '||v_job||'   '||v_dname||'   '||v_loc);
end;
/

select * from employee;







