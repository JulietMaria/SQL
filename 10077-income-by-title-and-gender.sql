--https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=3

SELECT employee_title, sex , AVG(se.salary + sb.bonus) AS avg_compensation
FROM sf_employee se 
JOIN  
(SELECT worker_ref_id, SUM(bonus) AS bonus
FROM sf_bonus GROUP BY worker_ref_id) AS sb
ON se.id = sb.worker_ref_id
GROUP BY 1, 2;

--another solution
-- columns needed: emp.id, emp.employee_title, emp.sex, emp.salary, bon.bonus, bon.worker_ref_id
-- 2 cte, bonus table with sum(bonus), emp table with necessary columns
-- left join both cte to join on worker_ref_id = id
-- output: emp.employee_title, emp.sex, AVG(emp.salary + sum(bonus))

WITH cte_bonus AS
    (SELECT worker_ref_id, SUM(bonus) as total_bonus
    FROM sf_bonus
    GROUP BY worker_ref_id),
    
    cte_emp AS
    (SELECT id, sex, employee_title, salary
    FROM sf_employee)
    
SELECT emp.employee_title, emp.sex, AVG(emp.salary + total_bonus) as avg_comp
FROM cte_bonus bon
LEFT JOIN cte_emp emp
ON bon.worker_ref_id = emp.id
GROUP BY emp.employee_title, emp.sex;
