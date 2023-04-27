--https://leetcode.com/problems/biggest-single-number/description/

SELECT
    MAX(num) AS num
FROM
    (SELECT
        num
    FROM
        MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1) AS t;

--another solution
select if(count(*) =1, num, null) as num from MyNumbers 
group by num order by count(*), num desc limit 1;
