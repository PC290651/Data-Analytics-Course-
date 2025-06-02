use Aishvi;

select * from users;

-- insert 
-- user id, name, mail, phone, dob, city, maritial_status, sex

Insert into users values ("1111", "Wind", "wind2503@gmail.com", "7037626190", "2001-03-03", "Noida", "Unmarried", "Male"); 
 
Insert into users (user_id, user_name, mail, phone) values 
("1112", "aviwind", "aviwind@gmail.com", "7037616290");
  
Insert into users (user_id, user_name, mail, phone) values 
("1113", "chocowind", "chocowind@gmail.com", "7037616209"),
("1114", "avi", "avi@gmail.com", "7037626109");

update users set user_name='pawan' where user_id ='1114';

select * from users;

