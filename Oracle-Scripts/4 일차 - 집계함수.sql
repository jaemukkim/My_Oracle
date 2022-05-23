-- 4일차
/*
    그룹함수 : 동일한 값에 대해서 그룹핑해서 처리하는 함수
    group by 절에 특정 컬럼을 정의 할 경우, 해당 컬럼의 동일한 값들을 그룹핑해서 연산을 적용.
    
    집계함수 : 
        - SUM : 그룹의 합계
        - AVG : 그룹의 평균
        - MAX : 그룹의 최대값
        - MIN : 그룹의 최소값
        - COUNT : 그룹의 총 개수 ( 레코드 수 record, 로우 수 row )    
*/

select sum (salary), round( avg(salary),2 ), max(salary), min(salary)
from employee;

-- 주의 : 집계 함수를 처리할 때, 출력 컬럼이 단일 값으로 나오는 컬럼을 정의

select sum (salary)
from employee;

select ename
from employee;

select * from employee;

-- 집계함수는 null 값을 처리해서 연산한다.
select sum (commission), avg(commission), max (commission), min (commission)
from employee; 

-- count () : 레코드 수 , 로우 수
    -- NULL 은 카운트 하지 않는다.
    -- 테이블의 전체 레코드 수를 가져올 경우 : count(*) 또는 NOT NULL 컬럼을 count()
    -- 
    
desc employee;    

select eno from employee;
select count (eno) from employee;

select commission from employee;
select count(commission) from employee;

select count (*) from employee; -- (*) ==> 모든 컬럼
select * from employee;

--전체 레코드 카운트
select count(*) from employee;
select count(eno) from employee;

-- 중복되지 않는 직업의 개수

select job from employee;

select count (distinct job) from employee;

-- 부서의 개수 (dno)

select count (distinct dno) from employee;

-- Group by : 특정 컬럼의 값을 그룹핑 한다. 주로 집계 함수를 select 절에서 같이 사용한다.
/*              동일한 값을 그룹핑
    select 컬럼명, 집계함수 처리된 컬럼
    from 테이블
    where 조건
    group by 컬럼명
    having 조건 ( group by 한 결과의 조건)
    order by 정렬
*/ 

-- 부서별 평균 급여.
select dno as 부서번호, round (avg(salary), 2) as 평균급여
from employee
group by dno;       -- dno 컬럼의 중복된 것을 그룹핑한다.

select dno from employee order by dno;

-- 전체 평균 급여.
select avg (salary) as 평균급여
from employee;

-- group by를 사용하면서 select 절에 가져올 컬럼을 잘 지정해야 한다.
select dno , count(dno), sum (salary), avg(salary), max(commission), min(commission)
from employee
group by dno;

--
select job from employee;

-- 동일한 직책을 그룹핑해서 월급의 평균, 합계, 최대값, 최소값을 출력.
select job, count(job),round (avg(salary), 2) 평균, sum(salary) 합계, max(salary) 최대값, min(salary) 최소값
from employee
group by job;   -- 동일한 직책을 그룹핑해서 집계를 한다.

-- 여러 컬럼을 그룹핑 하기

select dno, job, count(*), sum(salary)
from employee
group by dno, job;    -- 두 컬럼 모두 일치하는 것을 그룹핑

select dno, job
from employee
where dno = 20 and job = 'CLERK';

-- having : group by 에서 나온 결과를 조건으로 처리할 때.
    -- 별칭 이름을 조건으로 사용하면 안된다.
    

-- 부서별 월급의 합계가 9000 이상인 것만 출력.
select dno, count(*), sum(salary) as 부서별합계, round (avg(salary), 2) as 부서별평균
from employee
group by dno
having sum(salary) > 9000;


-- 부서별 월급의 평균이 2000 이상만 출력.

select dno, count(*), sum(salary) as 부서별합계, round (avg(salary), 2) as 부서별평균
from employee
group by dno
having avg(salary) > 2000; 

