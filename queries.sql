
-- melyik jatekos a legmegbizhatóbb
select name, reliability_rate from players order by reliability_rate desc;

-- hányan jönnek várhatóan a következő edzésekre
select event_name, expected_members from events order by event_name asc;

-- melyik napokon van legjobb részvételi arány
select real_members, expected_members, real_members / expected_members as részvételi_arány from events order by részvételi_arány desc;

-- mennyi pénzt költött a csapat pályabérlésre az elmúlt 3 hónabban?
select price, end_date from events where end_date >= timestampadd(month,-3, current_timestamp()) and end_date <= current_timestamp() ;
-- EZT MEG SUMMAZNI KELL NEM NEHEZ NIGGER

-- Nagy létszámú események
SELECT event_name, expected_members FROM events WHERE expected_members > 12;

-- Csapatok Budapetsről
SELECT team_name, home_city FROM teams WHERE home_city = 'Budapest';

-- Félprofi csapatok
SELECT team_name, level FROM teams WHERE level = 'félprofi';

-- Edzések listája
SELECT event_name, start_date FROM events WHERE event_type = 'Edzés';

-- Események maximális létszámmal
SELECT event_name, max_participation FROM events;

-- Játékosok névsorban
SELECT name FROM players ORDER BY name ASC;