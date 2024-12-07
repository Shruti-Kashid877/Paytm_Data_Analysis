create database paytm;
use paytm;
select * from purchase_data;

# What does the "Category_Grouped" column represent, and how many unique categories are there?
select distinct Category_Grouped
from purchase_data;

# List the top 5 shipping cities in terms of the number of orders
select shipping_city, count(*) as order_count
from purchase_data
group by shipping_city
order by order_count desc
limit 5;

# Show me a table with all the data for products that belong to the "Electronics" category.
select *
from purchase_data
where category_grouped = 'Electronics';

# Filter the data to show only rows with a "Sale_Flag" of 'Yes'.
select *
from purchase_data
where sale_flag = 'On Sale';

# Sort the data by "Item_Price" in descending order. What is the most expensive item?
select *
from purchase_data
order by item_price desc
limit 1; 

# Apply conditional formatting to highlight all products with a "Special_Price_effective" value below $50 in red.
select *
from purchase_data
where special_price_effective < 50 and color = "red";

# find the total sales value for each category.
select category, sum(item_price) as total_sales_value
from purchase_data
group by category;

# The average "Quantity" sold for products in the "Clothing" category, grouped by "Product_Gender."
select product_gender, avg(quantity) as avg_quantity_sold
from purchase_data
where category_grouped = 'Clothing'
group by product_gender;

# Find the top 5 products with the highest "Value_CM1" and "Value_CM2" ratios.
select item_nm, value_cm1, value_cm2, 
       if(value_cm2>0,value_cm1 / value_cm2, null) as cm_ratio
from purchase_data
order by cm_ratio desc
limit 5;

# Identify the top 3 "Class" categories with the highest total sales.
select class, sum(item_price) as total_sales
from purchase_data
group by class
order by total_sales desc
limit 3;


# Find the total sales for each "Brand" and display the top 3 brands in terms of sales.
select brand, sum(item_price) as total_sales
from purchase_data
group by brand
order by total_sales desc
limit 3;

# Calculate the total revenue generated from "Electronics" category products with a "Sale_Flag" of 'Yes'
select sum(item_price) as total_revenue
from purchase_data
where category_grouped = 'Electronics'
and sale_flag = 'Yes';

# Identify the top 5 shipping cities based on the average order value (total sales amount divided by the number of orders) and display their average order values.
select shipping_city, 
       avg(item_price) as avg_order_value
from purchase_data
group by shipping_city
order by avg_order_value desc
limit 5;

# Determine the total number of orders and the total sales amount for each "Product_Gender" within the "Clothing" category.
select product_gender,
       count(*) as total_orders,
       sum(item_price) as total_sales_amount
from purchase_data
where category_grouped = 'Clothing'
group by product_gender;

# Calculate the percentage contribution of each "Category" to the overall total sales.
select category,
       sum(item_price) as category_sales,
       sum(item_price) / (select sum(item_price) from purchase_data) * 100 as percentage_contribution
from purchase_data
group by category;

# Identify the "Category" with the highest average "Item_Price" and its corresponding average price
select category,
       avg(item_price) as average_price
from purchase_data
group by category
order by average_price desc
limit 1;

# Find the month with the highest total sales revenue.
select month(order_date) as sales_month,
       sum(item_price) as total_sales_revenue
from purchase_data
group by sales_month
order by total_sales_revenue desc
limit 1;

#Calculate the total sales for each "Segment" and the average quantity sold per order for each segment.
select segment,
       sum(item_price) as total_sales,
       avg(quantity) as avg_quantity_per_order
from purchase_data
group by segment;



