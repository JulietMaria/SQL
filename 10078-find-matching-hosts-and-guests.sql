--https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=3

SELECT DISTINCT(host_id), guest_id
FROM airbnb_hosts h
JOIN airbnb_guests g
ON h.nationality = g.nationality
AND h.gender = g.gender;


select distinct host_id, guest_id from airbnb_hosts inner join airbnb_guests using(nationality, gender) ;