-- where 와 having 절이 같이 사용되는 경우
    -- where : 실제 테이블의 조건으로 검색
    -- having : group by 결과에 대해서 조건을 처리
    
select * from employee;

-- 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력

select dno, count(*), round (avg(salary)) as 부서별평균
from employee
where salary > 1500
group by dno
having round (avg(salary)) > 2500;


-- ROLLUP
-- CUBE
    -- Group by 절에서 사용하는 특수한 함수
    -- 여러 컬럼을 나열 할 수 있다.
    -- group by 절의 자세한 정보를 출력..

--Rollup, cube 를 사용하지 않은 경우
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by dno
order by dno;

--Rollup : 부서별 합계와 평균을 출력 후, 마지막 라인에 전체 합계, 평균
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by rollup(dno)
order by dno;

-- cube : 부서별 합계와 평균을 출력 후, 마지막 라인에 전체 합계, 평균
select dno, count(*),sum(salary), round(avg(salary))
from employee
group by cube(dno)
order by dno;

-- Rollup : 두 컬럼이상
select dno, job, count(*), MAX(salary), sum(salary)
from employee
group by rollup(dno,job);        -- 두개의 컬럼이 적용됨, 두 컬럼에 걸쳐서 동일할 때 그룹핑.

select dno, job, count(*), MAX(salary), sum(salary)
from employee
group by cube (dno,job)
order by dno,job;

