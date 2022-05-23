--------------------------------------------------------------
--���̺� ���� ����

--1. EQUI ������ ����Ͽ� SCOTT ����� �μ� ��ȣ�� �μ� �̸��� ���
select e.dno, dname
from employee e, department d
where e.dno = d.dno
and ename = 'SCOTT';

-- ���� ����  <<�߿�>> : ���̺��� �÷��� �Ҵ�Ǿ �������� ���Ἲ�� Ȯ��
    -- Primary Key : ���̺� �ѹ��� ����� �� �ִ�. �ϳ��� �÷�, �ΰ� �̻��� �׷����ؼ� ����.\
                    -- �ߺ��� ���� ���� �� ����. NULL�� ���� �� ����.
    -- UNIQUE      : ���̺� ���� �÷��� �Ҵ� �� �� �ִ�. �ߺ��� ���� ���� �� ����.
                    -- NULL ���� �� �ִ�. �� �ѹ��� NULL
    -- Foreign Key : �ٸ� ���̺��� Ư�� �÷��� ���� �����ؼ��� ���� �� �ִ�.
                    -- �ڽ��� �÷��� ������ ���� �Ҵ����� ���Ѵ�.
    --NOT NULL     : Null ���� �÷��� �Ҵ� �� �� ����.
    -- CHECK       : �÷��� ���� �Ҵ� �� �� üũ�ؼ� (���ǿ� ����) ���� �Ҵ�.
    -- Default     : ���� ���� ������ �⺻���� �Ҵ�.
    

--2. INNER JOIN�� ON �����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ���
select * from department;

select ename �̸�, dname �μ��̸�, loc ����
from employee e INNER join department d
on e.dno = d.dno;

--3. INNER JOIN�� USING �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ ������ ���(�ѹ����� ǥ��)��
                                        --  �μ��� �������� �����Ͽ� ���
                                        
-- JOIN���� USING�� ����ϴ� ��� : 
    -- NATURAL JOIN : ���� Ű �÷��� Oracle ���ο��� �ڵ� ó��, 
        --�ݵ�� �� ���̺��� ����Ű �÷��� ������ Ÿ���� ���ƾ��Ѵ�.
    -- �� ���̺��� ���� Ű �÷��� ������ Ÿ���� �ٸ� ��� USING�� ����Ѵ�.
    -- �� ���̺��� ���� Ű �÷��� �������� ��� USING �� ����Ѵ�.
        
desc employee;
desc department;

select dno, job, loc
from employee e inner join department d
using (dno)
where dno = 10;
                                        
                                        
--4. NATUAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�,�μ��̸�,�������� ���
select commission, ename, dname, loc
from employee e natural join department d
where commission > 0;

--5. EQUI ���ΰ� WildCard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ��� ���
select ename, dname
from employee e, department d
where e.dno = d.dno and ename like '%A%';

--6. NATUAL JOIN �� ����Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��� ���
select ename, job, dno, dname, loc
from employee e natural join department d
where loc = 'NEW YORK';

--7. SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ��� / ������ ��Ī��
        -- Self Join : �ݵ�� ��Ī�� ���. Select �÷��� ����� �� ��Ī�̸�. �÷���
                    -- �������� ���, ����� ���ӻ�� ������ ���.
                    
        -- EQUI JOIN : ����Ŭ������ ����ϴ� ����, �� ���̺��� Ű�� ��ġ�ϴ� �͸� ���                    
        -- ANSI : INNER JOIN���� ��ȯ ���� (��� DBMS���� ���� ����, MSSQL, MYSQL, IBM DB2)
select  e.eno ���,e.ename �����, d.manager �����ڹ�,d.ename ������
from employee e , employee d
where e.manager = d.eno;

-- ANSI ȣȯ INNER JOIN / ON ���
select  e.eno ���,e.ename �����, d.manager �����ڹ�,d.ename ������
from employee e inner join employee d
on e.manager = d.eno;

--8. OUTER JOIN, SELF JOIN �� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� ���
select e.eno, d.manager 
from employee e join employee d
on e.eno = d.manager (+)
order by eno desc;

--9. SELF JOIN�� ����Ͽ� ������ ���(SCOTT)�� �̸�, �μ���ȣ,������ ���(SCOTT)�� ������ �μ����� �ٹ��ϴ� ��� ���
        -- �� ���� ��Ī�� �̸�, �μ���ȣ, �����
select distinct e.ename �̸�, e.dno �μ���ȣ ,d.ename ����     
from employee e, employee d
where e.dno = d.dno   -- ==> �� ���̺��� �μ� �÷��� ����Ű�� ���.
and  e.ename = 'SCOTT' and d.ename != 'SCOTT';
        
