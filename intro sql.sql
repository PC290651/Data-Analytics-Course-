create database if not exists da_batch_10;
create table if not exists da_batch_10.students (user_id int);
create table if not exists da_batch_10.mentors (mentors_name varchar(30));
create table if not exists da_batch_10.sessions (sessions_name varchar(50));


-- users  - [userid, name, mail, phone, dob, city, martial_status, sex]
-- inventory  - [product_id, name, quantity, category, marked_price, discounted_price, manufacturer, date_of_manf, batch_no, expiry_date]
-- transactions  - [trans_id product_id, user_id, amount, mode_of_payment, date_time]

Create database if not exists Aishvi;
create table if not exists Aishvi.users (user_id int primary key, user_name varchar(30), mail varchar(20), phone varchar(15), dob date, city varchar(15), martial_status varchar(10), sex varchar(10) );
create table if not exists Aishvi.inventory (Product_id int primary key, Product_name varchar(30), quantity int, category varchar(20), marked_price int, discounted_price int, manufacturer varchar(30), date_of_manuf date, batch_no int, expiry_date date);
create table if not exists Aishvi.transactions (transaction_id char, Product_id int, user_id int, amount int, mode_of_payment varchar(20), date_time datetime); 