--JOIN : 여러 테이블을 합쳐서 각 테이블의 컬럼을 가져온다.
    -- department 와 employee는 원래는 하나의 테이블이었으나 모델링(중복제거, 성능향상을 통해서 두 테이블을 분리
    -- 두 테이블의 공통키 컬럼 (dno), employee 테이블의 dno 컬럼은 department 테이블의 dno 컬럼을 참조한다.
    -- 두 개 이상의 테이블의 컬럼을 JOIN 구문을 사용해서 출력.
    
    
select * from department;   -- 부서정보를 저장하는 테이블
select * from employee;     -- 사원정보를 저장하는 테이블


-- EQUI JOIN : 오라클에서 제일 많이 사용하는 JOIN , Oracle 에서만 사용가능
    -- from 절  : 조인할 테이블을 "," 로 처리,
    -- where 절 : 두 테이블의 공통의 키 컬럼을 " = " 로 처리
        -- and 절  : 조건을 처리
   
    
        
-- where 절 : 공통 키 컬럼을 처리한 경우
select *
from  employee, department
where department.dno = employee.dno
and job = 'MANAGER';

-- ANSI 호환 : [INNER] JOIN       <== 모든 SQL에서 사용 가능한 JOIN
-- ON 절 : 공통 키 컬럼을 처리한 경우
    -- on 절 : 두 테이블의 공통의 키 컬럼을 " = " 로 처리
        -- where 절 : 조건을 처리

select *
from employee e INNER join department d   -- INNER 생략 가능
on e.dno = d.dno
where job = 'MANAGER';

-- JOIN시 테이블 알리어스 ( 테이블 이름을 별칭으로 두고 많이 사용)
select *
from employee  e, department d
where e.dno = d.dno 
and salary > 1500;

-- select 절에서 공통 키 컬럼을 출력시에 어느 테이블의 컬럼인지 명시 : dno
select eno, job, e.dno, dname
from employee e, department d
where e.dno = d.dno;

-- 두 테이블을 JOIN 해서 부서명(dname)으로 월급의 최대값을 부서명으로 출력해 보세요.
select dname, count(*), max(salary)
from department d, employee e
where d.dno = e.dno
group by dname;

-- NATURAL JOIN : Oracle 9i 지원
    -- EQUI JOIN 의 Where 절을 없앰 : 두 테이블의 공통의 키 컬럼을 정의 " = "
    -- 공통의 키 컬럼을 Oracle 내부적으로 자동으로 감지해서 처리.
    -- 공통 키컬럼을 별칭 이름을 사용하면 오류가 발생.
    -- 반드시 공통 키 컬럼은 데이터 타입이 같아야 한다.
    -- from 절에 nature join 키워드를 사용.    
    
select e.eno, e.ename, d.dname, dno
from employee e natural join department d;

-- 주의 : select 절의 공통키 컬럼을 출력시 테이블명을 명시하면 오류 발생.

-- EQUI JOIN vs NATUARL JOIN 의 공통 키 컬럼 처리
    -- EQUI JOIN : select 에서 반드시 공통 키 컬럼을 출력할 때 테이블명을 반드시 명시.
    -- NATURAL JOIN : select 에서 반드시 공통 키 컬럼을 출력하 때 테이블명을 반드시 명시하지 않아야한다.
    
-- EQUI     
select ename, salary, dname, e.dno  -- e.dno : EQUI JOIN 에서는 명시 O
from employee e, department d
where e.dno = d.dno
and salary > 2000;   -- and

-- NATUAL JOIN
select ename, salary, dname, dno    -- natural join 에서는 명시 X
from employee e natural join department d
where salary > 2000;

-- ANSI : INNER JOIN
select ename, salary, dname, e.dno  -- e.dno 명시
from employee e join department d
on e.dno = d.dno
where salary > 2000;

--NON EQUI JOIN : EQUI JOIN에서 where 절의 "=" 를 사용하지 않는 JOIN

select * from salgrade;  -- 월급의 등급을 표시하는 테이블

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

-- 테이블 3개 조인

select ename, dname, salary, grade
from employee e, department d, salgrade s
where e.dno = d.dno 
and salary between losal and hisal;



-- Self join : 자기 자신의 테이블을 조인 한다. (주로 사원의 상사 정보를 출력할 때 사용함. 조직도 ,.)
    -- 별칭을 반드시 사용해야 한다. 

select eno, ename, manager
from employee
where manager = 7788;

-- Self JOIN을 사용해서 사원의 직속 상관 이름을 출력
select e.eno 사원번호 ,e.ename as "사원 이름" , e.manager 직속상관번호 , m.ename as "직속상관이름" 
from employee e, employee m     --Self join : 
where e.manager = m.eno
order by e.ename asc;

select eno, ename, manager, eno, ename
from employee;

-- ANSI 호환 : INNER JOIN 으로 처리, / ON
select e.eno 사원번호, e.ename 사원명, e.manager 직속상관번호, m.ename 직속상관
from employee e inner join employee m
on e.manager = m.eno
order by e.ename ;

-- EQUI JOIN - SELF JOIN 처리
select e.ename || '의 직속상관은 ' || e.manager || ' 입니다.' 
from employee e, employee m
where e.manager = m.eno
order by e.ename asc;

-- ANSI 호환 : INNER JOIN
select e.ename || '의 직속상관은 ' || e.manager || ' 입니다.' 
from employee e inner join employee m
on e.manager = m.eno
order by e.ename asc;


-- OUTER JOIN :
    -- 특정 컬럼의 두 테이블에서 공통적이지 않는 내용을 출력해야 할 때
    -- 공통적이지 않는 컬럼은 NULL 출력 
    -- + 기호를 사용해서 출력 : Oracle
    -- ANSI 호환 : OUTER JOIN 구문을 사용해서 출력 ==> 모든 DBMS 에서 호환.

-- Oracle     
select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno (+)
order by e.ename;

--ANSI 호환을 사용해서 출력
    -- Left Outer JOIN : 공통적인 부분이 없더라도 왼쪽은 무조건 모두 출력
    -- Right Outer JOIN : 공통적인 부분이 없더라도 오른쪽은 무조건 모두 출력
    -- FULL Outer JOIN : 공통적인 부분이 없더라도 양쪽 모두 무조건 모두 출력
select e.ename, m.ename
from employee e left outer join employee m
on e.manager = m.eno
order by e.ename;








