--https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=3


select distinct fr.post_id,fr.poster,fp.post_text,fp.post_keywords,fp.post_date
from facebook_reactions fr
inner join facebook_posts fp
on fr.post_id=fp.post_id
where fr.reaction='heart'
;
