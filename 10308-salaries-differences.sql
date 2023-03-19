--https://platform.stratascratch.com/coding/10308-salaries-differences/discussion?code_type=3

SELECT
  ABS((SELECT max(salary)
   FROM db_employee emp
   JOIN db_dept dept ON emp.department_id = dept.id
   WHERE department = 'marketing') -
  (SELECT max(salary)
   FROM db_employee emp
   JOIN db_dept dept ON emp.department_id = dept.id
   WHERE department = 'engineering')) AS salary_difference;

--another approach
SELECT (MAX(sal)-MIN(sal))
FROM
(SELECT department, MAX(salary) as sal
FROM db_employee INNER JOIN db_dept
ON db_employee.department_id = db_dept.id
WHERE department IN ('marketing', 'engineering')
GROUP BY department) as a
