--https://platform.stratascratch.com/coding/9991-top-ranked-songs?code_type=3


select trackname, count(position) top_pos 
from spotify_worldwide_daily_song_ranking 
where position = 1 
group by trackname 
order by top_pos desc;
