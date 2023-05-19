--https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices?code_type=3

-- columns needed: host_id (CONCAT(price, room_type, host_since, zipcode, number_of_reviews)), price, number_of_reviews
-- create host_id by concating above
-- use case when to categorize each host_id to pop_rating
-- subquery above to get the min, avg, max prices, grouped by pop_rating
-- output: pop_rating, minprice, avgprice, maxprice

SELECT pop_rating, MIN(price) as min, AVG(price) as avg, MAX(price) as max
FROM
    (
    SELECT 
    CONCAT(price, room_type, host_since, zipcode, number_of_reviews) as host_id, 
    price, 
        CASE
            WHEN number_of_reviews = 0 THEN 'New'
            WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
            WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
            WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
            WHEN number_of_reviews > 40 THEN 'Hot'
        END as pop_rating
    FROM airbnb_host_searches
    GROUP BY host_id
    ) sub
GROUP BY pop_rating;


--another solution
WITH new_view as(
SELECT
        concat(price, room_type, host_since, zipcode) AS host_id,
        number_of_reviews,
        price,
        CASE
            WHEN number_of_reviews =0 THEN 'New'
            WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
            WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
            WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
            WHEN number_of_reviews > 40 THEN 'Hot'
        END AS host_popularity
FROM airbnb_host_searches
GROUP BY 1,2,3)
SELECT host_popularity AS host_pop_rating,
        min(price) AS min_price,
        avg(price) AS avg_price,
        max(price) AS max_price
FROM new_view
Group by 1;
