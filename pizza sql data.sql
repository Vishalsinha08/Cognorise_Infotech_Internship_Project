use [PIZZA DB]
select*from pizza_sales
--total revenue  
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


--AVERAGE ORDER VALUE 

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales


---total pizza sold 
select sum(quantity) as total_pizza_sold from pizza_sales
 -- total order value 

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


--average pizza order per day 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales



--daily trends for order 


select DATENAME(DW,order_date)as order_day,count(distinct order_id)as total_order from pizza_sales
group by DATENAME(DW,order_date)

-- monthly trends 


select DATENAME(month,order_date) as month_name , count(distinct order_id) as total_order from pizza_sales 
group by DATENAME(month ,order_date)




--- hourly trends 
select DATEPART(HOUR,order_time)as order_hours,count ( distinct order_id) as total_orders 
from pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time)





-- % sales by pizza


SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

-- % of sales by size 


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales

group by pizza_size 
order by pizza_size 


-- total pizza sold by pizza category 
select pizza_category ,sum(quantity) as total_quantity_sold 
from pizza_sales
where month(order_date)=2 
group by pizza_category
order by total_quantity_sold desc 


select pizza_size, cast(sum(total_price) as decimal(10,2))as total_sales,cast(sum(total_price)*100/
(select sum(total_price) from pizza_sales WHERE DATEPART(quarter,order_date)=1) as decimal(10,2)) as pct 
from pizza_sales 
WHERE DATEPART(quarter,order_date)=1
group by pizza_size
order by pct desc

-- toal 5 best seller by total pizza sold 
select top 5 pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales 
group by pizza_name
order by total_pizza_sold 


-- total pizza sold by pizzza category 
select pizza_category,sum(quantity) as total_quantity_sold 
from pizza_sales
where MONTH(ORDER_DATE)=2
group by pizza_category
order by total_quantity_sold desc 

--bottom 5 best seller by total pizza selller 
select top 5 pizza_name,sum(quantity) as total_pizza_sale
from pizza_sales 

group by pizza_name 
order by total_pizza_sale desc 


--bottom 5 seller pizza sale 
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC