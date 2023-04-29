--https://platform.stratascratch.com/coding/9917-average-salaries?code_type=3

select department,first_name,salary,
avg(salary) over(partition by department) as avg_salary
from employee;
