--https://platform.stratascratch.com/coding/9726-classify-business-type?code_type=3

SELECT
    DISTINCT business_name
    , CASE
        WHEN business_name LIKE '%restaurant%' THEN 'restaurant'
        WHEN business_name LIKE '%cafe%'
            OR business_name LIKE '%café%'
            OR business_name LIKE '%coffee%' THEN 'cafe'
        WHEN business_name LIKE '%school%' THEN 'school'
        ELSE 'other'
    END AS business_type
FROM sf_restaurant_health_violations;

--another solution
select distinct business_name,(case 
when lower(business_name) REGEXP 'restaurant' then 'restaurant'
when lower(business_name) REGEXP ('cafe|café|coffee') then 'cafe'
when lower(business_name) REGEXP 'school' then 'school'
else 'other'
end) as type
from sf_restaurant_health_violations;
