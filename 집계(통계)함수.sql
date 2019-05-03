-- 집계(통계) 함수

  select emp_no, avg(salary) as avg_salary
    from salaries
   where from_date like '1985%' 
group by emp_no
  having avg_salary > 1000;