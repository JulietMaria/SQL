--https://leetcode.com/problems/tree-node/description/

select id, 
case when p_id is null then 'Root' 
when id in (select p_id from tree) then 'Inner' 
ELSE 'Leaf' 
end as type 
from Tree;
