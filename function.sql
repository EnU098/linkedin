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
