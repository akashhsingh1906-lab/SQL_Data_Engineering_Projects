/* .read lessions/1.21_DDL_DML_Pt1.sql */

create database IF NOT EXISTS jobs_mart;

show databases;

/* schema */

select * from information_schema.schemata;


create schema if not exists jobs_mart.staging;

/* table */

create table if not exists staging.preferred_roles(
    role_id INTEGER primary key,
    role_name VARCHAR(100)
);

select * 
from information_schema.tables
where table_catalog = 'jobs_mart';


/* drop table if exists staging.preferred_roles; */


INSERT INTO staging.preferred_roles(role_id, role_name)
VALUES
(1, 'Software Engineer'),
(2, 'Data Scientist'),
(3, 'Product Manager');

select *
from staging.preferred_roles;

alter table staging.preferred_roles
add column role_description VARCHAR(255);

update staging.preferred_roles
set role_description = 'Responsible for developing software applications.'
where role_id = 3 or role_id = 1;

update staging.preferred_roles
set role_description = 'Responsible for analyzing and interpreting complex data.'
where role_id = 2;


alter table staging.priority_roles
rename to preferred_roles;

select *
from staging.preferred_roles;

alter table staging.preferred_roles
rename column role_description to role_summary;

alter table staging.preferred_roles
rename column role_summary to role_description;

alter table staging.preferred_roles
alter column role_description set not null;

