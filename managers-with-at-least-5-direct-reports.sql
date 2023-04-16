--https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/


select name from employee 
where id in 
(select managerId from Employee
group by managerId
having count(managerId)>=5);
