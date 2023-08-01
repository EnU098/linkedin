/*           E_Nodir          */

create or replace function add_post(
    user_id int,
    context text,
    photo varchar,
    date date
) returns bool as
$$
BEGIN
    insert into post(user_id, context, photo, date)
    values (user_id, context, photo, date);
    return true;

Exception
    when others then return false;
end;
$$ language plpgsql;


create or replace function add_post_like(
    user_id int,
    post_id int
) returns bool as
$$
BEGIN
    insert into post_like(user_id, post_id)
    values (user_id, post_id);
    return true;

Exception
    when others then return false;
end;
$$ language plpgsql;

create or replace function add_comment(
    user_id int,
    text text,
    post_id int,
    date_posted date,
    reply_id int
) returns bool as
$$
BEGIN
    insert into comment(user_id, text, post_id, date_posted, reply_id)
    values (user_id, text, post_id, date_posted, reply_id);
    return true;

Exception
    when others then return false;
end;
$$ language plpgsql;

create or replace function add_comment_like(
    user_id int,
    comment_id int
) returns bool as
$$
BEGIN
    insert into comment_like(user_id, comment_id)
    values (user_id, comment_id);
    return true;

Exception
    when others then return false;
end;
$$ language plpgsql;

/*           E_Nodir          */
/*--------------N.N-----------------*/
create or replace function add_user(i_first_name varchar, i_last_name varchar,
                                    i_email varchar, i_password varchar, i_photo_link varchar,
                                    i_date_of_brith date, i_country varchar, i_pohone_number varchar, i_gender gender)
    returns boolean
    language plpgsql
as
$$
begin

    insert into users(email, password, first_name, last_name, photo_link, date_od_brith, country, phone_number, gender)
    VALUES (i_email, i_password, i_first_name, i_last_name, i_photo_link, i_date_of_brith, i_country, i_pohone_number,
            i_gender);
    return true;

EXCEPTION
    when others then return false;

end;
$$;
select add_user('nodir', 'norov', 'no0404ir@gmail.com', '123', 'cddd', '07-03-2004', 'Uzbekiston', '+998904430302',
                'm');

create or replace function add_company(i_name varchar, i_location varchar)
    returns boolean
    language plpgsql
as
$$
begin
    insert into company(name, location) VALUES (i_name, i_location);
    return true;

Exception
    when others then return false;
end;
$$;

create or replace function add_position(i_name varchar)
    returns boolean
    language plpgsql
as
$$
begin
    insert into position(name) VALUES (i_name);
    return true;

Exception
    when others then return false;
end;
$$;

create or replace function add_company_position(i_company_id int, i_position_id int)
    returns boolean
    language plpgsql
as
$$
begin
    insert into company_position(company_id, position_id) VALUES (i_company_id, i_position_id);
    return true;

Exception
    when others then return false;
end;
$$;

create or replace function add_skill(i_name varchar)
    returns boolean
    language plpgsql
as
$$
BEGIN
    insert into skill(name) values (i_name);
    return true;

Exception
    when others then return true;
end;
$$;

/*--------------N.N-----------------*/