--Importation des données dans la table hr
\copy hr (id, first_name, last_name, birthdate, gender, race, department, jobtitle, location, hire_date, termdate, lo
cation_city, location_state)from 'C:\Users\DELL E5580\Downloads\Video\SQL+POWERBI\Human Resources.csv'delimiter ','csv header;

--Vue d'ensemble sur les données
select * from hr;

alter table hr
alter column id type varchar(20);

--********************1 Colonne birthdate
begin;
update hr
set birthdate = case
	when birthdate ~ '/' then 
		case
			WHEN length(birthdate) = 8 THEN to_char(to_date(birthdate, 'MM/DD/YY'), 'YYYY-MM-DD')
			else to_char(to_date(birthdate, 'MM/DD/YYYY'), 'YYYY-MM-DD')
		end
	when birthdate ~ '-' then
		case
			WHEN length(birthdate) = 8 THEN to_char(to_date(birthdate, 'MM-DD-YY'), 'YYYY-MM-DD')
			else to_char(to_date(birthdate, 'MM-DD-YY'), 'YYYY-MM-DD')
		end
	else NULL
end;

ALTER TABLE hr
ALTER COLUMN birthdate TYPE DATE USING birthdate::DATE;

--Après avoir remarqué des année supérieur à 2050 il fallait corriger cet erreur
update hr
SET birthdate = CASE
    WHEN birthdate > '2050-01-01' THEN (birthdate - interval '100 years')
    ELSE birthdate
END;

commit;
select birthdate from hr;


--******************2 colonne hire_date
begin;
update hr
set hire_date = case
	when hire_date ~ '/' then 
		case
			WHEN length(hire_date) = 8 THEN to_char(to_date(hire_date, 'MM/DD/YY'), 'YYYY-MM-DD')
			else to_char(to_date(hire_date, 'MM/DD/YYYY'), 'YYYY-MM-DD')
		end
	when hire_date ~ '-' then
		case
			WHEN length(hire_date) = 8 THEN to_char(to_date(hire_date, 'MM-DD-YY'), 'YYYY-MM-DD')
			else to_char(to_date(hire_date, 'MM-DD-YY'), 'YYYY-MM-DD')
		end
	else NULL
end;

ALTER TABLE hr
ALTER COLUMN hire_date TYPE DATE USING hire_date::DATE;

commit;
select hire_date from hr;


--*************************3 Colonne termdate
begin;
UPDATE hr
SET termdate = to_char(TO_TIMESTAMP(termdate, 'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD');

ALTER TABLE hr
ALTER COLUMN termdate TYPE DATE USING termdate::DATE;
end;
commit;

select termdate from hr;


--*********************** Création de la colonne âge et mise à jour
begin;
alter table hr add column age int;

update hr
	set age = extract(year from age(birthdate))::int;
end;
select birthdate, age from hr;
commit;

--******************** Selection de l'employé le plus jeune ainsi que l'employé le plus agé
select 
	min(age) as youngest,
	max(age) as oldest
from hr;
