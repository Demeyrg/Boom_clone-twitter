-- create sequence hibernate_sequence start 1 increment 1;

create table message (
    id  bigserial not null,
    filename varchar(255),
    img oid,
    tag varchar(255) not null,
    text varchar(3000) not null,
    user_id int8,
    primary key (id));

create table user_role (
    user_id bigserial not null,
    roles varchar(255));

create table usr (
    id  bigserial not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id));

alter table if exists message
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;

insert into usr (username, password, active) values ('admin','$2a$08$IexSBLfmyABctl1b5t/hlue4Kw6/2gOmvm/cpNPAq.hy4xBxG4yI2',true);

insert into user_role (user_id, roles) values ((select id from usr where username = 'admin'),'USER'),
                                              ((select id from usr where username = 'admin'),'ADMIN');

