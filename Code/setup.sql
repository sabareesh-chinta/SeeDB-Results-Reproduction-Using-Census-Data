drop table if exists ev, all_ev, us_ev, non_us_ev;

create table ev (county varchar(50) NULL, city varchar(50) NULL, state_code varchar(2) NULL, model_year integer NULL, make varchar(50) NULL, ev_type varchar(100) NULL, cafv varchar(100) NULL, range_miles integer NULL, utility varchar(200) NULL);

\COPY ev FROM 'Data/ev_population.csv' DELIMITER ',' HEADER CSV;

create table all_ev (county varchar(50) NULL, city varchar(50) NULL, state_code varchar(2) NULL, model_year integer NULL, make varchar(50) NULL, ev_type varchar(100) NULL, cafv varchar(100) NULL, range_miles integer NULL, utility varchar(200) NULL, us_or_non_us varchar(50) NULL);

\COPY all_ev FROM 'Data/ev_population_total.csv' DELIMITER ',' HEADER CSV;

create table non_us_ev as select * from all_ev where us_or_non_us ='Rest of the World';
alter table non_us_ev drop us_or_non_us;
create table us_ev as select * from all_ev where us_or_non_us ='US';
alter table us_ev drop us_or_non_us;