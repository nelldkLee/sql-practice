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
	
