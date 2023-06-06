select * 
from  coviddeath
where continent is not null
order by 3,4;

select * 
from  covidvaccination
where continent is not null
order by 3,4;

--total deaths vs total cases
 select location,date, total_cases, new_cases, total_deaths,population,  (total_deaths/total_cases)*100 as 'totaldeath/totalcasespercentage'
from coviddeath
 where location like 'egypt',  
 order by 1,2;

 --Total cases vs population
 select location,date,population, total_cases, (total_cases/population)*100 as 'totaldeath/populationpercentage'
from coviddeath
 where location like 'egypt'
 order by 1,2;

 --which countries have the heightest infection rates compared population
select location , population, max(total_cases)as 'heightestinfection', MAX  (total_cases/population)*100 as 'perecentpopulationinfected'
  from coviddeath
  where continent is not null
  group by location , population
order by perecentpopulationinfected desc;
  
 --which countries have the death count per population
 select location , population,max(CAST (total_deaths as int )) as 'heightestdeathrate', max (total_deaths/population)*100 as 'perecentpopulationdeath'
 from coviddeath
 where  continent is not null  
 group by location , population
order by perecentpopulationdeath desc;

-- which continents have max total deaths 
 select continent , max(total_deaths) as 'heightestdeathrate'
 from coviddeath
 where  continent is not null  
 group by continent 
order by heightestdeathrate desc;

--showing continents  whith the heighest death  count per population
 select  distinct continent,population,  max(total_deaths) as 'maxtotaldeaths'
 from coviddeath
  where  continent is not null  
  group by continent, population;

  --showing new deaths/new cases
  select  sum(new_cases) as 'sumnnewcases', sum (cast(new_deaths as int)) as 'sumnewdeaths', sum((cast (new_deaths as int)))/sum ( new_cases) as 'newdeaths/newcases'
  from coviddeath
  where continent is not null
  group by date
  order by 1 desc;

  --joining two tables
  select * 
  from coviddeath dea join covidvaccination vac
   on dea.date= vac.date;

   --total population vs vaccination
select dea.population , dea.date , dea.location , vac.new_vaccinations 
from  coviddeath dea join  covidvaccination vac
   on dea.date=vac.date
   order by 4 desc;
