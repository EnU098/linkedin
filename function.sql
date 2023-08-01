create function add_commit(i_user_id int, i_text varchar, i_post_id int, i_date_posted date, i_reply_id int)
    returns boolean
as
$$
begin
insert into comment(user_id,text,post_id,date_posted,reply_id) values  (i_user_id,i_text,i_post_id,i_date_posted,i_raply_id);
return true ;
exception when others then return false;
end
$$ language plpgsql;
select add_commit(1,'nima gap orto',1,'2023-08-01',1);
