------------------- Lewandowski - statystyki - mecze wygrane/przegrane/zremisowane w całej karierze
with Tabela AS
(
select 
'Razem' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where team_api_id ='2182'or team_api_id ='9823' or team_api_id ='9789'
group by team_api_id, team_long_name
),

Tabela1 as 
(select *
from Tabela
union
select 
'Robert Lewandowski' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych2,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych2
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where mp.player_api_id = '93447' and (team_api_id ='2182'or team_api_id ='9823' or team_api_id ='9789')
group by team_api_id, team_long_name
),

TABELA2 as 
(select *
from Tabela1
union
select
'Bez zawodnika' as Zawodnik,
Tabela1.team_long_name,
(Tabela.Liczba_meczow - Tabela1.Liczba_meczow) as Liczba_meczow,
(Tabela.Liczba_wygranych - Tabela1.Liczba_wygranych),
(Tabela.Remisy - Tabela1.Remisy),
(Tabela.Liczba_przegranych - Tabela1.Liczba_przegranych)
from Tabela1, Tabela
where Tabela.team_long_name = Tabela1.team_long_name and (Tabela.Liczba_meczow - Tabela1.Liczba_meczow) <> 0
order by team_long_name, Liczba_meczow),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2
order by team_long_name , Liczba_meczow)

select * from TABELA_WYNIKI;

---------------------------------- Information VALUE LEWANDOWSKI

with Tabela AS
(
select 
'Razem' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where team_api_id ='2182'or team_api_id ='9823' or team_api_id ='9789'
group by team_api_id, team_long_name
),

Tabela1 as 
(select *
from Tabela
union
select 
'Robert Lewandowski' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych2,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych2
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where mp.player_api_id = '93447' and (team_api_id ='2182'or team_api_id ='9823' or team_api_id ='9789')
group by team_api_id, team_long_name
),

TABELA2 as 
(select *
from Tabela1
union
select
'Bez zawodnika' as Zawodnik,
Tabela1.team_long_name,
(Tabela.Liczba_meczow - Tabela1.Liczba_meczow) as Liczba_meczow,
(Tabela.Liczba_wygranych - Tabela1.Liczba_wygranych),
(Tabela.Remisy - Tabela1.Remisy),
(Tabela.Liczba_przegranych - Tabela1.Liczba_przegranych)
from Tabela1, Tabela
where Tabela.team_long_name = Tabela1.team_long_name and (Tabela.Liczba_meczow - Tabela1.Liczba_meczow) <> 0),

TAB2 as 
(select *,
sum(Liczba_wygranych) over(partition by Zawodnik) as Wygrane,
sum(Liczba_przegranych) over(partition by Zawodnik) as Przegrane
from TABELA2
where Zawodnik <> 'Razem'),

TAB3 as 
(select *,
liczba_wygranych/Wygrane as DG,
liczba_przegranych/Przegrane as DB
from TAB2),

TAB4 as 
(select *,
ln(DG/DB) as WOE,
DG-DB as Roznica,
(DG-DB)* ln(DG/DB) as Mnozenie
from TAB3),

TAB5 AS
(select *,
sum(Mnozenie) over () InormationVAlue
from TAB4)

select * from TAB5
order by team_long_name, Zawodnik
