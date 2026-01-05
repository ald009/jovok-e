
-- melyik jatekos a legmegbizhatóbb
select name, reliability_rate from players order by reliability_rate desc;

-- hányan jönnek várhatóan a következő edzésekre
select event_name, expected_members from events order by event_name asc;

-- melyik napokon van legjobb részvételi arány
select real_members, expected_members, real_members / expected_members as részvételi_arány from events order by részvételi_arány desc;

-- mennyi pénzt költött a csapat pályabérlésre az elmúlt 3 hónabban?
select price, end_date from events where end_date >= timestampadd(month,-3, current_timestamp()) and end_date <= current_timestamp() ;
-- EZT MEG SUMMAZNI KELL NEM NEHEZ NIGGER