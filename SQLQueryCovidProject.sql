--SELECT *
--FROM CovidDeath

--SELECT *
--FROM CovidVaccinations

SELECT *
FROM CovidDeath
ORDER BY 3,4

SELECT *
FROM CovidVaccinations
ORDER BY 3,4

--Mortality rates by continent for the start period of the study--
--Presentation from maximum mortality rate to minimum --

SELECT continent, MAX(Total_deaths) as TotalDeathCount
FROM CovidDeath
Where continent is not null
GROUP BY continent
Order by 2 DESC

SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM CovidDeath
Where continent is not null
ORDER BY 1,2



--Global numbers of diseases and death cases in the world by date for the first period of the study--


SELECT date, SUM(cast(new_cases as float)) as NewWorldCases
FROM CovidDeath
Where continent is not null
Group by date
ORDER BY 1,2


SELECT date, SUM(cast(new_cases as float)) as NewWorldCases , SUM(cast(new_deaths as float)) as NewWorldDeaths
FROM CovidDeath
Where continent is not null
Group by date
ORDER BY 1,2


--EXEC sp_rename 'dbo.CovidDeath.total_cases_per_mil', 'total_cases_per_million', 'COLUMN';


--Select main data to work (World data)--


--SELECT location, date,total_cases, new_cases, total_deaths, population
--FROM CovidDeath
--ORDER BY 1,2


SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM CovidDeath
ORDER BY 1,2

SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM CovidDeath
WHERE location like 'Canada'
ORDER BY 1,2


--Calculating the number of vaccinated people--

SELECT dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not NULL
ORDER BY 2,3

--CHECK ON BELOW

SELECT dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations
, SUM(cast( vac.new_vaccinations as float)) OVER (PARTITION BY dea.location)
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not NULL
ORDER BY 2,3

