----------------------- Christiano Ronaldo - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch

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
where (season = '2008/2009' or season = '2015/2016') and (team_api_id ='8633'or team_api_id ='10260')
group by team_api_id, team_long_name
),

Tabela1 as 
(select *
from Tabela
union
select 
'Cristiano Ronaldo' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych2,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych2
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '30893' and (team_api_id ='8633' or team_api_id ='10260')
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
order by team_long_name, Zawodnik),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2
order by team_long_name , Zawodnik)

select * from TABELA_WYNIKI;

-------------------------------- MESSI - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch

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
where (season = '2008/2009' or season = '2015/2016') and team_api_id ='8634'
group by team_api_id, team_long_name),

Tabela1 as 
(select *
from Tabela
union
select 
'Lionel Messi' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '30981' and team_api_id ='8634'
group by team_api_id, team_long_name
order by team_long_name , Zawodnik
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
order by team_long_name, Zawodnik),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2)

select * from TABELA_WYNIKI


-------------------------------- Neymar - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch

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
where (season = '2008/2009' or season = '2015/2016') and team_api_id ='8634'
group by team_api_id, team_long_name),

Tabela1 as 
(select *
from Tabela
union
select 
'Neymar' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '19533' and team_api_id ='8634'
group by team_api_id, team_long_name
order by team_long_name , Zawodnik
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
order by team_long_name, Zawodnik),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2)

select * from TABELA_WYNIKI

-------------------------------- Suarez - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch

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
where (season = '2008/2009' or season = '2015/2016') and (team_api_id ='8634'or team_api_id ='8593' or team_api_id = '8650')
group by team_api_id, team_long_name),

Tabela1 as 
(select *
from Tabela
union
select 
'Luis Suarez' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '40636' and (team_api_id ='8634'or team_api_id ='8593' or team_api_id = '8650')
group by team_api_id, team_long_name
order by team_long_name , Zawodnik
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
order by team_long_name, Zawodnik),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2)

select * from TABELA_WYNIKI


-------------------------------- Neuer - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch
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
where (season = '2008/2009' or season = '2015/2016') and (team_api_id ='9823'or team_api_id ='10189')
group by team_api_id, team_long_name),

Tabela1 as 
(select *
from Tabela
union

select 
'Manuel Neuer' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '27299' and (team_api_id ='9823'or team_api_id ='10189')
group by team_api_id, team_long_name
order by team_long_name , Zawodnik
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
order by team_long_name, Zawodnik),

TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2)

select * from TABELA_WYNIKI


-------------------------------- Robben - wyniki meczów z jego udziałem i bez; % meczów wygranych/przegranych/zremisowanch
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
where (season = '2008/2009' or season = '2015/2016') and (team_api_id ='8633'or team_api_id ='9823')
group by team_api_id, team_long_name),

Tabela1 as 
(select *
from Tabela
union

select 
'Arjen Robben' as Zawodnik,
team_long_name,
count(distinct m.match_api_id) as Liczba_meczow2,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.home_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.away_team_api_id = team_api_id) then m.match_api_id end) as Liczba_wygranych,
count(distinct case when m.home_team_goal = m.away_team_goal then m.match_api_id end) as Remisy,
count(distinct case when (m.home_team_goal > m.away_team_goal and m.away_team_api_id = team_api_id) or (m.home_team_goal < m.away_team_goal and m.home_team_api_id = team_api_id) then m.match_api_id end) as Liczba_przegranych
from "Match" m
join match_player mp on mp.match_api_id = m.match_api_id 
left join player_attributes pa on pa.player_api_id = mp.player_api_id
left join team t on t.team_api_id = m.home_team_api_id or t.team_api_id = m.away_team_api_id
where (season = '2008/2009' or season = '2015/2016') and mp.player_api_id = '30834' and (team_api_id ='9823'or team_api_id ='8633')
group by team_api_id, team_long_name
order by team_long_name , Zawodnik
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
order by team_long_name, Zawodnik),


TABELA_WYNIKI as 
(select *,
round(liczba_wygranych/liczba_meczow::numeric *100, 2) as Procent_wygranych,
round(remisy/liczba_meczow::numeric *100, 2) as Procent_remisow,
round(liczba_przegranych/liczba_meczow::numeric *100,2) as Procent_przegranych
from Tabela2)

select * from TABELA_WYNIKI

