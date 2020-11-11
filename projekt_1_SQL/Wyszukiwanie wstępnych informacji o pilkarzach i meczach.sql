------------------------------------------ Messi zestawienie wszystkich meczy na przestrzeni lat
with T1 AS
(select player_name, mp.match_api_id, pa.date, home_team_api_id, away_team_api_id 
from match_player mp
join player_attributes pa on mp.player_api_id = pa.player_api_id 
join "Match" m on mp.match_api_id = m.match_api_id 
where mp.player_api_id = '30981'
order by date, mp.match_api_id),

WYNIKI as
(select T1.*,
t.team_long_name
from T1
join team t on t.team_api_id = T1.home_team_api_id or t.team_api_id = T1.away_team_api_id)

select * from WYNIKI

------------ Sprawdzenie liczby tych meczów
select
count(match_api_id)
from match_player mp 
where player_api_id = '30981'

--- Lewandowski liczba meczy

select
count(match_api_id)
from match_player mp 
where player_api_id = '93447'


------------------------------------------ Rooney zestawienie wszystkich meczy na przestrzeni lat

with T1 AS
(select player_name, mp.match_api_id, pa.date, 
case when mp.player_api_id in (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11) then m.home_team_api_id
else m.away_team_api_id end as Drużyna
from match_player mp
join player_attributes pa on mp.player_api_id = pa.player_api_id 
join "Match" m on mp.match_api_id = m.match_api_id 
where mp.player_api_id = '30829'
order by date, mp.match_api_id),

WYNIKI as
(select T1.*,
t.team_long_name
from T1
join team t on t.team_api_id = t1.Drużyna)

select * from WYNIKI

--------------------------- Liczba meczów różnych drużyn
select 
count(distinct match_api_id)
from "Match"
where home_team_api_id = '10260' or away_team_api_id = '10260'

select 
count(distinct match_api_id)
from "Match"
where home_team_api_id = '8633' or away_team_api_id = '8633'

select 
count(distinct match_api_id)
from "Match"
where home_team_api_id = '9823' or away_team_api_id = '9823'
