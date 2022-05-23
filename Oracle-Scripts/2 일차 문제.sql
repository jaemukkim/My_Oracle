-- 문제

select * from employee;

-- 1. 덧셈 연산자를 사용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원명,급여,인상된 급여 출력
select ename , salary , salary + 300 "인상된 급여"
from employee;

-- 2. 사원의 이름,급여,연간 총 수입이 많은 것부터 작은순으로 출력. 연간 총 수입은 월급에 12를 곱한 후 $100의 상여금을 더해서
select ename, salary, (salary * 12) + (salary + 100) "연간 총수입"
from employee
order by (salary + 100)+(salary * 12) desc, ename, salary;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은 것 부터 작은순으로 출력
select ename, salary
from employee
where salary >= 2000
order by salary desc;

-- 4. 사원번호가 7788인 사원의 이름과 부서번호를 출력.
select ename, dno
from employee
where eno = 7788;

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력.
select ename, salary
from employee
where salary not between 2000 and 3000;

-- 6. 1981년 2월 20일부터 81년 5월 1일 사이의 입사한 사원의 이름 담당업무, 입사일을 출력
select ename, job, hiredate
from employee
where hiredate between '81/02/20' and '81/05/01';

-- 7. 부서번호가 20 및 30 에 속한 사원의 이름과 부서번호를 출력, 이름을 내림차순으로 출력
select ename, dno
from employee
where dno = 20 or dno = 30
order by ename desc;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여, 부서번호 출력 이름을 오름차순 출력
select ename, salary, dno
from employee
where salary between 2000 and 3000 and dno = 20 or dno = 30
order by ename ;

-- 9. 1981년도 입사한 사원의 이름과 입사일을 출력 (like 연산자와 와일드 카드 사용)
select ename , hiredate
from employee
where hiredate like '81%';

-- 10. 관리자가 없는 사원의 이름과 담당업무를 출력
select ename, job, MANAGER
from employee
where MANAGER is null;

-- 11. 커미션을 받을 수 있는 자격이 되는 사원의 이름,급여,커미션을 출력, 급여및 커미션을 내림차순 정렬
select ename, salary, commission
from employee
where commission is not null
order by salary desc, commission desc;

-- 12. 이름이 세번째 문자인 R인 사원의 이름을 표시.
select ename
from employee
where ename like '__R%';

-- 13. 이름에 A와 E 를 모두 포함하고 있는 사원의 이름을 표시.
select ename
from employee
where ename like '%A%E%';

-- 14. 담당 업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 급여가 $1600, $950 또는 $1300이 아닌
        -- 사원의 이름, 담당업무, 급여를 출력
select ename, job, salary
from employee
where job = 'CLERK' or job = 'SALESMAN' and salary not in(1600,950,1300);
        
-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력.
select ename, salary, commission
from employee
where commission >= 500;


