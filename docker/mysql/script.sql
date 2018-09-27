create table `character`
(
  pk   int auto_increment
    primary key,
  name varchar(255) null,
  constraint character_name_uindex
  unique (name)
);

create table user_has_character
(
  pk           int auto_increment
    primary key,
  fk_user      int null,
  fk_character int null
);

create table users
(
  pk                int auto_increment
    primary key,
  login             varchar(255) not null,
  password          text         not null,
  level             int          null,
  registration_date date         null,
  last_visit        date         null,
  rating            int          null,
  constraint users_login_uindex
  unique (login)
);


