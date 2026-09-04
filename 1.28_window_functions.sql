--  Partition by - find hourly salary

select
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    avg(salary_hour_avg) over (partition by job_title_short, company_id) as avg_salary_hourly
from
    job_postings_fact
where 
    salary_hour_avg is not null
order by 
    random()
limit 10;