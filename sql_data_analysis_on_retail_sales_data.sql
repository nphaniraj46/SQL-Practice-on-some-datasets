CREATE DATABASE retail_sales_analysis_db;
USE retail_sales_analysis_db;


CREATE TABLE retail_sale (transaction_id INT , sale_date DATE, sale_time TIME, customer_id INT, gender VARCHAR(10), age INT, category VARCHAR(50), quantity INT, price_per_unit DECIMAL(10,2), cogs DECIMAL(10,2), total_sale DECIMAL(10,2));


DESC retail_sales;

SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SQL - Retail Sales Analysis_utf .csv' INTO TABLE retail_sales FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS (transaction_id, sale_date, sale_time, customer_id, gender, @age, category, @quantity, @price_per_unit, @cogs, @total_sale) SET age = NULLIF(TRIM(REPLACE(@age,'\r','')),''), quantity = NULLIF(TRIM(REPLACE(@quantity,'\r','')),''), price_per_unit = NULLIF(TRIM(REPLACE(@price_per_unit,'\r','')),''), cogs = NULLIF(TRIM(REPLACE(@cogs,'\r','')),''), total_sale = NULLIF(TRIM(REPLACE(@total_sale,'\r','')),''); -- loading dataset to this mysql

select * from retail_sales limit 10;

-- here i woudl like to search for how many prodocys do we have

select distinct(category) from retail_sales; 
-- we have 3 Categories Clothing,Beauty,Electronics thorugh this sales data


-- Data cleaning

-- let me check do we have any null values in the data

select * from retail_sales where transaction_id is null or sale_date is null or sale_time is null or customer_id is null or gender is null or age is null or category is null or quantity is null or cogs is null or total_sale is null;

-- here we have some null values in age,quantity,price per unit,cogs,total sale


-- here i decided to fill this age with average age and
set sql_safe_updates=0;

update retail_sales
join (
    select round(avg(age)) AS median_age
    from retail_sales
    where age is not null
) t
set retail_sales.age = t.median_age
where retail_sales.age is null;

select age from retail_sales where age is null; -- Null values are updated

-- If quantity is null that row is useless so iam dropping this data
delete from retail_sales where quantity is null;

-- price per unit this is also we cannot compute this on our own so iam deleting this as well

delete from retail_sales where price_per_unit is null;

-- same for this cogs as well we are not able to compute this on our won so removing

delete from retail_sales where cogs is null;

-- cross checking data if we have null values or not
select * from retail_sales where transaction_id is null or sale_date is null or sale_time is null or customer_id is null or gender is null or age is null or category is null or quantity is null or cogs is null or total_sale is null;
-- null values are managed




-- Data Analysis 



 -- lets see how many customer do we have after cleaning data
 
 select count(*) as total_sale from retail_sales; -- we have about 1997 customers after cleaning data
 
 -- how many categories of products we have
 
 select distinct category from retail_sales; 
 
 -- counting how many customers we have
 
 select count(distinct customer_id) as total_customers from retail_sales; -- we have 155 customers the data we have is having 155 unique customers
 



