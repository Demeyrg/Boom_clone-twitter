insert into usr (username, password, active) values ('admin','$2a$08$IexSBLfmyABctl1b5t/hlue4Kw6/2gOmvm/cpNPAq.hy4xBxG4yI2',true);

insert into user_role (user_id, roles) values ((select id from usr where username = 'admin'),'USER'),
       ((select id from usr where username = 'admin'),'ADMIN');

