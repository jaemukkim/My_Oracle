-- 3����

-- ���� �Լ�

/*
    ROUND : Ư�� �ڸ������� �ݿø�.
    TRUNC : Ư�� �ڸ������� �߶󳽴�. (������)
    MOD   : �Է¹��� ���� ���� ������ ���� ���.
*/

-- round ( ��� ) : �Ҽ��� ù°�ڸ� �ݿø�
-- round (���, �Ҽ����ڸ���) :
    -- �Ҽ��� �ڸ��� : ����� �� �Ҽ��� ���������� �ڸ��� ��ŭ �̵��ؼ� �� �ڸ��� �ڿ��� �ݿø�. <==����
    -- �Ҽ��� �ڸ��� : ������ �� �Ҽ��� �������� �ڸ�����ŭ �̵��ϰ� �� �ڸ������� �ݿø�.
        -- ������ �ݿø� 
        -- �Ҽ��� �ڸ��� ��� ����
select 98.7654 , ROUND (98.7654), round(98.7654, 2), round(98.7654, -1), round (98.7654, -2)
    ,round (98.7654, -3), round(98.7654, 3)
from dual;

select 12345.6789, round (12345.6789), round (12345.6789, -3), round(123678.123456, -3)
from dual;


select 98.7654, TRUNC (98.7654), trunc (98.7654, 2), TRUNc(98.7654, -1)
from dual;

-- mod (���, �����¼�) : ����� ����� �������� ���

select mod(31, 2), mod (31, 5), mod (31, 8)
from dual;

select * from employee;

select salary, mod (salary, 300) 
from employee;

--employee ���̺��� �����ȣ�� ¦���� ����鸸 ���.

select *
from employee
where MOD( eno, 2 ) = 0;

/* ��¥ �Լ�
   sysdate : �ý��ۿ� ����� ���� ��¥�� ���.
   months_between : �� ��¥ ������ �� ���������� ��ȯ
   add_months : Ư�� ��¥�� �������� ���Ѵ�.
   next_day : Ư�� ��¥���� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ.
   last_day : ���� ������ ��¥�� ��ȯ
   round    : ���ڷ� ���� ��¥�� Ư�� �������� �ݿø�.
   trunc    : ���ڷ� ���� ��¥�� Ư�� �������� ������.
*/

-- �ڽ��� �ý����� ��¥ ���.
select sysdate
from dual;

select sysdate -1 as ������¥, sysdate as ���ó�¥, sysdate +1 as ���ϳ�¥
from dual;

select * from employee
order by hiredate asc;

select hiredate, hiredate - 1, hiredate + 10
from employee;

desc employee

--�Ի��Ͽ������� ��������� �ٹ��� ���� ���
select ename, round (sysdate - hiredate ) as "�� �ٹ� �ϼ�"
from employee;

select ename, round ((sysdate - hiredate),2 ) as "�� �ٹ� �ϼ�"
from employee;

select ename, trunc (sysdate - hiredate ) as "�� �ٹ� �ϼ�"
from employee;

-- Ư�� ��¥���� ��(Month)�� �������� ������ ��¥ ���ϱ�
select hiredate, trunc (hiredate, 'MONTH')
from employee;

-- Ư�� ��¥���� ��(Month)�� �������� �ݿø��� ��¥ ���ϱ� : 16�� �̻��� ��� �ݿø�.
select hiredate, round (hiredate, 'MONTH')
from employee;

-- months_between (date1, date2) : date1�� date2 ������ �������� ���.

-- �Ի��Ͽ��� ������� �� ������� �ٹ��� ������ ���ϱ� 
select ename, sysdate, hiredate, months_between (sysdate, hiredate) as �ٹ�������
from employee;

select ename, sysdate, hiredate, trunc (months_between (sysdate, hiredate)) as �ٹ�������
from employee;

-- add months ( date1, ������) : date1 ��¥�� �������� ���� ��¥�� ���.
-- �Ի����� 6������ ���� ������ ���.
select hiredate, add_months (hiredate, 6)
from employee;

-- �Ի��� �� 100���� ���� ������ ��¥.

select hiredate,hiredate + 100 as "�Ի��� 100�� ��¥"
from employee;

-- next_day (date, '����') : date �� �����ϴ� ���Ͽ� ���� ��¥�� ����ϴ� �Լ�

select sysdate, next_day (sysdate, '�����') as "�̹����� ������� ��¥"
from dual;

-- last_day (date) : date�� �� ���� ������ ��¥.

select hiredate, last_day (hiredate)
from employee;

-- �� ��ȯ �Լ�  <== �߿�.
/*
    TO_CHAR : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �Լ�
    TO_DATE : �������� ��¥������ ��ȯ�ϴ� �Լ�
    TO_NUMBER : �������� ���������� ��ȯ�ϴ� �Լ�.
*/

-- ��¥ �Լ� ����ϱ�
-- TO_CHAR (date, 'YYYYMMDD')
select ename, hiredate, to_char(hiredate, 'YYYYMMDD'), to_char(hiredate, 'YYMM')
    ,to_char(hiredate, 'YYYYMMDD DAY'), to_char(hiredate, 'YYYYMMDD DAY')
from employee;

-- ���� �ý����� ��¥�� ����ϰ� �ð� �ʱ��� ���.
select sysdate, to_char(sysdate, 'YYYY-MM-DD HH:MI:SS DaY')
from dual;

