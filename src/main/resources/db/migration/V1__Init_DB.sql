create sequence hibernate_sequence start 1 increment 1;

create if not exists schema boom;

create table message (
    id serial not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(3000) not null,
    user_id int8,
    primary key (id)
);

create table user_role (
    user_id serial not null,
    roles varchar(255)
);

create table usr (
    id serial not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists boom.message
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists boom.user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;

