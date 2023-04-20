--Selecting required data for analysis

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM public.covid_deaths
ORDER BY 1,2

--Total cases vs total deaths in India

SELECT location, date, total_cases, total_deaths, ((total_deaths/total_cases)*100) AS percent_population_infected
FROM public.covid_deaths
WHERE location = 'India'

--Total cases vs Population

SELECT location, date, total_cases, population, (total_cases/population)*100 AS total_cases_percent
FROM public.covid_deaths
WHERE location = 'India'
ORDER BY 5 DESC

--Highest infected country 

SELECT location, population, MAX(total_cases) AS highest_cases,  MAX((total_cases/population)*100) AS total_cases_percent
FROM public.covid_deaths
GROUP BY location, population
ORDER BY 4 DESC

--Countries with highsest death counts per population with percent

SELECT location, population, MAX(total_deaths) AS highest_deaths, MAX((total_deaths/population)*100) AS death_percent
FROM public.covid_deaths
WHERE continent IS NOT NULL AND total_deaths IS NOT NULL
GROUP BY location, population
ORDER BY 4 DESC

--Countries with highest death counts per population

SELECT location, MAX(total_deaths) AS total_deaths
FROM public.covid_deaths
WHERE continent IS NOT NULL AND total_deaths IS NOT NULL
GROUP BY location
ORDER BY total_deaths DESC

--Continents with highest death count

SELECT continent, MAX(total_deaths) AS total_deaths
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_deaths DESC

-- Global numbers

SELECT date, SUM(total_deaths) AS total_deaths_globally, SUM(total_cases) AS global_cases, SUM(total_deaths)/SUM(total_cases)*100 AS death_percentage
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 4 DESC

--Vaccination in India per day

SELECT d.location, d.date, d.population, v.new_vaccinations, 
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location, d.date) AS sum
FROM public.covid_deaths d
JOIN public.covid_vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL AND d.location = 'India' AND new_vaccinations IS NOT NULL 
ORDER BY 2,3

--Creating view for Visualisation

CREATE VIEW vaccination_india AS
SELECT d.location, d.date, d.population, v.new_vaccinations, 
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location, d.date) AS sum
FROM public.covid_deaths d
JOIN public.covid_vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL AND d.location = 'India' AND new_vaccinations IS NOT NULL 
