-- �׷� �Լ� ����
select * from employee;
-- 1. ��� ����� �޿� �ְ��,������,�Ѿ�,�� ��� �޿��� ���. ��տ� ���ؼ��� ������ �ݿø�
select  max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee;

--2. �� ������ �������� �޿� �ְ��,������,�Ѿ� �� ��վ��� ���. ��տ� ���ؼ��� ������ �ݿø�
select  job, count(*),max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee
group by job;

--rollup , cube : group by ������ ����ϴ� Ư���� Ű����
select  job, count(*), max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee
group by rollup (job);

select  job, count(*),max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee
group by cube (job)
order by job;

--�� �� �̻��� �÷��� �׷���
select  dno,job, count(*),max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee
group by dno,job
order by dno;

select  dno,job, count(*),max(salary) �ְ�� , min(salary) ������ , sum(salary) �Ѿ�, round(avg(salary),0) ���
from employee
group by cube(dno,job)
order by dno;

--3. count(*) �Լ��� ����Ͽ� ��� ������ ������ ������� ���
select job , count(*)
from employee
group by job;

--4. ������ ���� ����
select  manager , count(*)
from employee
group by manager;

--5. �޿� �ְ��, ���� �޿����� ������ ���. �÷��� ��Ī�� "DIFFERENCE"�� ����
select  max(salary)- min(salary) as DIFFERENCE
from employee ;


--6. ���޺� ����� ���� �޿��� ���. �����ڸ� �� �� ���� ��� �� �����޿��� 2000�̸��� �׷��� ����,
                -- �޿��� ���� �������� ���
select job , min(salary)
from employee
where salary is not null and salary > 2000
group by job
order by min(salary) desc;
                
--7. �� �μ��� ���� �μ���ȣ,�����,�μ����� ��� ����� ��� �޿� ���. �÷���Ī[�μ���ȣ,�����,��ձ޿�]��
                -- �ο��ϰ� ��ձ޿��� �Ҽ��� 2°�ڸ����� �ݿø�
select dno �μ���ȣ, count(ename) ����� , round(avg(salary),2) ��ձ޿�
from employee
group by dno;
                
--8. �� �μ��� ���� �μ���ȣ�̸�,������,�����,�μ����� ��� ����� ��� �޿� ���. ��ձ޿� ������ �ݿø�.                
/*
    dname           Location            Number of People         salary
    --------------------------------------------------------------------
    SALES           CHICAO                         6                1567
    RESEARCH        DALLS                          5                2175
    ACCOUNTING      NEWYORK                        3                2917
*/
select  dname, loc,  
                        decode (dname, 'SALES','6',
                                        'RESEARCH','5',
                                        'ACCOUNTING','3'
                                         )as "Number Of People", 
                                 decode (dname, 'SALES','1567',
                                        'RESEARCH','2175',
                                        'ACCOUNTING','2917'
                                         )as salary

from department
where dname != 'OPERATIONS'
order by "Number Of People" desc;


select * from department;




