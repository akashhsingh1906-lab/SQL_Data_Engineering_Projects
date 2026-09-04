-- create temp table
create or replace temp table src_priority_jobs as
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

select * from src_priority_jobs;

-- update

update main.priority_jobs_snapshot tgt
set priority_level = src.priority_level,
    updated_at = src.updated_at
from src_priority_jobs src
where tgt.job_id = src.job_id
and tgt.priority_level is distinct from src.priority_level;