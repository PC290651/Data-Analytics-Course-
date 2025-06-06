Create database newmyntra;
use newmyntra ;
select * from newdatamyntra;

--  nike tshirts between 2000-3000
Select * from newdatamyntra where brand_name='NIKE' AND product_tag='tshirts' AND 
discounted_price BETWEEN 2000 AND 3000;

-- Products with BETWEEN
select distinct * from newdatamyntra  where brand_tag = 'adidas' and discounted_price between 3000 and  5000;


-- Adding more filters
select distinct * from newdatamyntra  
where brand_tag = 'adidas' and (discounted_price between 3000 and  8000) and rating > 4;

-- Using OR
select distinct * from newdatamyntra  
where (brand_tag = 'adidas' or brand_tag = 'puma') and 
			(discounted_price between 5000 and  8000) ;
            
-- Using NOT
select distinct * from newdatamyntra  
where not (brand_tag = 'adidas') and (discounted_price between 5000 and  8000) ;

-- Using IN
select distinct * from newdatamyntra  
where brand_name in ('adidas','puma') and (discounted_price between 5000 and  8000) ;

-- Using NOT IN
select distinct * from newdatamyntra  
where brand_tag not in ('adidas','puma') and (discounted_price between 5000 and  8000) ;

select distinct(product_tag) from  newdatamyntra 
	where brand_name = 'nike' and discounted_price < 5000;
    -- total brands in table
select count(brand_name) from newdatamyntra;
-- total tshirts
select count(*) from newdatamyntra where product_tag = 'tshirts';

-- total trshirts under 2000
select count(*) from newdatamyntra where product_tag = 'tshirts' and discounted_price < 2000 ;

-- how many brand selling tshirts
select count( distinct brand_name) from newdatamyntra where product_tag = 'tshirts';

-- how many differnt product categories h&m selling
select count( distinct product_tag) from newdatamyntra where brand_name = 'h&m';

-- top 5 tshirt form nike
SELECT * FROM newdatamyntra WHERE product_tag = 'tShirts' and brand_name = 'nike' order by rating_count desc LIMIT 5;

-- top worse rated products from guess
SELECT * FROM newdatamyntra where brand_name = 'guess' and rating_count > 0 order by rating asc LIMIT 5;

-- total prodct sold by levis
select sum(rating_count) from newdatamyntra where brand_name = 'levis';

-- total tshirts
select sum(rating_count) from newdatamyntra where product_tag = 'tshirts';

-- which category among tshirts & shirts has generted more revenue

select sum(rating_count*discounted_price) from newdatamyntra where product_tag = 'tshirts';
select sum(rating_count*discounted_price) from newdatamyntra where product_tag = 'shirts';

-- top 5 best selling brands
select brand_name, sum(rating_count) from newdatamyntra group by brand_name order by sum(rating_count) desc limit 5;

-- top 5 beat selling product categories
select product_tag, sum(rating_count) from newdatamyntra group by product_tag order by sum(rating_count) desc limit 5;

-- which brands war generated maximum revenue
select brand_name, sum(rating_count*discounted_price) as 'revenue' from newdatamyntra group by brand_name order by revenue desc limit 5;

-- which category among tshirts & shirts has generated more revenue
select product_tag, sum(rating_count*discounted_price) as 'revenue' from newdatamyntra where product_tag in ('tshirts','shirts')
group by product_tag order by revenue desc;