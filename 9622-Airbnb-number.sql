--https://platform.stratascratch.com/coding/9622-number-of-bathrooms-and-bedrooms?code_type=3

select city, AVG(bedrooms), AVG(bathrooms), property_type
from airbnb_search_details
GROUP by city, property_type
ORDER BY city;
