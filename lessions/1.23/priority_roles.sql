create or replace table staging.priority_roles(
    role_id INTEGER primary key,
    role_name VARCHAR(100),
    priority_level INTEGER
);

insert into staging.priority_roles(role_id, role_name, priority_level)
values
(1, 'Software Engineer', 1),
(2, 'Data Scientist', 2),
(3, 'Product Manager', 3);

select * from staging.priority_roles;