--https://leetcode.com/problems/classes-more-than-5-students/description/

select class
 from Courses 
 group by class
 having count(*) >=5;
