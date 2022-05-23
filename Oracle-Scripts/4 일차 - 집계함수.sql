-- 4����
/*
    �׷��Լ� : ������ ���� ���ؼ� �׷����ؼ� ó���ϴ� �Լ�
    group by ���� Ư�� �÷��� ���� �� ���, �ش� �÷��� ������ ������ �׷����ؼ� ������ ����.
    
    �����Լ� : 
        - SUM : �׷��� �հ�
        - AVG : �׷��� ���
        - MAX : �׷��� �ִ밪
        - MIN : �׷��� �ּҰ�
        - COUNT : �׷��� �� ���� ( ���ڵ� �� record, �ο� �� row )    
*/

select sum (salary), round( avg(salary),2 ), max(salary), min(salary)
from employee;

-- ���� : ���� �Լ��� ó���� ��, ��� �÷��� ���� ������ ������ �÷��� ����

select sum (salary)
from employee;

select ename
from employee;

select * from employee;

-- �����Լ��� null ���� ó���ؼ� �����Ѵ�.
select sum (commission), avg(commission), max (commission), min (commission)
from employee; 

-- count () : ���ڵ� �� , �ο� ��
    -- NULL �� ī��Ʈ ���� �ʴ´�.
    -- ���̺��� ��ü ���ڵ� ���� ������ ��� : count(*) �Ǵ� NOT NULL �÷��� count()
    -- 
    
desc employee;    

select eno from employee;
select count (eno) from employee;

select commission from employee;
select count(commission) from employee;

select count (*) from employee; -- (*) ==> ��� �÷�
select * from employee;

--��ü ���ڵ� ī��Ʈ
select count(*) from employee;
select count(eno) from employee;

-- �ߺ����� �ʴ� ������ ����

select job from employee;

select count (distinct job) from employee;

-- �μ��� ���� (dno)

select count (distinct dno) from employee;

-- Group by : Ư�� �÷��� ���� �׷��� �Ѵ�. �ַ� ���� �Լ��� select ������ ���� ����Ѵ�.
/*              ������ ���� �׷���
    select �÷���, �����Լ� ó���� �÷�
    from ���̺�
    where ����
    group by �÷���
    having ���� ( group by �� ����� ����)
    order by ����
*/ 

-- �μ��� ��� �޿�.
select dno as �μ���ȣ, round (avg(salary), 2) as ��ձ޿�
from employee
group by dno;       -- dno �÷��� �ߺ��� ���� �׷����Ѵ�.

select dno from employee order by dno;

-- ��ü ��� �޿�.
select avg (salary) as ��ձ޿�
from employee;

-- group by�� ����ϸ鼭 select ���� ������ �÷��� �� �����ؾ� �Ѵ�.
select dno , count(dno), sum (salary), avg(salary), max(commission), min(commission)
from employee
group by dno;

--
select job from employee;

-- ������ ��å�� �׷����ؼ� ������ ���, �հ�, �ִ밪, �ּҰ��� ���.
select job, count(job),round (avg(salary), 2) ���, sum(salary) �հ�, max(salary) �ִ밪, min(salary) �ּҰ�
from employee
group by job;   -- ������ ��å�� �׷����ؼ� ���踦 �Ѵ�.

-- ���� �÷��� �׷��� �ϱ�

select dno, job, count(*), sum(salary)
from employee
group by dno, job;    -- �� �÷� ��� ��ġ�ϴ� ���� �׷���

select dno, job
from employee
where dno = 20 and job = 'CLERK';

-- having : group by ���� ���� ����� �������� ó���� ��.
    -- ��Ī �̸��� �������� ����ϸ� �ȵȴ�.
    

-- �μ��� ������ �հ谡 9000 �̻��� �͸� ���.
select dno, count(*), sum(salary) as �μ����հ�, round (avg(salary), 2) as �μ������
from employee
group by dno
having sum(salary) > 9000;


-- �μ��� ������ ����� 2000 �̻� ���.

