--------------------------------------------------------------
--테이블 조인 문제

--1. EQUI 조인을 사용하여 SCOTT 사원의 부서 번호와 부서 이름을 출력
select e.dno, dname
from employee e, department d
where e.dno = d.dno
and ename = 'SCOTT';

-- 제약 조건  <<중요>> : 테이블의 컬럼에 할당되어서 데이터의 무결성을 확보
    -- Primary Key : 테이블에 한번만 사용할 수 있다. 하나의 컬럼, 두개 이상을 그룹핑해서 적용.\
                    -- 중복된 값을 넣을 수 없다. NULL을 넣을 수 없다.
    -- UNIQUE      : 테이블에 여러 컬럼에 할당 할 수 있다. 중복된 값을 넣을 수 없다.
                    -- NULL 넣을 수 있다. 단 한번만 NULL
    -- Foreign Key : 다른 테이블의 특정 컬럼의 값을 참조해서만 넣을 수 있다.
                    -- 자신의 컬럼에 임의의 값을 할당하지 못한다.
    --NOT NULL     : Null 값을 컬럼에 할당 할 수 없다.
    -- CHECK       : 컬럼에 값을 할당 할 때 체크해서 (조건에 만족) 값을 할당.
    -- Default     : 값을 넣지 않을때 기본값이 할당.
    

--2. INNER JOIN과 ON 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력
select * from department;

select ename 이름, dname 부서이름, loc 지역
from employee e INNER join department d
on e.dno = d.dno;

--3. INNER JOIN과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유한 목록(한번씩만 표시)을
                                        --  부서의 지역명을 포함하여 출력
                                        
-- JOIN에서 USING을 사용하는 경우 : 
    -- NATURAL JOIN : 공통 키 컬럼을 Oracle 내부에서 자동 처리, 
        --반드시 두 테이블의 공통키 컬럼의 데이터 타입이 같아야한다.
    -- 두 테이블의 공통 키 컬럼의 데이터 타입이 다른 경우 USING을 사용한다.
    -- 두 테이블의 공통 키 컬럼이 여러개인 경우 USING 을 사용한다.
        
desc employee;
desc department;

select dno, job, loc
from employee e inner join department d
using (dno)
where dno = 10;
                                        
                                        
--4. NATUAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름,부서이름,지역명을 출력
select commission, ename, dname, loc
from employee e natural join department d
where commission > 0;

--5. EQUI 조인과 WildCard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명 출력
select ename, dname
from employee e, department d
where e.dno = d.dno and ename like '%A%';

--6. NATUAL JOIN 을 사용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명 출력
select ename, job, dno, dname, loc
from employee e natural join department d
where loc = 'NEW YORK';

--7. SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력 / 각열에 별칭도
        -- Self Join : 반드시 별칭을 사용. Select 컬럼을 출력할 때 별칭이름. 컬럼명
                    -- 조직도를 출력, 사원의 직속상관 정보를 출력.
                    
        -- EQUI JOIN : 오라클에서만 사용하는 구문, 두 테이블의 키가 일치하는 것만 출력                    
        -- ANSI : INNER JOIN으로 변환 가능 (모든 DBMS에서 공통 구문, MSSQL, MYSQL, IBM DB2)
select  e.eno 사번,e.ename 사원명, d.manager 관리자번,d.ename 관리자
from employee e , employee d
where e.manager = d.eno;

-- ANSI 호환 INNER JOIN / ON 사용
select  e.eno 사번,e.ename 사원명, d.manager 관리자번,d.ename 관리자
from employee e inner join employee d
on e.manager = d.eno;

--8. OUTER JOIN, SELF JOIN 을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 출력
select e.eno, d.manager 
from employee e join employee d
on e.eno = d.manager (+)
order by eno desc;

--9. SELF JOIN을 사용하여 지정한 사원(SCOTT)의 이름, 부서번호,지정한 사원(SCOTT)과 동일한 부서에서 근무하는 사원 출력
        -- 각 열의 별칭은 이름, 부서번호, 동료로
select distinct e.ename 이름, e.dno 부서번호 ,d.ename 동료     
from employee e, employee d
where e.dno = d.dno   -- ==> 두 테이블의 부서 컬럼을 공통키로 사용.
and  e.ename = 'SCOTT' and d.ename != 'SCOTT';
        
--10. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력
select m.ename 사원명, m.hiredate 입사일
from employee e, employee m
where e.hiredate < m.hiredate
and e.ename = 'WARD'
order by m.hiredate ;



