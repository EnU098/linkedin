/*--------------------N.N-------------------*/
create table position(
    id serial primary key ,
    name varchar
);
create table company(
    id serial primary key ,
    name varchar,
    location varchar
);
create table company_position(
    company_id int references company(id),
    position_id int references position(id)
);

create table job(
    id serial primary key ,
    job_type varchar,
    company_id int references company(id),
    salary double precision,
    title varchar,
    location varchar,
    data_posted date
);
/*--------------------N.N-------------------*/