CREATE DATABASE COMPANY;
use company;

SHOW TABLES;
select * from sales;

-- 1.Find all orders shipped via 'Economy' mode with a total amount greater than Rs.25000.
select * from sales where Ship_Mode='Economy' and Total_Amount>25000;

-- 2.Retreive all sales data from 'Technology' category in 'Ireland' made after 2020-01-01.
select * from sales 
where Category='Technology' and Country='Ireland' and Order_Date>'2020-01-01';
-- 3. List the top 10 most profitable sales transactions in descending order.
select * from sales
order by Unit_Profit desc limit 10;

select * from sales
order by Unit_Profit desc limit 10,20;  -- skip 10 records,showing next 20 records

-- 4.find all customers whose name starts with 'j' and ends with 'n'.
select  Order_ID ,Customer_Name from sales 
where Customer_Name like 'J%n';

-- 5.Retrive all product names that contain 'Acco' anywhere in the name
select   Order_ID,Product_Name from sales
where Product_Name like '%Acco%';

-- 6.get the top 5 cities with the highest total sales amount
select City,sum(Total_Amount) as Total_Sales from sales
group by City
order by Total_Sales desc limit 5;

-- 7.display the second set of 10 records for customer_name and total_amount in desc order
select Customer_Name,Total_Amount from sales
order by Total_Amount desc limit 10,10;

-- 8.find the total revenue ,average unit cost, and total number of orders
select sum(Total_Amount) as total_revenue,avg(Unit_Cost) as average_unit_cost,count(Order_ID) as `total number of orders`from sales;

-- 9.count unique number of regions.
select count(distinct Region) as count from sales;

-- 10. find the number of orders placed by each customer.
select Customer_Name, count( Order_ID ) as `no of orders` from sales 
group  by Customer_Name
order by `no of orders` desc ;

-- 11. rank 5 products based on total sales using RANK().
select Product_Name,sum(Total_Amount) as Total_Sales,rank() over (order by sum(Total_Amount) desc) as Sales_Rank
from sales
group by(Product_Name) limit 5;