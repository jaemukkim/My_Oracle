-- 2���� : DQL : Select


-- desc ���̺��
desc department;

select * from department;

/*
SQL : ����ȭ�� ���� ���

Select ������ ��ü �ʵ� ����

Select      ==> �÷���
Distinct    ==> �÷����� ���� �ߺ��� �����ض�.
From        ==> ���̺��, ���,
Where       ==> ����
Group By    ==> Ư�� ���� �׷���
Having      ==> �׷����� ���� ����
Order By    ==> ���� �����ؼ� ���
*/
desc employee;

select 
*           -- ��� �÷� ���
from employee;

-- Ư�� �÷��� ����ϱ�
Select eno, ename from employee;

-- Ư�� �÷��� ������ ���
select eno, ename, eno, ename, ename from employee;

select eno, ename, salary from employee;

-- �÷��� ������ ������ �� �ִ�.

select eno, ename, salary, salary * 12 from employee;

-- �÷��� �˸�� as(Alias) : �÷��� �̸��� ����,
    -- �÷��� ������ �ϰų� �Լ��� ����ϸ� �÷����� ��������.
select eno, ename, salary, salary * 12 as ���� from employee;
select eno as �����ȣ , ename as �����, salary as ����, salary * 12 as ���� from employee;
select eno �����ȣ , ename �����, salary ����, salary * 12 ���� from employee; -- as ��������
    -- �����̳� Ư�����ڰ� �� ���� " " ����  ó���ؾ� �Ѵ�.
select eno "��� #��ȣ" , ename "���?��", salary ����, salary * 12 ���� from employee;

-- nvl �Լ� : ����ÿ� null �� ó���ϴ� �Լ�
select * from employee; 

-- nvl �Լ��� ������� �ʰ� ��ü ������ ���.   (null �� ���Ե� �÷��� ������ �����ϸ� null)
    -- null �� 0���� ó���ؼ� �����ؾ���.  : NVL 
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�, 
salary * 12,
salary * 12 + commission    -- ��ü ����
from employee;

-- nvl �Լ��� ����ؼ� ����
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�, 
salary * 12,
salary * 12 + NVL(commission, 0)    -- ��ü ����
from employee;

-- Ư�� �÷��� ������ �ߺ� ������ ��� 
select * from employee;
select dno from employee;
select distinct dno from employee;

select ename, distinct dno from employee;    --�ٸ� �÷� ������ ������ �� �� �ִ�.

-- ������ ����ؼ� �˻� (Where)
select * from employee;
select eno �����ȣ, ename �����, job ��å, manager ���ӻ��, hiredate �Ի糯¥,
    salary ����, commission ���ʽ�, dno �μ���ȣ
from employee;

-- �����ȣ�� 7788�� ����� �̸��� �˻�.
select * from employee
where eno = 7788;

select ename from employee
where eno = 7788;

-- �����ȣ�� 7788�� ����� �μ���ȣ, ����, �Ի糯¥�� �˻�.

select dno �μ���ȣ, salary ����, hiredate �Ի糯¥ from employee
where eno = 7788;

desc employee;

select *
from employee
where ename = 'SMITH';

-- ���ڵ带 �����ö�
    -- number �϶��� '' �� ������ �ʴ´�
    -- ���� ������(char, varchar2)�� ��¥(date) �� ������ ���� '' �� ó��
    -- ��ҹ��ڸ� ����
    
-- �Ի� ��¥�� '81/12/03' �� ��� ���
select ename
from employee
where hiredate = '81/12/03';
    
-- �μ� �ڵ尡 10�� ��� ������� ���.
select ename, dno
from employee
where dno = 20;

select * from employee;

-- ������ 3000 �̻��� ����� �̸��� �μ���, �Ի糯¥�� ���.
select ename, dno, hiredate, salary
from employee
where salary >= 3000;

-- NULL �˻� : is Ű���� ���.  ==> ���� : = �� ����ϸ� �ȵȴ�.
select * 
from employee
where commission is null;     --  is null  /  = null X

-- commission �� 300 �̻��� ����̸���, ��å, ������ ���
select ename, job, salary, commission
from employee
where commission >= 300;

-- commission �� ���� ������� �̸��� ���.
select ename, commission
from employee
where commission is null;

-- ���ǿ��� and , or , not

-- ������ 500 �̻� 2500 �̸��� ������� �̸�, �����ȣ, �Ի糯¥, ������ ���
select ename, eno, hiredate, salary
from employee
where salary >= 500 and salary < 2500;

