-- 문제

--1. substr 함수를 사용하여 사원들의 입사한 연도와 입사한 달만 출력
select hiredate, substr(hiredate, 1,2) 연도, substr(hiredate, 4,2) 월
from employee;

--2. substr 함수를 사용하여 4월에 입사한 사원을 출력
select hiredate from employee;

select ename, hiredate 
from employee
where substr (hiredate, 5,1) = '4';

--3. mod 함수를 사용하여 직속상관이 홀수인 사원만 출력
select manager
from employee
where mod(manager ,2) = 1;

--3.1 mod 함수를 사용하여 월급이 3의 배수인 사원들만 출력
select salary
from employee
where mod(salary, 3) = 0;

-- 4. 입사한 연도는 2자리 (YY), 월은 (MON)로 표시하고 요일은 약어(DY)로 지정하여 출력
select hiredate, to_char(hiredate, 'YY/MONDD/DY') 날짜
from employee;

--5. 올해 며칠이 지났는지 출력, 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수 사용
select sysdate, trunc (sysdate - to_date('22/01/01', 'YY/MM/DD')) "올해 며칠 지났나"
from dual;

-- 5-1. 자신이 태어난 날짜에서 현재까지 며칠이 지났는지 출력
select sysdate, trunc (to_date('96/04/27', 'YY/MM/DD') - sysdate) "며칠 지났나"
from dual;

-- 5-2. 자신이 태어난 날짜에서 현재까지 몇개월 지났는지 출력
select sysdate, trunc (months_between ( to_date('96/04/27', 'YY/MM/DD'), sysdate)) "몇개월 지났나"
from dual;

-- 6. 사원들의 상관 사번을 출력하되 상관이 없는 사원은 null 대신 0으로 출력
select dno, manager ,NVL (manager, 0)
from employee;

--7. decode 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ANAIYST 사원은 200,
--    SALESMAN 사원은 180, MANAGER 사원은 150, CLERK 사원은 100 인상

select ename, salary, decode (job, 'ANALYST' , salary + 200,
                                   'SALESMAN', salary + 180,
                                   'MANAGER', salary + 150,
                                   'CLERK', salary + 100,
                                   salary)
                                   as "인상된 급여"                         
from employee;    

--8. 사원번호, [사원번호 2자리만 출력 나머지는 *로 가림] as "가린번호", 
--  이름,
--  [이름의 첫자만 출력 총 네자리, 세자리는 *로 가림] as "가린이름"

select eno, rpad((substr(eno,1,2)), length(eno),'*') as 가린번호,   
        ename, rpad( (substr(ename,1,1)) , length(ename),'*') 가린이름
from employee;

--9. 주민번호를 출력하되 801210-1****** 출력하도록, 전화 번호 : 010-11**-****
    --dual 테이블 사용.
select Rpad('801210-1',14,'*') 주민번호, Rpad('010-11**-', 13, '*') 전화번호
from dual;

select Rpad(substr('801210-12345678',1,8),length('801210-12345678'),'*') 주민번호,
        rpad(substr('010-1234-5678',1,6), length('010-1234-5678'), '*') 전화번호
from dual;
    
-- 10. 사원번호, 사원명, 직속상관,
        -- [직속상관의 사원번호가 없을 경우 : 0000
        -- 직속상관의 사원번호가 앞 2자리가 75일 경우 : 5555
        -- 직속상관의 사원번호가 앞 2자리가 76일 경우 : 6666
        -- 직속상관의 사원번호가 앞 2자리가 77일 경우 : 7777
        -- 직속상관의 사원번호가 앞 2자리가 78일 경우 : 8888
        -- 그외는 그대로 출력
select eno, ename, manager, case when manager is null then '0000'
                                 when substr(manager,1,2) = 75 then '5555'
                                 when substr(manager,1,2) = 76 then '6666'
                                 when substr(manager,1,2) = 77 then '7777'
                                 when substr(manager,1,2) = 78 then '8888'
                                 else to_char(manager, '9999')
                                 end as 직속상관처리
from employee;






