------------------------------------------------- Tabela zbiorcza - wszystkie kombinacje TOP 6 piłkarzy i drużyn w których grali w latach 2006 - 2016
with T1 AS
(select player_name, mp.match_api_id, pa.date, 
case when mp.player_api_id in (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11) then m.home_team_api_id
else m.away_team_api_id end as Drużyna
from match_player mp
join player_attributes pa on mp.player_api_id = pa.player_api_id 
join "Match" m on mp.match_api_id = m.match_api_id 
where mp.player_api_id = '30981' or mp.player_api_id = '30893' or mp.player_api_id = '19533' or mp.player_api_id = '40636' or mp.player_api_id = '27299'
or mp.player_api_id = '30834' or mp.player_api_id = '107417' or mp.player_api_id = '35724' or mp.player_api_id = '93447' or mp.player_api_id = '37412' or mp.player_api_id = '36378'
order by date, mp.match_api_id),

WYNIKI as
(select T1.*,
t.team_long_name
from T1
join team t on t.team_api_id = t1.Drużyna)

select distinct Drużyna, team_long_name, player_name from WYNIKI
order by player_name