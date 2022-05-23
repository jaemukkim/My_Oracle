-- ����

--1. substr �Լ��� ����Ͽ� ������� �Ի��� ������ �Ի��� �޸� ���
select hiredate, substr(hiredate, 1,2) ����, substr(hiredate, 4,2) ��
from employee;

--2. substr �Լ��� ����Ͽ� 4���� �Ի��� ����� ���
select hiredate from employee;

select ename, hiredate 
from employee
where substr (hiredate, 5,1) = '4';

--3. mod �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ���
select manager
from employee
where mod(manager ,2) = 1;

--3.1 mod �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ���
select salary
from employee
where mod(salary, 3) = 0;

-- 4. �Ի��� ������ 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ���
select hiredate, to_char(hiredate, 'YY/MONDD/DY') ��¥
from employee;

--5. ���� ��ĥ�� �������� ���, ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ� ���
select sysdate, trunc (sysdate - to_date('22/01/01', 'YY/MM/DD')) "���� ��ĥ ������"
from dual;

-- 5-1. �ڽ��� �¾ ��¥���� ������� ��ĥ�� �������� ���
select sysdate, trunc (to_date('96/04/27', 'YY/MM/DD') - sysdate) "��ĥ ������"
from dual;

-- 5-2. �ڽ��� �¾ ��¥���� ������� ��� �������� ���
select sysdate, trunc (months_between ( to_date('96/04/27', 'YY/MM/DD'), sysdate)) "��� ������"
from dual;

-- 6. ������� ��� ����� ����ϵ� ����� ���� ����� null ��� 0���� ���
select dno, manager ,NVL (manager, 0)
from employee;

--7. decode �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ ANAIYST ����� 200,
--    SALESMAN ����� 180, MANAGER ����� 150, CLERK ����� 100 �λ�

select ename, salary, decode (job, 'ANALYST' , salary + 200,
                                   'SALESMAN', salary + 180,
                                   'MANAGER', salary + 150,
                                   'CLERK', salary + 100,
                                   salary)
                                   as "�λ�� �޿�"                         
from employee;    

--8. �����ȣ, [�����ȣ 2�ڸ��� ��� �������� *�� ����] as "������ȣ", 
--  �̸�,
--  [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� *�� ����] as "�����̸�"

select eno, rpad((substr(eno,1,2)), length(eno),'*') as ������ȣ,   
        ename, rpad( (substr(ename,1,1)) , length(ename),'*') �����̸�
from employee;

--9. �ֹι�ȣ�� ����ϵ� 801210-1****** ����ϵ���, ��ȭ ��ȣ : 010-11**-****
    --dual ���̺� ���.
select Rpad('801210-1',14,'*') �ֹι�ȣ, Rpad('010-11**-', 13, '*') ��ȭ��ȣ
from dual;

select Rpad(substr('801210-12345678',1,8),length('801210-12345678'),'*') �ֹι�ȣ,
        rpad(substr('010-1234-5678',1,6), length('010-1234-5678'), '*') ��ȭ��ȣ
from dual;
    
-- 10. �����ȣ, �����, ���ӻ��,
        -- [���ӻ���� �����ȣ�� ���� ��� : 0000
        -- ���ӻ���� �����ȣ�� �� 2�ڸ��� 75�� ��� : 5555
        -- ���ӻ���� �����ȣ�� �� 2�ڸ��� 76�� ��� : 6666
        -- ���ӻ���� �����ȣ�� �� 2�ڸ��� 77�� ��� : 7777
        -- ���ӻ���� �����ȣ�� �� 2�ڸ��� 78�� ��� : 8888
        -- �׿ܴ� �״�� ���
select eno, ename, manager, case when manager is null then '0000'
                                 when substr(manager,1,2) = 75 then '5555'
                                 when substr(manager,1,2) = 76 then '6666'
                                 when substr(manager,1,2) = 77 then '7777'
                                 when substr(manager,1,2) = 78 then '8888'
                                 else to_char(manager, '9999')
                                 end as ���ӻ��ó��
from employee;






