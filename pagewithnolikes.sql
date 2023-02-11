--https://datalemur.com/questions/sql-page-with-no-likes
SELECT p.page_id FROM pages as p
LEFT OUTER JOIN page_likes as pl on p.page_id=pl.page_id
where pl.page_id IS NULL
;
