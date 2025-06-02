Create database Myntraproducts;
use Myntraproducts ;
select * from myntraproductsdata ;

select product_name as " Product Name",
		 brand_name as "Brand Name",
         marked_price as "Marked Price",
         discounted_price as "Discounted Price",
	     marked_price - discounted_price as "Discounted Amount",
         round(((marked_price - discounted_price)/marked_price)*100,2) as "Discounted Percentage" 
         from myntraproductsdata;
         
         select product_name from myntraproductsdata;
          select count(product_name) from myntraproductsdata;
          
          select brand_name from myntraproductsdata;
          
          -- counting unique brand name in table
          
             select count(distinct brand_name), 
             count(distinct brand_tag) from myntraproductsdata; 
             
             select count(distinct brand_name), brand_name from myntraproductsdata;
             select product_name, brand_name from myntraproductsdata;
             
             select * from myntraproductsdata;
             select * from myntraproductsdata where brand_name = 'Biba';
             select count(*) from myntraproductsdata where brand_name = 'Biba';
             
             select * from myntraproductsdata where brand_name = 'Biba' and product_tag = 'Kurtas'
             order by rating_count desc limit 1;
             
              select avg(marked_price), avg(discounted_price) from myntraproductsdata where brand_name = 'Biba';
              select distinct product_tag from myntraproductsdata where brand_name = 'Biba';
              
              select distinct brand_tag from myntraproductsdata
              where brand_name = 'nike' and discounted_price < 5000;
              
              
              select sum(rating_count) from myntraproductsdata
              where brand_name = 'Biba' and product_tag = 'Kurtas';
              
              select sum(rating_count * discounted_price)*20 from myntraproductsdata where brand_name = 'Biba';
			