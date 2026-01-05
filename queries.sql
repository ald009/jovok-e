
-- melyik jatekos a legmegbizhatóbb
select name, reliability_rate from players order by reliability_rate desc;

-- hányan jönnek várhatóan a következő edzésekre
select event_name, expected_members from events order by event_name asc;

-- melyik napokon van legjobb részvételi arány
select real_members, expected_members, real_members / expected_members as részvételi_arány from events order by részvételi_arány desc;