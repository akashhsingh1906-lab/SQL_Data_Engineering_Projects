select unnest([1,1,1,2])
union
select unnest([1,1,3]);


select unnest([1,1,1,2])
intersect
select unnest([1,1,3]);


select unnest([1,1,1,2])
except
select unnest([1,1,3]);

