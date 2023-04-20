--https://leetcode.com/problems/employee-bonus/description/

select name,bonus 
from Employee e left join Bonus b 
on e.empId=b.empId
where b.bonus<1000 or b.bonus is null;

--another solution
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId=b.empId
WHERE IFNULL(bonus, 0)<1000

SELECT name, bonus
FROM Employee LEFT JOIN Bonus USING(empId)
WHERE COALESCE(bonus, 0) < 1000; 