--10. SELF JOIN�� ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ���
select m.ename �����, m.hiredate �Ի���
from employee e, employee m
where e.hiredate < m.hiredate
and e.ename = 'WARD'
order by m.hiredate ;



--11. SELF JOIN�� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� ������ �̸� �� �Ի��ϰ� �Բ� ���
            --��Ī �־
select distinct e.ename �����, e.hiredate �Ի���, e.manager ���ӻ��,m.ename ���ӻ����, m.hiredate �Ի���
from employee e, employee m
where e.manager = m.eno
and e.hiredate < m.hiredate;
            
            
            
            
            
            
            
-----------5���� Subquery �� ����Ͽ� ������ Ǫ�ÿ�.---------------------------------------

--1. �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(����̸� �� ������) �Ͻÿ�. 
select ename,job,eno
from employee
where job = (select job from employee where eno = 7788);

--2. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ�� (����̸� �� ������) �Ͻÿ�. 
select ename, job, salary
from employee
where salary > (select salary from employee where eno = 7499);

--3. �ּ� �޿��� �޴� ���޺��� ����� �̸�, ��� ���� �� �޿��� ǥ�� �Ͻÿ�(�׷� �Լ� ���)
select  ename, job, salary
from employee
where salary in (select min(salary) from employee group by job);

--4. ���� ���� ��� �޿��� ���ϰ�, ���� ���� ���� ��տ��� ���� ���� ����� ���ް� �޿��� ǥ���Ͻÿ�.
select job ����, ename �̸�, salary �޿�
from employee
where salary = (select min(salary) from employee 
                                    group by job       -- ���������ȿ� ��������
                                    having avg(salary) = (select min(avg(salary))
                                    from employee group by job));
                                    
select min (salary) �޿�, job ����
from employee
group by job
having avg(salary) <= all (select avg(salary)
                            from employee
                            group by job);

--5. �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select  ename, salary, dno
from employee
where salary in (select min(salary) from employee group by dno);

--6. ��� ������ �м���(ANALYST) �� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ǥ�� (�����ȣ, �̸�, ������, �޿�) �Ͻÿ�.
select eno, ename, job, salary
from employee
where salary < all (select salary from employee
                                where job = 'ANALYST')
                                and job <> 'ANALYST';

--7. ���������� ���� ����� �̸��� ǥ�� �Ͻÿ�. 
select ename, eno
from employee
where eno not in (select manager from employee where manager is not null);

--8. ���������� �ִ� ����� �̸��� ǥ�� �Ͻÿ�. 
select ename,eno, manager
from employee
where eno in (select manager from employee where manager is not null);

--9. BLAKE �� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�(��, BLAKE �� ����). 
select ename �̸�, hiredate �Ի���,  dno �μ�
from employee
where dno = (select dno from employee where ename = 'BLAKE')
                             and ename != 'BLAKE';

--10. �޿��� ��պ��� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ���� �������� ���� �Ͻÿ�. 
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
order by salary ;

--11. �̸��� K �� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. 
select dno, ename, eno
from employee
where dno in (select dno from employee where ename like '%K%');

--12. �μ� ��ġ�� DALLAS �� ����� �̸��� �μ� ��ȣ �� ��� ������ ǥ���Ͻÿ�. 
-- Join ���
select e.ename �̸�, e.dno �μ���ȣ, e.job ����, d.loc ����     -- �� ���̺��� ���� Ű �÷�, EQUI JOIN ������ ���̺�� ���
from employee e , department d
where e.dno = d.dno
and loc = 'DALLAS';

--  Sub Query
select ename, e.dno, job , loc
from employee e, department d
where e.dno = d.dno
and e.dno in (select dno from department where loc = 'DALLAS');                                           

--13. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�. 
select * from employee;

select ename, salary, manager
from employee
where manager = (select eno from employee where ename = 'KING');

--14. RESEARCH �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ�� �Ͻÿ�.

-- JOIN
select e.dno �μ���ȣ, e.ename ����̸�, e.job ������ , d.dname �μ���
from employee e, department d
where e.dno = d.dno
and d.dname = 'RESEARCH';

--Sub Query
select e.dno �μ���ȣ, e.ename ����̸�, e.job ������ , d.dname �μ���
from employee e, department d
where e.dno = d.dno
and d.dno in (select dno from department where dname = 'RESEARCH');

--15. ��� �޿����� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�. 
select eno �����ȣ, ename �̸�, salary �޿�
from employee
where salary > (select round (avg(salary)) from employee ) 
                    and dno in (select dno from employee where ename like '%M%');                    

--16. ��� �޿��� ���� ���� ������ ã���ÿ�.
select job ����, avg(salary) ��ձ޿�
from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

--17. �������� MANAGER�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
select dno, job, ename
from employee
where dno in (select dno from employee where job = 'MANAGER');

