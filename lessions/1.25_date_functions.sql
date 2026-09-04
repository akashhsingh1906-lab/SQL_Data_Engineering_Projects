select job_posted_date,
job_posted_date::date as date,
job_posted_date::time as time,
job_posted_date::timestamp as timestamp,
job_posted_date::timestamptz as timestamptz
from job_postings_fact
limit 10;

select
    job_posted_date,
    extract(year from job_posted_date) as year,
    extract(month from job_posted_date) as month,
    extract(day from job_posted_date) as day,
    extract(hour from job_posted_date) as hour,
    extract(minute from job_posted_date) as minute,
    extract(second from job_posted_date) as second
from job_postings_fact
limit 10;