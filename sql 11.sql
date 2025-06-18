use swiggy_restaurants;
select * from restaurants;

-- 1. Creating the table and feeding the values
create table if not exists tbl 
		(id varchar(255), name varchar(255), city varchar(255), 
        rating float, cost int, cuisine varchar(255), 
        rating_count int, revenue int);


insert into tbl 
	(select id, name, city, rating, cost, cuisine, 
    rating_count,cost*rating_count as 'revenue' 
    from 
		(select *, 
        cost*rating_count ,
        row_number() over(partition by cuisine order by cost*rating_count desc) as 'rank' 
        from restaurants) t
	where t.rank <= 5);
select * from tbl;




-- 2. Creating the table directly
create table if not exists results as (select * from restaurants);
select * from results;




-- 3. Creating a temporary table
create temporary table if not exists temp_results as (select * from restaurants);
select * from temp_results;



create table if not exists top_1000 as 
	(
		select *, cost*rating_count as 'revenue'
		from restaurants
		order by revenue desc
		limit 1000 
    );
select * from top_1000;


select distinct cuisine from restaurants;

use swiggy_restaurants;
select * from restaurants;

SELECT * FROM restaurants  WHERE name like 's%';

SELECT * FROM restaurants  WHERE name like '_s%';
SELECT * FROM restaurants  WHERE name like '_s_%';

SELECT * FROM restaurants  WHERE name like '%S%';
SELECT * FROM restaurants  WHERE name like '% Pizza%';

SELECT * FROM restaurants WHERE name like '_h_%';

SELECT * FROM restaurants WHERE name REGEXP '^s';
SELECT * FROM restaurants WHERE name REGEXP 's';


use swiggy;
select * from restaurants;

drop table if exists rest_1, rest_2, rest_3;


select link, name, city, rating, rating_count, cuisine, cost FROM restaurants;

select substring_index(link,'/',-1) as id,link, name, city, rating, rating_count, cuisine, cost FROM restaurants;


-- 1. Finding the restaurant_id from the link
select substring_index(substring_index(link,'/',-1),'-',-1) as id, 
	name, city, rating, rating_count, cuisine, cost FROM restaurants;




-- 2. Updating the restaurant_id in the original table
create table if not exists rest_1 as 
		( select substring_index(substring_index(link,'/',-1),'-',-1) as id, name, city, rating, 
			rating_count, cuisine, cost FROM restaurants );
select * from rest_1;



-- 3. Clean the name column and update it on the table
create table if not exists rest_2 as
		( select id, lower(trim(name)) as name,city, rating, rating_count, cuisine, cost from rest_1 );
select * from rest_2;





-- 4. Clean the city &  cuisine column and update it on the table
create table if not exists rest_3 as
		( select id, lower(trim(name)) as name, lower(city) as 'city', rating, rating_count, 
			lower(cuisine) as 'cuisine', cost from rest_2 );
select * from rest_3;



-- 5. Remove the odd cuisines from the table
create table if not exists clean as
		( select * from rest_3 where cuisine not in ('combo','na','
			discount offer from garden cafe express kankurgachi',
			'svanidhi street food vendor','tex-mex','special discount from (hotel swagath)',
			'free delivery ! limited stocks!'));
select * from clean;


drop table if exists rest_1, rest_2, rest_3;