-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
select emp.emp_no 사번, concat(first_name,' ',last_name) 이름, salary 연봉 
	from employees emp, salaries sal 
where emp.emp_no = sal.emp_no
	and sal.to_date = '9999-01-01'
order by sal.salary desc;

-- 문제 2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
select e.emp_no 사번, concat(first_name,' ',last_name) 이름, t.title 직책
	from employees e, titles t 
where e.emp_no = t.emp_no
	and t.to_date = '9999-01-01' 
order by 이름;

-- 문제 3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요.
select a.emp_no 사번, concat(first_name,' ',last_name) 이름, c.dept_name 직책 
	from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no 
	and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01' 
order by 이름;

-- 문제 4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.   
select a.emp_no 사번, concat(first_name,' ',last_name) 이름, b.salary 연봉, c.title 직책, e.dept_name 부서 
	from employees a, salaries b, titles c, dept_emp d, departments e 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
    and a.emp_no = d.emp_no 
    and d.dept_no = e.dept_no
    and b.to_date = '9999-01-01' 
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
order by 이름;
	
-- 문제 5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 
-- 이름은 first_name과 last_name을 합쳐 출력 합니다.

select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름
	from titles t, employees e  
where t.emp_no = e.emp_no   
	and t.title = 'Technique Leader'
group by t.emp_no;

-- 문제 6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
select concat(a.first_name, ' ', a.last_name) 이름, d.dept_name 부서명, b.title 직책 
	from employees a, titles b, dept_emp c, departments d 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
    and c.dept_no = d.dept_no 
    and a.last_name like 'S%';

-- 문제 7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
select a.emp_no 사번, b.title 직책, c.salary 급여  
	from employees a, titles b, salaries c 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
    and b.title = 'Engineer' 
    and c.salary >= 40000 
    and c.to_date = '9999-01-01' 
order by c.salary desc;

-- 문제 8.
-- 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오.
select * 
	from employees a, titles b, salaries c 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no;