desc employee;

select hiredate, to_char(hiredate ,'YYYY-MM-DD HH:MI:SS DAY')
from employee;

-- to_char���� ���ڿ� ���õ� ����
/*
    0 : �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� 0���� ä��.
    9 : �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� ä���� ����.
    L : �� ������ ��ȭ ��ȣ�� ���
    . : �Ҽ������� ǥ��
    , : õ������ ������
*/
desc employee;

select ename, salary, to_char(salary, 'L999,999'), to_char (salary, 'L0000,000')
from employee;

-- to_date('char', 'format') : ��¥�������� ��ȯ.
-- to_date('number', 'format') : ��¥�������� ��ȯ.

-- ���� �߻� : date - char X
select sysdate , sysdate - '20000101'
from dual;

-- 2000�� 1�� 1�Ͽ��� ���ñ����� �ϼ�
select sysdate, trunc (sysdate - to_date(20000101, 'YYYYMMDD'))
from dual;

select sysdate, to_date('02/10/10', 'YY/MM/DD'),trunc (sysdate - to_date ('021010', 'YYMMDD')) as ��¥����
from dual;

select hiredate
from employee;

select ename, hiredate
from employee
where hiredate = to_date (19810222, 'YYYYMMDD');

select ename, hiredate
from employee
where hiredate = to_date ('1981-02-22', 'YYYY-MM-DD');

--2000�� 12�� 25�Ϻ��� ���ñ��� �� ����� �������� ���
select sysdate,trunc( months_between (sysdate, to_date('00/12/25','YY/MM/DD'))) ������
from dual;

-- to_number : number ������ Ÿ������ ��ȯ,
select 100000 - 50000
from dual;

-- ���� �߻� : ���ڿ� - ���ڿ�
select '100,000' - '50,000'
from dual;

select to_number('100,000', '999,999') - to_number ('50,000', '999,999')
from dual;

-- NVL �Լ� : null�� �ٸ� ������ ġȯ ���ִ� �Լ�
    -- nvl (expr1, expr2) : expr1 ���� null�� expr2�� ġȯ

select commission
from employee;

select commission, NVL ( commission, 0 )
from employee;

select manager
from employee;

select manager, NVL (manager, 1111)
from employee;

-- NVL2 �Լ�
    -- nvl2(expr1, expr2, expr3) : expr1 �� null�� �ƴϸ� expr2�� ���, expr1�� null�̸� expr3�� ���.
    
select salary, commission
from employee;

-- NVL �Լ��� ���� ����ϱ�
select salary, salary * 12, commission, NVL(commission, 0 ),
salary * 12 + nvl(commission, 0) as ����
from employee;

-- NVL2 �Լ��� ����ؼ� ���� ����ϱ�
select salary, commission, NVL2( commission, salary * 12+commission, salary*12) ����
from employee;

-- nullif : �� ǥ������ ���ؼ� ������ ��� Null�� ��ȯ�ϰ� �������� �ʴ� ��� ù��° ǥ������ ��ȯ.
    -- nullif (expr1, expr2) : 
select nullif ('A', 'A'), nullif ('A', 'B')
from dual;

-- coalesce �Լ�
coalesce (expr1, expr2, expr3 .... expr-n) :
    -- expr1  �� null �� �ƴϸ� exprl �� ��ȯ�ϰ�,
    -- expr1  �� null �̰� expr2�� null�� �ƴϸ� expr2�� ��ȯ�ϰ�
    -- expr1  �� null �̰� expr2�� null�̰� expr3�� null�� �ƴϸ� expr3�� ��ȯ �Ѵ�... 

select coalesce ( 'abc', 'bcd', 'def','efg', 'fgi')
from dual;

select coalesce (null, 'bcd', 'def','efg', 'fgi')
from dual;

select coalesce (null, null, 'def','efg', 'fgi')
from dual;

select coalesce (null, null, null,'efg', 'fgi')
from dual;

select ename, salary, commission, coalesce (commission,salary,0)
from employee;

--decode �Լ� : switch case ���� ������ ����
/*
    DECODE (ǥ����, ����1, ���1,
                   ����2, ���2,
                   ����3, ���3,
                   �⺻���n
            )
*/

select ename, dno, decode (dno, 10, 'ACCOUNTING',
                                20, 'RESEARCH',
                                30, 'SALES',
                                40, 'OPERATION',
                                'DEFAULT') as DNAME
from employee
order by dno;

-- dno�÷��� 10�� �μ��� ��� ���޿��� + 300�� ó��, 20�� �μ��� ��� ������ + 500 ��
 --   �μ���ȣ�� 30�� ��� ���޿� + 700�� �ؼ� �̸�, ����, �μ��� �����÷��� �� ����� ���
 
 select ename, salary, dno,decode (dno, 10, salary + 300,
                                         20, salary + 500,
                                         30, salary + 700
                                         ) as �����÷���
from employee
order by dno;

-- case : if ~ else if, else if ~~~
/*
    case ǥ���� WHEN ����1 THEN ���1
               WHEN ����2 THEN ���2
               WHEN ����3 THEN ���3
               ELSE ���n
    END               
*/

select ename, dno, case when dno = 10 then 'ACCOUNTING'
                        when dno = 20 then 'RESEARCH'
                        when dno = 30 then 'SALES'
                        ELSE 'DEFAULT'
                    END as �μ���
from employee
order by dno;