SELECT dea.continent,dea.location,dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(float, vac.new_vaccinations)) OVER (Partition by dea.location Order by 
dea.location, dea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
ORDER BY 2,3

--Using CTE

With PopvsVac (Continent, Location, Date, Population,New_Vaccinations,RollingPeopleVaccinated)
as
(
SELECT dea.continent,dea.location,dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(float, vac.new_vaccinations)) OVER (Partition by dea.location Order by 
dea.location, dea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
--ORDER BY 2,3
)
Select *,(RollingPeopleVaccinated/population)*100 
From PopvsVac

--Using TEMP TABLE
DROP TABLE IF exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(Continent nvarchar(255), 
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric)

Insert into  #PercentPopulationVaccinated
SELECT dea.continent,dea.location,dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(float, vac.new_vaccinations)) OVER (Partition by dea.location Order by 
dea.location, dea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
--ORDER BY 2,3
Select *,(RollingPeopleVaccinated/population)*100 
From #PercentPopulationVaccinated










--Select main data to work (Europe data)--


SELECT *
FROM EURCovidDeath
ORDER BY 3,4

SELECT *
FROM EURCovidVaccinations
ORDER BY 3,4

SELECT location, date,total_cases, new_cases, total_deaths, population
FROM EURCovidDeath
ORDER BY 1,2


--Calculation of mortality rate--


--SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
--FROM EURCovidDeath
--ORDER BY 1,2


SELECT location, date, total_cases, total_deaths,(total_deaths)/(total_cases )*100 as DeathPercentage
FROM EURCovidDeath
ORDER BY 1,2



--Calculation of mortality rate by country--


SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM EURCovidDeath
WHERE location like 'Latvia'
ORDER BY 1,2


--Percentage of population diseased with covid by country--


SELECT location, date, total_cases, population, (total_cases/population)*100 as DiseasePercentage
FROM EURCovidDeath
WHERE location like 'Latvia'
ORDER BY 1,2


--Calculation of the maximum infection rate by population and country (Europe)--
--presentation from the largest percentage of the population infected to the smallest--


SELECT location,population, MAX( total_cases) AS MaxInfectionCount,  MAX((total_cases/population))*100 as DiseasePercentage
FROM EURCovidDeath
GROUP BY location,population
ORDER BY 4 DESC


--Calculating the maximum mortality rate by population and country (Europe) --
--presentation from the largest percentage of mortality by disease to the smallest one --

SELECT location,population, MAX( total_deaths) AS TotalDeathCount, MAX((total_deaths/population))*100 as DeathPercentage
FROM EURCovidDeath
GROUP BY location,population
ORDER BY 4 DESC

--presentation from the largest total death count to the smallest one --

SELECT location,population, MAX( total_deaths) AS TotalDeathCount,((MAX(total_deaths))/population)*100 as DeathPercentage
FROM EURCovidDeath
GROUP BY location,population
ORDER BY 3 DESC


--Mortality rates by continent for the start period of the study, EUROPE--



SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM EURCovidDeath
ORDER BY 1,2



--Numbers of diseases and death cases in the Europe by date for the first period of the study--


SELECT date, SUM(new_cases) as NewEuropeCases
FROM EURCovidDeath
Group by date
ORDER BY 1,2


SELECT date, SUM(new_cases) as NewEuropeCases , SUM(new_deaths) as NewEuropeDeaths
FROM EURCovidDeath
Group by date
ORDER BY 1,2


--Calculating the number of vaccinated people EUROPE--

SELECT edea.location,edea.date, edea.population, evac.new_vaccinations
FROM EURCovidDeath edea
JOIN EURCovidVaccinations evac
	ON edea.location = evac.location
	and edea.date = evac.date
ORDER BY 2,3

SELECT edea.location,edea.date, edea.population, evac.new_vaccinations,
SUM(CAST(evac.new_vaccinations as float)) OVER (Partition by edea.location)
FROM EURCovidDeath edea
JOIN EURCovidVaccinations evac
	ON edea.location = evac.location
	and edea.date = evac.date
ORDER BY 2,3

SELECT edea.location,edea.date, edea.population, evac.new_vaccinations,
SUM(CONVERT(float,evac.new_vaccinations)) OVER (Partition by edea.location Order by 
edea.location, edea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM EURCovidDeath edea
JOIN EURCovidVaccinations evac
	ON edea.location = evac.location
	and edea.date = evac.date
ORDER BY 2,3

--Using CTE

With ePopvseVac (Location, Date, Population,New_Vaccinations,RollingPeopleVaccinated)
as
(
SELECT edea.location,edea.date, edea.population, evac.new_vaccinations,
SUM(CONVERT(float,evac.new_vaccinations)) OVER (Partition by edea.location Order by 
edea.location, edea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM EURCovidDeath edea
JOIN EURCovidVaccinations evac
	ON edea.location = evac.location
	and edea.date = evac.date
--ORDER BY 2,3
)
Select *,(RollingPeopleVaccinated/population)*100 
From ePopvseVac


--Using TEMP TABLE
DROP TABLE IF exists #ePercentPopulationVaccinated
Create Table #ePercentPopulationVaccinated
(
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric)

Insert into  #ePercentPopulationVaccinated
SELECT edea.location,edea.date, edea.population, evac.new_vaccinations,
SUM(CONVERT(float,evac.new_vaccinations)) OVER (Partition by edea.location Order by 
edea.location, edea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM EURCovidDeath edea
JOIN EURCovidVaccinations evac
	ON edea.location = evac.location
	and edea.date = evac.date
Select *,(RollingPeopleVaccinated/population)*100 
From #ePercentPopulationVaccinated



--Creating view to store data later visualizations

Create View PercentPopulationVaccinated as
SELECT dea.continent,dea.location,dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(float, vac.new_vaccinations)) OVER (Partition by dea.location Order by 
dea.location, dea.Date  ROWS UNBOUNDED PRECEDING) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100 (below)
FROM CovidDeath dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date

Select *
From PercentPopulationVaccinated

Create View Mortality as
SELECT location, date, total_cases, total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPercentage
FROM CovidDeath
Where continent is not null



Create View EuMortality as
SELECT location, date, total_cases, total_deaths,(total_deaths)/(total_cases )*100 as DeathPercentage
FROM EURCovidDeath
