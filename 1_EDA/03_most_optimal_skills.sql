/* 
    Question : what are the most optimal skills for data enginners - balancinf both demand and skills
        - create a ranking column that combines count and median salary to identify the most valuable skills
        - focus only on remote data enginner positions with specified anual salries.
        */
    
  
select 
    sd.skills,
   round(median(jpf.salary_year_avg),0) as median_salary,
   --count(jpf.*) as demand_count
   round(LN(count(jpf.*)),1) as demand_count_ln,
   round((median(jpf.salary_year_avg) * ln(count(jpf.*)))/1_000_000,2) as optimal_score
    
from job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
where jpf.job_title_short = 'Data Engineer'
    and jpf.job_work_from_home = true
    and jpf.salary_year_avg is not null
group by sd.skills
having count(jpf.*) > 100
order by optimal_score desc
LIMIT 25;


/*
┌────────────┬───────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count_ln │ optimal_score │
│  varchar   │    double     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │             5.3 │          0.97 │
│ python     │      135000.0 │             7.0 │          0.95 │
│ sql        │      130000.0 │             7.0 │          0.91 │
│ aws        │      137320.0 │             6.7 │          0.91 │
│ airflow    │      150000.0 │             6.0 │          0.89 │
│ spark      │      140000.0 │             6.2 │          0.87 │
│ kafka      │      145000.0 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │             6.1 │          0.82 │
│ azure      │      128000.0 │             6.2 │          0.79 │
│ java       │      135000.0 │             5.7 │          0.77 │
│ scala      │      137290.0 │             5.5 │          0.76 │
│ git        │      140000.0 │             5.3 │          0.75 │
│ kubernetes │      150500.0 │             5.0 │          0.75 │
│ databricks │      132750.0 │             5.6 │          0.74 │
│ redshift   │      130000.0 │             5.6 │          0.73 │
│ gcp        │      136000.0 │             5.3 │          0.72 │
│ nosql      │      134415.0 │             5.3 │          0.71 │
│ hadoop     │      135000.0 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │             5.0 │           0.7 │
│ docker     │      135000.0 │             5.0 │          0.67 │
│ mongodb    │      135750.0 │             4.9 │          0.67 │
│ go         │      140000.0 │             4.7 │          0.66 │
│ r          │      134775.0 │             4.9 │          0.66 │
│ github     │      135000.0 │             4.8 │          0.65 │
│ bigquery   │      135000.0 │             4.8 │          0.65 │
└────────────┴───────────────┴─────────────────┴───────────────┘

*/