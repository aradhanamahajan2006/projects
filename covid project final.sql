-- Covid deaths

use covid_project;

select *
from CovidonlyDeaths
;

select continent, location, date, population, total_cases, total_deaths
from CovidonlyDeaths
where continent is not null
;


-- Multilevel Sorting by column numbers
select continent, location, date, population, total_cases, total_deaths
from CovidonlyDeaths
where continent is not null
order by 3,4
;

-- New cases percentage

select location, date, total_cases, new_cases, round((cast(new_cases as float)/cast(total_cases as float))*100,2) as new_cases_percentage
from CovidonlyDeaths
where continent is not null
order by 1
;

-- New cases average growth rate by location
select location, avg(round((cast(new_cases as float)/cast(total_cases as float))*100,2)) as new_cases_percentage
from CovidonlyDeaths
where continent is not null
group by location
order by 1
;

-- Total cases percentage by population (Infection rate)

select location, date, total_cases, population, round((cast(total_cases as float)/cast(population as float))*100,2) as Infection_rate_by_countries
from CovidonlyDeaths
where continent is not null
order by 1
;

-- Average infection rate via countries

select location,round(avg((cast(total_cases as float)/cast(population as float))*100),2) as Infection_rate_by_countries
from CovidonlyDeaths
where continent is not null
group by location
order by 2 desc
;

-- death percentage by total cases

select location, date, total_cases, total_deaths, round((cast(total_deaths as float)/cast(total_cases as float))*100,2) as death_percentage_dates
from CovidonlyDeaths
where continent is not null
order by 1
;

select location, round(avg((cast(total_deaths as float)/cast(total_cases as float))*100),2) as death_percentage_by_countries
from CovidonlyDeaths
where continent is not null
group by location
order by 2 desc
;

-- Death rate by population

select location, round(avg((cast(total_deaths as float)/cast(population as float))*100),2) as death_rate_by_countries_population
from CovidonlyDeaths
where continent is not null
group by location
order by 2 desc
;