-- 1. ��å�� SALESMAN �̰ų�, �μ��ڵ尡 20�� ����̸�, ��å, ����, �μ��ڵ� ���
select ename, job, salary, dno
from employee
where job = 'SALESMAN' or dno = 20;

-- 2. commission�� ���� ������߿� �μ��ڵ尡 20�� ������� �̸�, �μ��ڵ�, �Ի糯¥ ���
select ename, dno, hiredate, commission
from employee
where commission is null and dno = 20;

-- 3. commission�� null�� �ƴ� ������� �̸�, �Ի糯¥, ����
select ename, hiredate, salary, commission
from employee
where commission is not null;

-- ��¥ �˻� :
select * from employee;

-- 1982/1/1 ~ 1983/12/31 ������ �Ի��� ����� �̸�, ��å, �Ի糯¥

select ename, job, hiredate
from employee
where hiredate >= '1982/1/1' and hiredate < '1983/12/31';

-- 1981�⵵�� �Ի��� ����� ����� �̸�, ��å, �Ի糯¥
-- between A and B  : A �̻� B ����
select ename, job, hiredate
from employee
where hiredate between '1981/1/1' and '1981/12/31';


-- Ŀ�̼��� 300, 500, 1400�� ����� �̸�, ��å, �Ի����� ���.
select * from employee;

select ename, job, hiredate, commission
from employee
where commission = 300 or commission = 500 or commission = 1400;

-- IN ������
select ename, job, hiredate, commission
from employee
where commission in (300, 500, 1400);

-- like  : �÷����� Ư���� ���ڿ��� �˻�     <�߿�> ==> �۰˻� ����� ����Ҷ�
    -- % : �ڿ� � ���ڰ� �͵� �������.
    -- _ : �ѱ��ڰ� ����� �͵� �������.
    
-- F �� �����ϴ� �̸��� ���� ����� ��� �˻� �ϱ�.

select * from employee
where ename like 'F%';

-- �̸��� ES�� ������ ����� �˻��ϱ�
select ename from employee
where ename like '%ES';

-- J�� ���۵ǰ� J ���� �� ���ڰ� ����� �͵� ������� ��� ���. �ڿ��� ES�� ��������.
select ename from employee
where ename like 'J_MES';

-- ������ ���ڰ� R�� ������ ���
select ename 
from employee
where ename like '%R';

-- MAN �ܾ �� ��å
select * from employee
where job like '%MAN%';

-- 81�⵵�� �Ի��� ����� ����ϱ�.
select * from employee
where hiredate >= '81/01/01' and hiredate <= '81/12/31';

select * from employee
where hiredate between '81/01/01' and '81/12/31';

select * from employee
where hiredate like '81/%';

--81�� 2���� �Ի��� ��� ���
select * from employee 
where hiredate like '81/02/%';

-- ���� : order by , asc (�������� ����), desc (��������)
select * from employee
order by eno ;  -- �⺻������ asc ����������

select * from employee
order by eno desc;

select * from employee
order by eno asc;

-- �̸� �÷��� ����
select * from employee
order by ename asc;

select * from employee
order by ename desc;

-- ��¥ ����
select * from employee
order by hiredate asc;

-- ���� �亯�� �Խ��ǿ��� �ַ� ���. �� �� �̻��� �÷��� ������ ��

select * from employee
order by dno desc;

-- �� ���� �÷��� ���� : ���� ó�� �÷��� ������ �ϰ�, ������ ���� ���ؼ� �ι�° �÷��� ����.

select dno, ename
from employee
order by dno, ename  --  dno �� ���� ������ �Ŀ� �� �߿��� ename�� ����.

select dno, ename
from employee
order by dno desc, ename desc;

-- where ���� order by ���� ���� ���� ��.

select * from employee
where commission is null
order by ename;        -- order by�� ���� �������� -





-- �پ��� �Լ� ����ϱ�
/*
    1. ���ڸ� ó���ϴ� �Լ�
        - UPPER   : �빮�ڷ� ��ȯ
        - LOWER   : �ҹ��ڷ� ��ȯ
        - INITCAP : ù�ڴ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ        
        
        dual ���̺� : �ϳ��� ����� ����ϵ��� �ϴ� ���̺�
*/

select '�ȳ��ϼ���' as �ȳ�
from dual

select 'Oracle mania' , upper ('Oracle mania'), LOWER ('Oracle mania'), initcap('Oracle mania')
from dual

select * from employee;

select ename, lower (ename), initcap(ename), upper(ename) 
from employee;

