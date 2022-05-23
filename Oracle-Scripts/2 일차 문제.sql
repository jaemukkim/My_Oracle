-- ����

select * from employee;

-- 1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� �� �����,�޿�,�λ�� �޿� ���
select ename , salary , salary + 300 "�λ�� �޿�"
from employee;

-- 2. ����� �̸�,�޿�,���� �� ������ ���� �ͺ��� ���������� ���. ���� �� ������ ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ�
select ename, salary, (salary * 12) + (salary + 100) "���� �Ѽ���"
from employee
order by (salary + 100)+(salary * 12) desc, ename, salary;

-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �� ���� ���������� ���
select ename, salary
from employee
where salary >= 2000
order by salary desc;

-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ���.
select ename, dno
from employee
where eno = 7788;

-- 5. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ���.
select ename, salary
from employee
where salary not between 2000 and 3000;

-- 6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ���
select ename, job, hiredate
from employee
where hiredate between '81/02/20' and '81/05/01';

-- 7. �μ���ȣ�� 20 �� 30 �� ���� ����� �̸��� �μ���ȣ�� ���, �̸��� ������������ ���
select ename, dno
from employee
where dno = 20 or dno = 30
order by ename desc;

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿�, �μ���ȣ ��� �̸��� �������� ���
select ename, salary, dno
from employee
where salary between 2000 and 3000 and dno = 20 or dno = 30
order by ename ;

-- 9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� (like �����ڿ� ���ϵ� ī�� ���)
select ename , hiredate
from employee
where hiredate like '81%';

-- 10. �����ڰ� ���� ����� �̸��� �������� ���
select ename, job, MANAGER
from employee
where MANAGER is null;

-- 11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�,�޿�,Ŀ�̼��� ���, �޿��� Ŀ�̼��� �������� ����
select ename, salary, commission
from employee
where commission is not null
order by salary desc, commission desc;

-- 12. �̸��� ����° ������ R�� ����� �̸��� ǥ��.
select ename
from employee
where ename like '__R%';

-- 13. �̸��� A�� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ��.
select ename
from employee
where ename like '%A%E%';

-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ�
        -- ����� �̸�, ������, �޿��� ���
select ename, job, salary
from employee
where job = 'CLERK' or job = 'SALESMAN' and salary not in(1600,950,1300);
        
-- 15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ���.
select ename, salary, commission
from employee
where commission >= 500;


