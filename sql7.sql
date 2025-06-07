Create database swiggy_restaurants;
use swiggy_restaurants;
select * from restaurants;

-- 1. Which restaurant of abohar is visied by least number of people?
SELECT * FROM restaurants
WHERE city = 'abohar' ORDER BY rating_count ASC LIMIT 5;

-- 2. Which restaurant has generated maximum revenue all over india?
SELECT *, (cost * rating_count) AS revenue FROM restaurants ORDER BY revenue DESC LIMIT 1;

-- 3. How many restaurants are having rating more than the average rating?
SELECT COUNT(*) FROM restaurants
WHERE rating > (SELECT AVG(rating) FROM restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
SELECT *, (cost * rating_count) AS revenue
FROM restaurants WHERE LOWER(city) = 'delhi' ORDER BY revenue DESC LIMIT 1;

-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name, COUNT(*) AS num_restaurants
FROM restaurants GROUP BY name ORDER BY num_restaurants DESC LIMIT 1;

-- 6. Which restaurant chain has generated maximum revenue?
SELECT name, SUM(cost * rating_count) AS total_revenue
FROM restaurants GROUP BY name ORDER BY total_revenue DESC LIMIT 1;

-- 7. Which city has maximum number of restaurants?
SELECT city, COUNT(*) AS num_restaurants FROM restaurants GROUP BY city 
ORDER BY num_restaurants DESC LIMIT 1;

-- 8. Which city has generated maximum revenue all over india?
SELECT city, SUM(cost * rating_count) AS total_revenue
FROM restaurants GROUP BY city ORDER BY total_revenue DESC LIMIT 1;

-- 9. List 10 least expensive cuisines?
SELECT cuisine, AVG(cost) AS avg_cost
FROM restaurants GROUP BY cuisine ORDER BY avg_cost ASC LIMIT 10;

-- 10. List 10 most expensive cuisines?
SELECT cuisine, AVG(cost) AS avg_cost
FROM restaurants GROUP BY cuisine ORDER BY avg_cost desc LIMIT 10;

-- 11. What is the city is having Biryani as most popular cuisine
SELECT city, COUNT(*) AS biryani_count
FROM restaurants WHERE LOWER(cuisine) = 'biryani' GROUP BY city ORDER BY biryani_count DESC LIMIT 1;

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
SELECT name, city, (cost * rating_count) AS revenue
FROM restaurants WHERE name IN (SELECT name FROM restaurants GROUP BY name HAVING COUNT(*) = 1)  ORDER BY revenue DESC LIMIT 10;
