insert into usr (id, username, password, active)
    values (1,'admin','adminSlava',true);

insert into user_role (user_id, roles)
values ((select id from usr where username = 'admin'),'USER'),
       ((select id from usr where username = 'admin'),'ADMIN');