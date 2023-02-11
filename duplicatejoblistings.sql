--https://datalemur.com/questions/duplicate-job-listings
WITH job_listings_rank 
AS (
  SELECT
    ROW_NUMBER() OVER (
      PARTITION BY company_id, title, description 
    ) AS ranking, 
    company_id, 
    title, 
    description 
  FROM job_listings
)

SELECT COUNT(*) as co_w_duplicate_jobs
FROM job_listings_rank where ranking>1;
