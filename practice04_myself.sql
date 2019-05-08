-- 문제 1. 
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까? 
select avg(salary) 
	from salaries
where to_date = '9999-01-01';
-- 답 '107706명'
select count(*) 
	from employees emp, salaries sal 
where emp.emp_no = sal.emp_no
    and sal.salary > (select avg(salary) 
							from salaries 
					  where to_date = '9999-01-01')
;
-- 문제 2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 
-- 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.emp_no 사원번호 ,concat(d.first_name,' ',d.last_name) 이름,c.dept_name 부서,  max(a.salary) 연봉
	from salaries a, dept_emp b, departments c, employees d  
where a.emp_no = b.emp_no 
	and a.emp_no = d.emp_no 
    and b.dept_no = c.dept_no 
    and a.to_date = '9999-01-01' 
    and b.to_date = '9999-01-01' 
group by b.dept_no
order by 연봉 desc
;
-- 답    
select  a.emp_no 사원번호 ,concat(a.first_name,' ',a.last_name) 이름, d.dept_name 부서, max_salary 연봉 
	from employees a, dept_emp b, salaries c, departments d, (SELECT 
													c.dept_no AS dept_no, max(b.salary) AS max_salary
												FROM
													employees a, salaries b, dept_emp c
												WHERE
													a.emp_no = b.emp_no
														AND a.emp_no = c.emp_no
														AND b.to_date = '9999-01-01'
														AND c.to_date = '9999-01-01'
												GROUP BY c.dept_no) e  
where a.emp_no = b.emp_no 
	and c.salary = e.max_salary 
    and a.emp_no = c.emp_no 
    and b.dept_no = e.dept_no 
    and b.dept_no = d.dept_no 
order by c.salary desc;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select c.dept_no, avg(salary) 
	from employees a, salaries b, dept_emp c 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
    and b.to_date = '9999-01-01' 
    and c.to_date = '9999-01-01' 
group by c.dept_no;
-- 답
select a.emp_no 사번, concat(a.first_name, ' ', a.last_name) 이름, b.salary 연봉, e.dept_name 부서, d.avg_salary 부서평균  
	from employees a, salaries b, dept_emp c, (select c.dept_no, avg(salary) avg_salary
													from employees a, salaries b, dept_emp c 
												where a.emp_no = b.emp_no 
													and a.emp_no = c.emp_no 
													and b.to_date = '9999-01-01' 
													and c.to_date = '9999-01-01' 
												group by c.dept_no) d, departments e 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
    and c.dept_no = d.dept_no
    and b.salary > d.avg_salary
    and c.dept_no = e.dept_no 
    and b.to_date = '9999-01-01' 
    and c.to_date = '9999-01-01' 
order by a.emp_no desc
;

-- 문제 4.
-- 현재 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요
select b.dept_no, concat(a.first_name, ' ', a.last_name) manager_name, c.dept_name dept_name 
	from employees a, dept_manager b, departments c 
where a.emp_no = b.emp_no 
	and b.dept_no = c.dept_no 
    and b.to_date = '9999-01-01';

-- 답
select a.emp_no 사번, concat(a.first_name, ' ', a.last_name) 이름, d.manager_name 매니저, d.dept_name 부서
	from employees a, dept_emp b, departments c, 
    (select b.dept_no, concat(a.first_name, ' ', a.last_name) manager_name, c.dept_name dept_name 
		from employees a, dept_manager b, departments c 
	where a.emp_no = b.emp_no 
		and b.dept_no = c.dept_no 
		and b.to_date = '9999-01-01') d
where a.emp_no = b.emp_no 
	and b.dept_no = c.dept_no 
    and c.dept_no = d.dept_no
    and b.to_date = '9999-01-01' 
;

-- 문제 5. 
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select c.dept_no, max(b.salary) max_salary
	from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no 
group by c.dept_no
order by max_salary desc
limit 0,1;

-- 답
select a.emp_no 사번, concat(a.first_name, ' ', a.last_name) 이름, b.title 직책, c.salary 연봉  
	from employees a, titles b, salaries c, 
    (select c.dept_no dept_no, max(b.salary) max_salary
		from employees a, salaries b, dept_emp c
	where a.emp_no = b.emp_no 
		and a.emp_no = c.emp_no 
	group by c.dept_no
	order by max_salary desc
	limit 0,1) d, dept_emp e 
where a.emp_no = b.emp_no 
	and a.emp_no = c.emp_no
    and a.emp_no = e.emp_no 
    and d.dept_no = e.dept_no 
    and b.to_date = '9999-01-01' 
order by c.salary;

-- 문제 6. 
-- 평균 연봉이 가장 높은 부서는? 
select c.dept_no dept_no, max(b.salary) max_salary
		from employees a, salaries b, dept_emp c
	where a.emp_no = b.emp_no 
		and a.emp_no = c.emp_no 
	group by c.dept_no
	order by max_salary desc
	limit 0,1