select dno, count(*), sum(salary) as �μ����հ�, round (avg(salary), 2) as �μ������
from employee
group by dno
having avg(salary) > 2000; 

-- where �� having ���� ���� ���Ǵ� ���
    -- where : ���� ���̺��� �������� �˻�
    -- having : group by ����� ���ؼ� ������ ó��
    
select * from employee;

-- ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ���

select dno, count(*), round (avg(salary)) as �μ������
from employee
where salary > 1500
group by dno
having round (avg(salary)) > 2500;


-- ROLLUP
-- CUBE
    -- Group by ������ ����ϴ� Ư���� �Լ�
    -- ���� �÷��� ���� �� �� �ִ�.
    -- group by ���� �ڼ��� ������ ���..

--Rollup, cube �� ������� ���� ���
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by dno
order by dno;

--Rollup : �μ��� �հ�� ����� ��� ��, ������ ���ο� ��ü �հ�, ���
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by rollup(dno)
order by dno;

-- cube : �μ��� �հ�� ����� ��� ��, ������ ���ο� ��ü �հ�, ���
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by cube(dno)
order by dno;

-- Rollup : �� �÷��̻�
select dno, job, count(*), MAX(salary), sum(salary)
from employee
group by rollup(dno,job);        -- �ΰ��� �÷��� �����, �� �÷��� ���ļ� ������ �� �׷���.

select dno, job, count(*), MAX(salary), sum(salary)
from employee
group by cube (dno,job)
order by dno,job;

