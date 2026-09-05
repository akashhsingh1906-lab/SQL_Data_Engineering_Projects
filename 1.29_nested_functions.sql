-- Array Intro

select ['python', 'sql', 'r'] as skills_array;

select 'python' as skill 
union all
select 'sql'
union all
select 'r';

-- covert to ctas

with skills as(
    select 'python' as skill 
    union all
    select 'sql'
    union all
    select 'r'
)
select skill
from skills;


-- struct

select { skill : 'python', level: 1 } as skill_struct;

