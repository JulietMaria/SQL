--https://datalemur.com/questions/frequent-callers

SELECT COUNT(policy_holder_id) AS member_count
FROM (
  SELECT
    policy_holder_id,
    COUNT(case_id) as call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
) AS call_records;
