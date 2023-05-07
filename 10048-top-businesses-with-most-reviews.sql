--https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?code_type=3

SELECT name, review_count
FROM yelp_business
ORDER BY review_count DESC
LIMIT 5;
