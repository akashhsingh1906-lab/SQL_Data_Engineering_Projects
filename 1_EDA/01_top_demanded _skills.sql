/* 
Question: what are the most in-demand skills for data engineers
    - Identify the top 10 in-demand skills for DE
    - Focus on remote job postings
*/

select 
    sd.skills,
    count(jpf.*) as demand_count
from job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
where jpf.job_title_short = 'Data Engineer'
    and jpf.job_work_from_home = true
group by sd.skills
order by demand_count desc
LIMIT 10;

/* 
    Identify the top 10 in-demand skills for Data Engineers in remote positions
    - The query joins the job_postings_fact table with the skills_job_dim and skills_dim tables to get the skills associated with each job posting.
    - It filters the job postings to only include those with the job title 'Data Engineer' and those that are remote (work from home).
    - It groups the results by skill and counts the number of job postings for each skill.
    - Finally, it orders the results by demand count in descending order and limits the output to the top 10 skills.
    ┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
  */
  