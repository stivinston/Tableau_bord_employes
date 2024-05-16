-- QUESTIONS

-- 1. Quelle est la répartition par sexe des salariés dans l’entreprise ?
select gender, count(*) as count
from hr
group by gender;

-- 2. Quelle est la répartition raciale/ethnique des employés de l’entreprise ?
select race, count(*) as count
from hr
group by race
order by count(*) desc;

-- 3. Quelle est la répartition par âge des salariés dans l’entreprise ?
SELECT
    CASE
        WHEN age <  25 THEN 'Moins de 25 ans'
        WHEN age >= 25 AND age < 35 THEN '25-34 ans'
        WHEN age >= 35 AND age < 45 THEN '35-44 ans'
        WHEN age >= 45 AND age < 55 THEN '45-54 ans'
        ELSE '54 ans et plus'
    END AS tranche_age,
    COUNT(*) AS nombre_salarié
FROM
    hr
GROUP BY
    tranche_age
ORDER BY
    count(*) desc;

-- 3.1 Quelle est la répartition par âge et sexe des salariés dans l’entreprise ?
SELECT
    CASE
        WHEN age <  25 THEN '< 25'
        WHEN age >= 25 AND age < 35 THEN '25-34'
        WHEN age >= 35 AND age < 45 THEN '35-44'
        WHEN age >= 45 AND age < 55 THEN '45-54'
        ELSE '54 >'
    END AS tranche_age,
    COUNT(*) AS count
FROM
    hr
GROUP BY
    tranche_age
ORDER BY
    count(*) desc;

-- 4. Combien d’employés travaillent sur place par rapport a ceux qui travaillent à distance ?
select location, count(*) as count 
from hr
group by location;

-- 5. Quelle est la durée moyenne d’emploi des salariés licenciés ?
select 
	avg (age(termdate, hire_date)) as avg_length_employment
from hr;

-- 6. Comment la répartition par sexe varie-t-elle selon les départements et les titres de poste ?
select department, gender, count(*) as count
from hr
group by department, gender
order by department;

-- 7. Quelle est la répartition des fonctions au sein de l’entreprise ?
select jobtitle, count(*) as count
from hr
group by jobtitle
order by jobtitle;

-- 8. Quel département a le taux de licenciement le plus élevé ?
select department,
	total_count,
	terminated_count,
	 round(CAST(terminated_count AS DECIMAL) / CAST(total_count AS DECIMAL),2) as termination_rate
from (
	select department,
	count(*) as total_count,
	count(termdate) as terminated_count
	from hr
	group by department
	) as subquery
order by termination_rate desc;

-- 9. Quelle est la répartition des employés entre les sites, par ville et par État ?
select location_state, count(*) as count
from hr
group by location_state
order by count desc;


-- 10. Comment le nombre d'employés de l'entreprise a-t-il évolué au fil du temps, en fonction des dates d'embauche et de sortie ?
select
	year,
	hires,
	terminations,
	hires - terminations as net_change,
	round((CAST(hires as decimal) - cast(terminations as decimal))/hires * 100, 2) as net_change_percent
from(
	select 
		extract (YEAR from hire_date) as year,
		count(*) as hires,
		count(termdate) as terminations
	from hr
	group by year
	) as subquery
order by year asc;

-- 11. Quelle est la répartition des mandats pour chaque département ?
select department, round(avg(termdate - hire_date)/365, 0) as avg_ternure
from hr
group by department;
