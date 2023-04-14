SELECT * 
FROM PortfolioProject..covid_deaths
WHERE continent IS NOT NULL
ORDER BY 3, 4

--SELECT * 
--FROM PortfolioProject..covid_vaccinations
--WHERE continent IS NOT NULL
--ORDER BY 3, 4

-- Select data that we will use

SELECT location, date, population, total_cases, new_cases, total_deaths
FROM PortfolioProject..covid_deaths
WHERE continent IS NOT NULL
ORDER BY 1, 2

-- Total Cases vs. Total Deaths
-- Shows what percentage of population got Covid

SELECT location, date, population, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS DeathPercentage 
FROM PortfolioProject..covid_deaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
ORDER BY 1, 2


-- Countries with Highest Infection Rate compared to Population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX(CAST(total_cases AS FLOAT)/CAST(population AS FLOAT))*100 AS PercentPopulationInfected 
FROM PortfolioProject..covid_deaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- Countries with Highest Death Count per Population

SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..covid_deaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC


-- Breakdown by Continent

-- Continents with the highest death count per population

SELECT continent, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..covid_deaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

--SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
--FROM PortfolioProject..covid_deaths
----WHERE location like '%states%'
--WHERE continent IS NULL
--GROUP BY location
--ORDER BY TotalDeathCount DESC


-- Global numbers
-- Mortality rate of about 0.904%

SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..covid_deaths
--WHERE location like '%states%'
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1, 2



SELECT *
FROM PortfolioProject..covid_vaccinations