select * from emplyoee
where ename = 'allen';  -- �˻��� �ȵ�.

select * from employee
where lower(ename) = 'allen';

select ename, initcap(ename) from employee
where initcap(ename) = 'Allen';

-- ���� ���̸� ����ϴ� �Լ�
    -- length : ������ ���̸� ��ȯ, �����̳� �ѱ� ������� ���ڼ��� ����
    
    -- lengthb : ������ ���̸� ��ȯ, ������ 1byte �ѱ� 3byte �� ��ȯ,
    
select length ('Oracle mania'), length ('����Ŭ �ŴϾ�') from dual;

select lengthb ('Oracle mania'), lengthb ('����Ŭ �ŴϾ�') from dual;

select * from employee

select ename, length(ename), job, length(job) from employee;

-- ���� ���� �Լ�
    -- concat : ���ڿ� ���ڸ� �����ؼ� ���
    -- substr : ���ڸ� Ư�� ��ġ���� �߶���� �Լ� (����, �ѱ� ��� 1byte)
    -- substrb : ���ڸ� Ư�� ��ġ���� �߶���� �Լ� (������ 1byte, �ѱ��� 3byte)
    -- instr  : ������ Ư�� ��ġ�� �ε��� ���� ��ȯ
    -- instrb : ������ Ư�� ��ġ�� �ε��� ���� ��ȯ (������ 1byte, �ѱ��� 3byte)
    -- lpad, rpad : �Է¹��� ���ڿ����� Ư���� ���ڸ� ���.
    -- trm    : �߶󳻰� ���� ���ڸ� ��ȯ.
    
select 'Oracle', 'mania', concat ('Oracle', 'maina') from dual

select * from employee;

select concat ( ename, '  ' || job) from employee;

select '�̸��� : ' || ename || ' �̰�, ��å�� : ' || job || ' �Դϴ�' as �÷�����
from employee;

select '�̸��� : ' || ename || ' �̰�, ���ӻ�� ����� : ' || manager || ' �Դϴ�' as ���ӻ�����
from employee;

-- substr (���, ������ġ, ���ⰳ��) : Ư�� ��ġ���� ���ڸ� �߶�´�.

select 'Oracle mania' , substr ('Oracle mania', 4,3), substr ('����Ŭ �ŴϾ�', 2,4)
from dual;                                  -- �տ��� 4ĭ

select 'Oracle mania' , substr ('Oracle mania', -4,3), substr ('����Ŭ �ŴϾ�', -6,4)
from dual;                                  -- �ڿ��� 4ĭ

select ename, substr(ename, 2,3), substr(ename, -5,2) from employee;

select substrb ('Oracle mania', 3,3), substrb ('����Ŭ �ŴϾ�', 4,6) from dual;
                                            -- substrb �ѱ��� 3byte                                            
-- �̸��� N���� ������ ����� ����ϱ� (substr �Լ��� ���)
select ename from employee
where substr (ename, -1, 1) = 'N';

select ename from employee
where ename like '%N';


-- 87�⵵ �Ի��� ����� ����ϱ� (substr �Լ��� ����ؼ� ���)
select * from employee
where substr(hiredate, 1, 2) = '87';

select * from employee
where hiredate like '87%';

--instr (���, ã������, ������ġ, ���° �߰�) : ��󿡼� ã�� ������ �ε��� ���� ���.

select 'Oracle mania', instr ('Oracle mania', 'a') from dual;

select 'Oracle mania', instr ('Oracle mania', 'a', 5, 2) from dual;

select 'Oracle mania', instr ('Oracle mania', 'a', -5, 1) from dual;

select distinct instr(job, 'A', 1,1) from employee
where lower(job) = 'manager';

-- lpad , rpad : Ư�� ���̸�ŭ ���ڿ��� �����ؼ� ����, �����ʿ� ������ Ư�� ���ڷ� ó��
    -- lpad (���, �÷��� ���ڿ�ũ��(byte), Ư������ ����)
select lpad (1234, 10, '#') from dual;
select rpad (1234, 10, '#') from dual;

select salary from employee;

select lpad (salary, 10, '*') from employee;
select rpad (salary, 10, '*') from employee;

-- TRIM : ��������, Ư�� ���ڵ� ����
  -- LTRIM : ������ ������ ����
  -- RTRIM : �������� ������ ����
  -- TRIM  : ����, ������ ������ ����
  
select ltrim ('   Oracle mania   ') a, rtrim ('   Oracle mania   ') b, trim ('   Oracle mania   ') c
from dual;



