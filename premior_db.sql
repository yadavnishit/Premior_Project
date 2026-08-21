-- creating Database
create database if not exists premior;
use premior_db;

-- creating table
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(30),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2)
);

select * from super_store;
-- count all the rows
select count(*) from super_store;
-- know the table details
describe super_store;

UPDATE super_store
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE super_store
MODIFY COLUMN order_date DATE;

UPDATE super_store
SET ship_date = STR_TO_DATE(ship_date, '%d-%m-%Y');

ALTER TABLE super_store
MODIFY COLUMN ship_date DATE;

describe super_store;

-- Top 10 profitable products 
select product_name , round(sum(profit),2) as total_profit
from super_store
group by product_name
order by total_profit desc
limit 10;

--  Top 10 customers by sales 

select customer_name , sum(sales) as total_sales
from super_store
group by customer_name
order by total_sales desc
limit 10;

--  Region-wise total sales
select region , sum(sales) as total_sales
from super_store
group by region
order by total_sales desc;

-- Category-wise average profit.
select category , round(sum(profit),2) as total_profit
from super_store
group by category
order by total_profit desc;

-- Highest discount category
select category , max(discount) as max_discount
from super_store
group by category
order by max_discount desc
limit 1;

-- Orders with negative profit
select *
from super_store
where profit < 0;

-- Monthly sales trend
select monthname(order_date) , sum(sales) as total_sales
from super_store
group by monthname(order_date);

-- Market-wise revenue analysis
select market , sum(sales) as revenue
from super_store
group by market
order by revenue desc;

-- Top-performing sub-categories
select sub_category , sum(sales) as total_sales 
from super_store
group by sub_category
order by total_sales desc
limit 10;

-- Ship mode usage analysis
select ship_mode , count(*) as total_order
from super_store
group by ship_mode
order by total_order desc;


-- Insights

-- Which market generates highest revenue?
-- > APAC generates the highest refenue from the entire market.

--  Which categories are least profitable?
-- > Furniture is least profitable from the entire category...

-- Which shipping mode is most commonly used?
-- > Standard Class mode is most frequently used for Shipping...

