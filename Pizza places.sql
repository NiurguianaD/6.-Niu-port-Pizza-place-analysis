select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;

-- Total sale 
select round(sum(quantity * price),0) as Total_sale
from order_details t1 left join pizzas t2 
on t1.pizza_id=t2.pizza_id;

-- Count of solded pizzas 
select sum(quantity) as Total_pizzas
from order_details;

-- Count of pizzas by quarters
select datepart(quarter, date) as quarters, round(count(order_id),0) as num_of_orders
from orders
group by datepart(quarter, date)
order by num_of_orders desc;

-- Total Customers orders
select count(order_id) as Total_pizzas
from orders;

-- How many customers have each month?
select month(date) as Each_month, count(order_id) as Customers_Num
from orders
group by month(date)
order by Customers_Num desc;

-- Peak hours 
select DATEPART(hh, time) as Each_time, count(order_id) as Customers_Num
from orders
group by DATEPART(hh, time)
order by Customers_Num desc;

-- The most popular Pizza 
select top 1  t3.name, t1.pizza_id,  count(*) as Count_of_orders 
from order_details t1 join pizzas t2 on t1.pizza_id=t2.pizza_id
join pizza_types t3 on t2.pizza_type_id=t3.pizza_type_id
group by t1.pizza_id, t3.name
order by Count_of_orders desc;

-- Not popular pizzas 
select top 5  t3.name, t1.pizza_id,  count(*) as Count_of_orders 
from order_details t1 join pizzas t2 on t1.pizza_id=t2.pizza_id
join pizza_types t3 on t2.pizza_type_id=t3.pizza_type_id
group by t1.pizza_id, t3.name
order by Count_of_orders;  

-- How many pizzas are typically in an order?
select quantity, COUNT(*) as orders
FROM order_details 
group by quantity 
order by orders desc;


