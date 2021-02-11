-- CREATE DATABASE corp;

drop table if exists contacts;

create table contacts (
	id int generated always as identity primary key,
	name varchar(255) not null,
	phone varchar(255) not null
);

drop table if exists forecasts;

create table forecasts (
	year int,
	month int,
	amount numeric
);

---

drop role if exists jane;

create role jane with
	login
	password 'securePass1';
	
grant select on forecasts to jane;

---

drop role if exists marketing;
drop role if exists planning;

create role marketing noinherit;

create role planning noinherit;

grant all on contacts to marketing;

grant all on forecasts to planning;

grant marketing to jane;

grant marketing to planning;

---

-- psql -U jane -d corp

-- SET ROLE planning;