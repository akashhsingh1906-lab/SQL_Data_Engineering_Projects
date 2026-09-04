-- bucket salaries
-- <25 = 'Low'
-- 25-50 = 'Medium'
-- > 50 = 'High'

select 
job_title_short,
salary_hour_avg,
case
    when salary_hour_avg < 25 then 'low'
    when salary_hour_avg < 50 then 'Medium'
    else 'High'
end as salary_category
from job_postings_fact
where salary_hour_avg is not null
limit 10;



-- handling missing data (nulls)
-- filter null salary values

select 
job_title_short,
salary_hour_avg,
case
    when salary_hour_avg is null then 'Missing'
    when salary_hour_avg < 25 then 'low'
    when salary_hour_avg < 50 then 'Medium'
    else 'High'
end as salary_category
from job_postings_fact
--where salary_hour_avg is not null
limit 10;


-- categorizing categorical values
--classify the job_title' column values as : 
    -- data analyst
    -- data scientist
    -- data engineer

select job_title,
    case 
        when job_title like '%data analyst%' then 'Data Analyst'
        when job_title like '%data scientist%' then 'Data Scientist'
        when job_title like '%data engineer%' then 'Data Engineer'
        else 'Other'
    end as job_title_category,

    job_title_short,
from job_postings_fact
--order by RANDOM()
limit 20;