--11. SELF JOIN을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자 이름 및 입사일과 함께 출력
            --별칭 넣어서
select distinct e.ename 사원명, e.hiredate 입사일, e.manager 직속상관,m.ename 직속상관명, m.hiredate 입사일
from employee e, employee m
where e.manager = m.eno
and e.hiredate < m.hiredate;
            
            
            
            
            
            
            
-----------5일차 Subquery 를 사용하여 문제를 푸시오.---------------------------------------

--1. 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원이름 과 담당업무) 하시오. 
select ename,job,eno
from employee
where job = (select job from employee where eno = 7788);

--2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시 (사원이름 과 담당업무) 하시오. 
select ename, job, salary
from employee
where salary > (select salary from employee where eno = 7499);

--3. 최소 급여를 받는 직급별로 사원의 이름, 담당 업무 및 급여를 표시 하시오(그룹 함수 사용)
select  ename, job, salary
from employee
where salary in (select min(salary) from employee group by job);

--4. 직급 별로 평균 급여를 구하고, 가장 적은 직급 평균에서 가장 적은 사원의 직급과 급여를 표시하시오.
select job 직급, ename 이름, salary 급여
from employee
where salary = (select min(salary) from employee 
                                    group by job       -- 서브쿼리안에 서브쿼리
                                    having avg(salary) = (select min(avg(salary))
                                    from employee group by job));
                                    
select min (salary) 급여, job 직급
from employee
group by job
having avg(salary) <= all (select avg(salary)
                            from employee
                            group by job);

--5. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select  ename, salary, dno
from employee
where salary in (select min(salary) from employee group by dno);

--6. 담당 업무가 분석가(ANALYST) 인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 표시 (사원번호, 이름, 담당업무, 급여) 하시오.
select eno, ename, job, salary
from employee
where salary < all (select salary from employee
                                where job = 'ANALYST')
                                and job <> 'ANALYST';

--7. 부하직원이 없는 사원의 이름을 표시 하시오. 
select ename, eno
from employee
where eno not in (select manager from employee where manager is not null);

--8. 부하직원이 있는 사원의 이름을 표시 하시오. 
select ename,eno, manager
from employee
where eno in (select manager from employee where manager is not null);

--9. BLAKE 와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오(단, BLAKE 는 제외). 
select ename 이름, hiredate 입사일,  dno 부서
from employee
where dno = (select dno from employee where ename = 'BLAKE')
                             and ename != 'BLAKE';

--10. 급여가 평균보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름 차순으로 정렬 하시오. 
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
order by salary ;

--11. 이름에 K 가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하는 질의를 작성하시오. 
select dno, ename, eno
from employee
where dno in (select dno from employee where ename like '%K%');

--12. 부서 위치가 DALLAS 인 사원의 이름과 부서 번호 및 담당 업무를 표시하시오. 
-- Join 사용
select e.ename 이름, e.dno 부서번호, e.job 업무, d.loc 지역     -- 두 테이블의 공통 키 컬럼, EQUI JOIN 에서는 테이블명 명시
from employee e , department d
where e.dno = d.dno
and loc = 'DALLAS';

--  Sub Query
select ename, e.dno, job , loc
from employee e, department d
where e.dno = d.dno
and e.dno in (select dno from department where loc = 'DALLAS');                                           

--13. KING에게 보고하는 사원의 이름과 급여를 표시하시오. 
select * from employee;

select ename, salary, manager
from employee
where manager = (select eno from employee where ename = 'KING');

--14. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시 하시오.

-- JOIN
select e.dno 부서번호, e.ename 사원이름, e.job 담당업무 , d.dname 부서명
from employee e, department d
where e.dno = d.dno
and d.dname = 'RESEARCH';

--Sub Query
select e.dno 부서번호, e.ename 사원이름, e.job 담당업무 , d.dname 부서명
from employee e, department d
where e.dno = d.dno
and d.dno in (select dno from department where dname = 'RESEARCH');

--15. 평균 급여보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오. 
select eno 사원번호, ename 이름, salary 급여
from employee
where salary > (select round (avg(salary)) from employee ) 
                    and dno in (select dno from employee where ename like '%M%');                    

--16. 평균 급여가 가장 적은 업무를 찾으시오.
select job 업무, avg(salary) 평균급여
from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

--17. 담당업무가 MANAGER인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select dno, job, ename
from employee
where dno in (select dno from employee where job = 'MANAGER');

