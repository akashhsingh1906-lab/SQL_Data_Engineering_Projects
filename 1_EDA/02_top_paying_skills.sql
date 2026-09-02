/*
    question: what are the highest paying skills for data engineering 
        - calculate median salary for each skill req for data enginner
        - focus on remote positions with specified salary
        - include skill frequency to identify both salary and demand

*/

select 
    sd.skills,
   round(median(jpf.salary_year_avg),0) as median_salary,
   count(jpf.*) as demand_count
from job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
where jpf.job_title_short = 'Data Engineer'
    and jpf.job_work_from_home = true
group by sd.skills
having count(jpf.*) > 100
order by median_salary desc
LIMIT 25;

/*
    Rust is the highest-paying skill 💰
Median salary: $210K
It is clearly ahead of the other skills.
Terraform & Golang are tied
Both have a median salary of $184K.
Terraform has 3,248 demand_count, while Golang has only 912.
👉 Terraform has a much stronger combination of salary + demand.
Spring is also strong
Median salary: $175.5K
Demand: 364
High salary, but relatively low demand compared with Terraform/Kubernetes/Airflow.
Neo4j has high salary but low demand
Salary: $170K
Demand: only 277
This suggests it may be a specialized/niche skill.
FastAPI is the lowest among the top 10
Median salary: $157.5K
Still a strong salary, but below the other skills in this group.

    ┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ terraform  │      184000.0 │         3248 │
│ golang     │      184000.0 │          912 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ node       │      150000.0 │          179 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
  25 rows                         3 columns
data_jobs D 
*/