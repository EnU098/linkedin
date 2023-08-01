/*--------------------N.N-------------------*/
create table position
(
    id   serial primary key,
    name varchar not null
);
create table company
(
    id       serial primary key,
    name     varchar not null,
    location varchar not null
);
create table company_position
(
    company_id  int references company (id) not null,
    position_id int references position (id) not null
);

create table job
(
    id          serial primary key,
    job_type    varchar not null,
    company_id  int references company (id) not null,
    salary      double precision,
    title       varchar not null,
    location    varchar not null,
    data_posted date not null
);

create type gender as ENUM('f','m');
create table users(
  id serial primary key ,
  email varchar unique not null,
  password varchar not null,
  first_name varchar not null,
  last_name varchar not null,
  photo_link varchar not null,
  date_od_brith date not null,
  country varchar not null,
  phone_number varchar unique not null ,
  gender gender not null
  );
/*--------------------N.N-------------------*/


/*--------------E.Nodir--------------*/

create table post
(
    id      serial primary key,
    user_id int references users (id) not null,
    context text not null,
    photo   varchar not null,
    date    date not null
);

create table post_like
(
    id      serial primary key,
    user_id int references users (id) not null,
    post_id int references post (id) not null
);

create table comment
(
    id          serial primary key,
    user_id     int references users (id) not null,
    text        varchar not null,
    post_id     int references post (id)not null,
    date_posted date not null,
    reply_id    int references users (id) not null
);

create table comment_like
(
    id         serial primary key,
    user_id    int references users (id) not null,
    comment_id int references comment (id) not null
);

/*--------------E.Nodir--------------*/

------------------Davron-------------------

create table connections(
    id serial primary key ,
    user1 int references users(id)not null,
    user2 int references users(id) not null
);

create table endorses(
    id serial primary key ,
    user1 int references users(id) not null,
    user2 int references users(id)not null,
    date_posted date
);
------------------Davron-------------------

/*---------------N.N------------------------*/
create table message(
  id serial primary key,
  sender_user_id int references users(id) not null,
  resiver_user_id int references users(id) not null,
  message_body varchar not null
);
create table user_message(
  user_id int references users(id) not null ,
  message_id int references message(id) not null
);
create table experience(
  id serial primary key ,
  user_id int references users(id) not null ,
  start_date date not null ,
  end_date date not null ,
  company_id int references company(id) not null ,
  position_id int references position(id) not null
);
create table skill(
    id serial primary key not null,
    name varchar not null
);
create table user_skills(
    user_id int references users(id) not null ,
    skill_id int references skill(id) not null
);

create table endorses_skill(
    endorses_id int references endorses(id) not null ,
    skill_id int references skill(id) not null
);

/*---------------N.N------------------------*/
