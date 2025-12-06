create database IDC_Pizza;
use IDC_Pizza;
show tables;
/*Phase 1: Foundation & Inspection*/
/*1.List all unique pizza categories (DISTINCT).*/
select distinct(category)
as Pizza_categories
from pizza_types;
/*2. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows. */
select pizza_type_id,name,
case when ingredients is null or ingredients = ''
then 'Missing Data'
else ingredients
end as ingredients
from pizza_types
limit 5;
/* 3. Check for pizzas missing a price (IS NULL).*/
select * from pizzas
where price is null;
/*Phase 2: Filtering & Exploration*/
/*4. Orders placed on '2015-01-01' (SELECT + WHERE).*/
select order_id,date
from orders
where date = '2015-01-01';
/*5. List pizzas with price descending.*/
select * from pizzas
order by price desc;
/*6. Pizzas sold in sizes 'L' or 'XL'.*/
select pizza_id,pizza_type_id,size
from pizzas
where size in ('L','XL');
/*7. Pizzas priced between $15.00 and $17.00.*/
select * from pizzas
where price between 15.00 and 17.00;
/*8. Pizzas with "Chicken" in the name.*/
select * from pizza_types
where name like '%Chicken%';
/*9. Orders on '2015-02-15' or placed after 8 PM.*/
select * from orders
where date = '2015-02-15' or time > '20:00:00';
/*Phase 3: Sales Performance*/
/*10. Total quantity of pizzas sold (SUM).*/
select sum(quantity) as Total_quantity_sold
from order_details;
/*11. Average pizza price (AVG).*/
select round(avg(price),2) as Average_price
from pizzas;
/*12. Total order value per order (JOIN, SUM, GROUP BY).*/
select o.order_id, round(sum(p.price * o.quantity),2) 
as Total_order_value
from order_details o 
join pizzas p 
on o.pizza_id = p.pizza_id
group by o.order_id;
/*13. Total quantity sold per pizza category (JOIN, GROUP BY).*/
select pt.category, sum(o.quantity) 
as Total_quantity
from order_details o 
join pizzas p 
on o.pizza_id = p.pizza_id
join pizza_types pt 
on p.pizza_type_id = pt.pizza_type_id
group by pt.category;
/*14. Categories with more than 5,000 pizzas sold (HAVING).*/
select pt.category, sum(o.quantity) 
as Total_quantity
from order_details o 
join pizzas p 
on o.pizza_id = p.pizza_id
join pizza_types pt 
on p.pizza_type_id = pt.pizza_type_id
group by pt.category
having sum(o.quantity) > 5000;
/* 15. Pizzas never ordered (LEFT/RIGHT JOIN).*/
select p.pizza_id,pt.name
from pizzas p
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
left join order_details o
on p.pizza_id = o.pizza_id
where o.pizza_id is null;
/*16. Price differences between different sizes of the same pizza (SELF JOIN).*/
select p1.pizza_type_id,p1.size,p2.size,
round(abs(p1.price-p2.price),2) as price_difference
from pizzas p1
join pizzas p2
on p1.pizza_type_id = p2.pizza_type_id
where p1.size <> p2.size and p1.size < p2.size
order by price_difference desc;