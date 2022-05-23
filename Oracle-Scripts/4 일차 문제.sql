-- 그룹 함수 문제
select * from employee;
-- 1. 모든 사원의 급여 최고액,최저액,총액,및 평균 급여를 출력. 평균에 대해서는 정수로 반올림
select  max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee;

--2. 각 담당업무 유형별로 급여 최고액,최저액,총액 및 평균액을 출력. 평균에 대해서는 정수로 반올림
select  job, count(*),max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee
group by job;

--rollup , cube : group by 절에서 사용하는 특수한 키워드
select  job, count(*), max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee
group by rollup (job);

select  job, count(*),max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee
group by cube (job)
order by job;

--두 개 이상의 컬럼을 그룹핑
select  dno,job, count(*),max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee
group by dno,job
order by dno;

select  dno,job, count(*),max(salary) 최고액 , min(salary) 최저액 , sum(salary) 총액, round(avg(salary),0) 평균
from employee
group by cube(dno,job)
order by dno;

--3. count(*) 함수를 사용하여 담당 업무가 동일한 사원수를 출력
select job , count(*)
from employee
group by job;

--4. 관리자 수를 나열
select  manager , count(*)
from employee
group by manager;

--5. 급여 최고액, 최저 급여액의 차액을 출력. 컬럼의 별칭은 "DIFFERENCE"로 지정
select  max(salary)- min(salary) as DIFFERENCE
from employee ;


--6. 직급별 사원의 최저 급여를 출력. 관리자를 알 수 없는 사원 및 최저급여가 2000미만인 그룹은 제외,
                -- 급여에 대한 내림차순 출력
select job , min(salary)
from employee
where salary is not null and salary > 2000
group by job
order by min(salary) desc;
                
--7. 각 부서에 대해 부서번호,사원수,부서내의 모든 사원의 평균 급여 출력. 컬럼별칭[부서번호,사원수,평균급여]로
                -- 부여하고 평균급여는 소수점 2째자리까지 반올림
select dno 부서번호, count(ename) 사원수 , round(avg(salary),2) 평균급여
from employee
group by dno;
                
--8. 각 부서에 대해 부서번호이름,지역명,사원수,부서내의 모든 사원의 평균 급여 출력. 평균급여 정수로 반올림.                
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




