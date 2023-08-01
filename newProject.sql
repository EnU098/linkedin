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

create table users(
  id serial primary key ,
  email varchar,
  password varchar,
  first_name varchar,
  last_name varchar,
  photo_link varchar,
  date_od_brith date,
  country varchar,
  gender gender
);
/*--------------------N.N-------------------*/

------------------Davron-------------------

create table connections(
    id serial primary key ,
    user1 int references users(id),
    user2 int references users(id)
);

create table endorses(
    id serial primary key ,
    user1 int references users(id),
    user2 int references users(id),
    date_posted date
);

------------------Davron-------------------