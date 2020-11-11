select
mp.player_name,
pa.player_api_id,
max(pa.overall_rating) as Ranking,
max(pa.potential) as Potencjal
from match_player mp
join player_attributes pa on mp.player_api_id = pa.player_api_id
where date_part('year', date) = '2015' or date_part('year', date) = '2016'
group by pa.player_api_id, mp.player_name
having max(pa.overall_rating) is not null
order by max(pa.overall_rating) desc, max(pa.potential) desc
limit 11
