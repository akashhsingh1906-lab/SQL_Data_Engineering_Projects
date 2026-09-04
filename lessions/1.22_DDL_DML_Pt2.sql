create or replace table staging.job_postings_flat AS
SELECT
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_country,
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,
    cd.name AS company_name
FROM data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id;

select * 
from staging.job_postings_flat
limit 10;

/* view */
create or replace view staging.job_postings_flat_view AS
select *
from staging.job_postings_flat as jpf
join staging.preferred_roles as r
    on jpf.job_title_short = r.role_name
where role_id = 1 or role_id = 2 or role_id = 3;


select job_title_short,
count(*) as job_count
from staging.job_postings_flat_view
group by job_title_short
order by job_count desc;

create or replace TEMPORARY table job_postings_flat_temp AS

select * 
from staging.job_postings_flat_view
where job_title_short = 'Software Engineer';


select job_title_short,
count(*) as job_count
from job_postings_flat_temp
group by job_title_short
order by job_count desc;