--JOIN : ���� ���̺��� ���ļ� �� ���̺��� �÷��� �����´�.
    -- department �� employee�� ������ �ϳ��� ���̺��̾����� �𵨸�(�ߺ�����, ��������� ���ؼ� �� ���̺��� �и�
    -- �� ���̺��� ����Ű �÷� (dno), employee ���̺��� dno �÷��� department ���̺��� dno �÷��� �����Ѵ�.
    -- �� �� �̻��� ���̺��� �÷��� JOIN ������ ����ؼ� ���.
    
    
select * from department;   -- �μ������� �����ϴ� ���̺�
select * from employee;     -- ��������� �����ϴ� ���̺�


-- EQUI JOIN : ����Ŭ���� ���� ���� ����ϴ� JOIN , Oracle ������ ��밡��
    -- from ��  : ������ ���̺��� "," �� ó��,
    -- where �� : �� ���̺��� ������ Ű �÷��� " = " �� ó��
        -- and ��  : ������ ó��
   
    
        
-- where �� : ���� Ű �÷��� ó���� ���
select *
from  employee, department
where department.dno = employee.dno
and job = 'MANAGER';

-- ANSI ȣȯ : [INNER] JOIN       <== ��� SQL���� ��� ������ JOIN
-- ON �� : ���� Ű �÷��� ó���� ���
    -- on �� : �� ���̺��� ������ Ű �÷��� " = " �� ó��
        -- where �� : ������ ó��

select *
from employee e INNER join department d   -- INNER ���� ����
on e.dno = d.dno
where job = 'MANAGER';

-- JOIN�� ���̺� �˸�� ( ���̺� �̸��� ��Ī���� �ΰ� ���� ���)
select *
from employee  e, department d
where e.dno = d.dno 
and salary > 1500;

-- select ������ ���� Ű �÷��� ��½ÿ� ��� ���̺��� �÷����� ��� : dno
select eno, job, e.dno, dname
from employee e, department d
where e.dno = d.dno;

-- �� ���̺��� JOIN �ؼ� �μ���(dname)���� ������ �ִ밪�� �μ������� ����� ������.
select dname, count(*), max(salary)
from department d, employee e
where d.dno = e.dno
group by dname;

-- NATURAL JOIN : Oracle 9i ����
    -- EQUI JOIN �� Where ���� ���� : �� ���̺��� ������ Ű �÷��� ���� " = "
    -- ������ Ű �÷��� Oracle ���������� �ڵ����� �����ؼ� ó��.
    -- ���� Ű�÷��� ��Ī �̸��� ����ϸ� ������ �߻�.
    -- �ݵ�� ���� Ű �÷��� ������ Ÿ���� ���ƾ� �Ѵ�.
    -- from ���� nature join Ű���带 ���.    
    
select e.eno, e.ename, d.dname, dno
from employee e natural join department d;

-- ���� : select ���� ����Ű �÷��� ��½� ���̺���� ����ϸ� ���� �߻�.

-- EQUI JOIN vs NATUARL JOIN �� ���� Ű �÷� ó��
    -- EQUI JOIN : select ���� �ݵ�� ���� Ű �÷��� ����� �� ���̺���� �ݵ�� ���.
    -- NATURAL JOIN : select ���� �ݵ�� ���� Ű �÷��� ����� �� ���̺���� �ݵ�� ������� �ʾƾ��Ѵ�.
    
-- EQUI     
select ename, salary, dname, e.dno  -- e.dno : EQUI JOIN ������ ��� O
from employee e, department d
where e.dno = d.dno
and salary > 2000;   -- and

-- NATUAL JOIN
select ename, salary, dname, dno    -- natural join ������ ��� X
from employee e natural join department d
where salary > 2000;

-- ANSI : INNER JOIN
select ename, salary, dname, e.dno  -- e.dno ���
from employee e join department d
on e.dno = d.dno
where salary > 2000;

--NON EQUI JOIN : EQUI JOIN���� where ���� "=" �� ������� �ʴ� JOIN

select * from salgrade;  -- ������ ����� ǥ���ϴ� ���̺�

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

-- ���̺� 3�� ����

select ename, dname, salary, grade
from employee e, department d, salgrade s
where e.dno = d.dno 
and salary between losal and hisal;



-- Self join : �ڱ� �ڽ��� ���̺��� ���� �Ѵ�. (�ַ� ����� ��� ������ ����� �� �����. ������ ,.)
    -- ��Ī�� �ݵ�� ����ؾ� �Ѵ�. 

select eno, ename, manager
from employee
where manager = 7788;

-- Self JOIN�� ����ؼ� ����� ���� ��� �̸��� ���
select e.eno �����ȣ ,e.ename as "��� �̸�" , e.manager ���ӻ����ȣ , m.ename as "���ӻ���̸�" 
from employee e, employee m     --Self join : 
where e.manager = m.eno
order by e.ename asc;

select eno, ename, manager, eno, ename
from employee;

-- ANSI ȣȯ : INNER JOIN ���� ó��, / ON
select e.eno �����ȣ, e.ename �����, e.manager ���ӻ����ȣ, m.ename ���ӻ��
from employee e inner join employee m
on e.manager = m.eno
order by e.ename ;

-- EQUI JOIN - SELF JOIN ó��
select e.ename || '�� ���ӻ���� ' || e.manager || ' �Դϴ�.' 
from employee e, employee m
where e.manager = m.eno
order by e.ename asc;

-- ANSI ȣȯ : INNER JOIN
select e.ename || '�� ���ӻ���� ' || e.manager || ' �Դϴ�.' 
from employee e inner join employee m
on e.manager = m.eno
order by e.ename asc;


-- OUTER JOIN :
    -- Ư�� �÷��� �� ���̺��� ���������� �ʴ� ������ ����ؾ� �� ��
    -- ���������� �ʴ� �÷��� NULL ��� 
    -- + ��ȣ�� ����ؼ� ��� : Oracle
    -- ANSI ȣȯ : OUTER JOIN ������ ����ؼ� ��� ==> ��� DBMS ���� ȣȯ.

-- Oracle     
select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno (+)
order by e.ename;

--ANSI ȣȯ�� ����ؼ� ���
    -- Left Outer JOIN : �������� �κ��� ������ ������ ������ ��� ���
    -- Right Outer JOIN : �������� �κ��� ������ �������� ������ ��� ���
    -- FULL Outer JOIN : �������� �κ��� ������ ���� ��� ������ ��� ���
select e.ename, m.ename
from employee e left outer join employee m
on e.manager = m.eno
order by e.ename;








