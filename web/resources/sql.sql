/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  mkl
 * Created: 19 Mar, 2018
 */

create table a_security_question(
a_id bigint not null,
question  varchar(250) not null, 
answer varchar(100) not null,
pass varchar(256) not null);

create table c_security_question(
c_id bigint not null,
question  varchar(250) not null, 
answer varchar(100) not null,
pass varchar(256) not null);

create table admindb (
admin_id int not null,
admin_f_name varchar(50) not null,
admin_l_name varchar(50) not null,
admin_pass varchar(50) not null,
admin_email varchar(50) not null
);

create table artdb (
art_id bigint not null,
art_price int ,
art_type varchar(25),
a_id bigint not null,
description varchar(500),
date_of_upload date ,
sold_status char,
art_path varchar(200) );

create table dummyartdb (
art_id bigint not null,
art_price int ,
art_type varchar(25),
a_id bigint not null,
description varchar(500),
date_of_upload date ,
sold_status char,
art_path varchar(200) );

create table artistdb(
a_id bigint not null,
a_f_name varchar(50),
a_l_name varchar(50),
a_address varchar(200),
a_email varchar(50),
a_gender varchar(10),
a_phone bigint,
a_pass varchar(256),
a_reg_date date,
a_block_f char);

create table customerdb(
c_id bigint not null,
c_f_name varchar(50),
c_l_name varchar(50),
c_address varchar(200),
c_email varchar(50),
c_gender varchar(10),
c_phone bigint,
c_pass varchar(256),
c_reg_date date,
c_block_f char
);
create table editartdb(
query varchar(500),
art_id bigint,
a_id bigint,
state varchar(250),
up_date date
);
create table deleteartdb(
query varchar(500),
art_id bigint,
a_id bigint,
state varchar(250),
up_date date
);
create table editcustomer(
query varchar(500),
c_id bigint,
state varchar(250),
up_date date
);
create table editartist(
query varchar(500),
a_id bigint,
state varchar(250),
up_date date
);
create table review(
art_id bigint,
c_id bigint,
review varchar(500),
date_of_review date
);
create table ratings(
art_id bigint,
c_id bigint, 
one int, 
two int, 
three int 
);
create table orderdb(
order_id bigint,
art_id bigint,
c_id bigint,
amount int,
order_status char,
pay_status char,
address varchar(200),
commission int
);
alter table admindb add primary key (admin_id);
alter table artdb add primary key (art_id);
alter table artistdb add primary key (a_id);
alter table customerdb add primary key (c_id);
alter table orderdb add primary key (order_id);