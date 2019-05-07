-- 문제 1. 사번이 10944인 사원의 이름은(전체 이름)
select concat(first_name, ' ', last_name) 'full name'
	from employees emp
where emp.emp_no = 100944;

-- 문제 2. 
-- 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 
-- 출력은 이름, 성별,  입사일 순서이고 “이름”, “성별”, “입사일로 컬럼 이름을 대체해 보세요.
select concat(first_name, ' ', last_name) 이름, gender 성별, hire_date 입사일
	from employees
order by hire_date asc;

-- 문제 3. 여직원과 남직원은 각 각 몇 명이나 있나요?
select gender, count(gender) 
	from employees 
group by gender;

-- 문제 4. 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
select count(*) 
	from salaries
where to_date = '9999-01-01';

-- 문제 5. 부서는 총 몇 개가 있나요?
select count(*) 
	from departments;
    
-- 문제 6. 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
select count(*) 
	from titles 
where title like '%manager%';

-- 문제 7. 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
select * 
	from departments 
order by length(dept_name) desc;

-- 문제 8. 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
select count(*) 
	from salaries 
where salary >= 120000
	and to_date = '9999-01-01';
    
-- 문제 9. 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요. 
select title
	from titles
group by title 
order by length(title) desc;

-- 문제 10. 현재 Enginner 직책의 사원은 총 몇 명입니까?
select count(*)
	from titles
where title = 'Engineer'
	and to_date = '9999-01-01';

-- 문제 11. 사번이 13250(Zeydy)인 직원의 직책 변경 상황을 시간순으로 출력해보세요.
select * 
	from titles 
where titles.emp_no = 13250
order by from_date asc;

