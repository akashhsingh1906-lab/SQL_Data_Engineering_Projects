create or replace table main.priority_jobs_snapshot(
    job_id INTEGER primary key,
    job_title_short VARCHAR(100),
    company_name VARCHAR(255),
    job_posted_date TIMESTAMP,
    salary_year_avg DOUBLE,
    priority_level INTEGER,
    updated_at TIMESTAMP default current_timestamp
);

insert into main.priority_jobs_snapshot(job_id, job_title_short, company_name, job_posted_date, salary_year_avg, priority_level, updated_at)
select
jpf.job_id,
jpf.job_title_short,
cd.name as company_name,
jpf.job_posted_date,
jpf.salary_year_avg,
pr.priority_level,
current_timestamp as updated_at
from
data_jobs.job_postings_fact jpf
left join data_jobs.company_dim cd on jpf.company_id = cd.company_id
inner join staging.priority_roles pr on jpf.job_title_short = pr.role_name;

select 
job_title_short,
count(*) as job_count,
min(priority_level) as min_priority_level,
min(updated_at) as min_updated_at,
from priority_jobs_snapshot
group by job_title_short
order by job_count desc, min_priority_level asc;