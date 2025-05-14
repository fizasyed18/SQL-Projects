create schema unicorns;
use unicorns;

select * from unicorn_companies;

-- -----------------------------------------------

-- 1. What are the top 10 unicorns by valuation?
select company, industry, country, city, valuation as valuation_in_billions
from unicorn_companies
order by valuation_in_billions desc
limit 10;

-- 2. What are the top 10 unicorns by funding?
select company, industry, country, funding as funding_in_billions
from unicorn_companies
order by funding_in_billions desc
limit 10;

-- 3. What are the top industries by funding?
select industry, sum(funding) as total_funding
from unicorn_companies
group by industry
order by total_funding desc
limit 5;

-- 4. What are the top industries by valuation?
select industry, sum(valuation) as total_valuation
from unicorn_companies
group by industry
order by total_valuation desc
limit 5;

-- 5. What are the top 10 cities by valuation?
select city, sum(valuation) as total_valuation
from unicorn_companies
group by city
order by total_valuation desc
limit 10;

-- 6. What are the top 5 countries by number of unicorns?
select country, count(*) as unicorns_count
from unicorn_companies
group by country
order by unicorns_count desc
limit 5;

-- 7. What are the most valuable unicorns by country?
select company, country, valuation, funding
from unicorn_companies
where (country, valuation) in (select country, max(valuation)
								from unicorn_companies
                                group by country)
limit 7;

-- 8. What are the top 5 investors with largest funding?
select investors, max(funding) as funding_in_billions
from unicorn_companies
group by investors
order by funding_in_billions desc
limit 5;

-- 9. What are the top 5 investors with largest valuation?
select investors, valuation as valuation_in_billions
from unicorn_companies
order by valuation_in_billions desc
limit 5;


-- 10. Unicorns per continent
select continent, count(*) as unicorn_count
from unicorn_companies
group by continent
order by unicorn_count desc;

-- 11. Unicorns Founded After 2010
select company, industry, valuation, funding, year_founded
from unicorn_companies
where year_founded > 2010
order by year_founded asc;

-- 12. How long does it usually take for a company to become a unicorn?
select avg(year_joined - year_founded) as avg_years_to_unicorn
from unicorn_companies;

-- 13. Which unicorn companies have had the biggest return on investment?
select country, industry, company, max(roi) as maximum_roi
from unicorn_companies
group by country, industry, company
order by maximum_roi desc
limit 5;

-- 14. Which unicorn company is the oldest? And how many years did it take for it to become a unicorn?
select company, year_founded, year_joined, (year_joined - year_founded) as oldest_unicorn
from unicorn_companies
order by oldest_unicorn desc
limit 2;

-- 15. What are the most funded companies?
select company, max(funding) as most_funded
from unicorn_companies
group by company
order by most_funded desc
limit 5;

-- 16. What is the total valuation of Unicorns in the FinTech Sector?
select industry, sum(valuation) as total_valuation
from unicorn_companies
where industry = 'fintech';

-- 17. What are the top 3 Sectors by average valuation?
with industry_avg as (
select industry, avg(valuation) as avg_valuation
from unicorn_companies
group by industry
)
select *
from industry_avg
order by avg_valuation desc;

-- 18. What is industry valuation rankings?
select company, industry, valuation,
	rank() over (partition by industry order by valuation desc) as valuation_rank,
	dense_rank() over (partition by industry order by valuation desc) as valuation_dense_rank
from unicorn_companies;