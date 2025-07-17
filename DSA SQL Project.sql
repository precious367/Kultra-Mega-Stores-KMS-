--------1. Which product category had the highest sales---------

select product_category, sum(sales)as highest_sales
from KMS_Inventory
group by product_category
order by highest_sales desc

----- Technology has the highest sales with a total of
-----------5984248  approximately------




-----2. What are the Top 3 and Bottom 3 regions in terms of sales?-----
------top 3  Region--

select top 3 region, sum(sales) as top3_region 
from KMS_Inventory
group by region
order by top3_region desc

------west was the top region in sales followed by 
-----ontario and pararie----

-----Bottom 3 regions---
select top 3 region, sum(sales) as botton3_region 
from KMS_Inventory
group by region
order by botton3_region asc
-----Nunavut was the least sales region, folloewd by 
------Northwest Territories and Yukon----




-----3. What were the total sales of appliances in Ontario?----

select product_sub_category, sum(sales) as Appliances_Ontario
from KMS_Inventory
where product_sub_category = 'Appliances' and Province = 'Ontario'
group by product_sub_category
order by Appliances_Ontario desc

----The total sales of appliances in Ontario is
------- approximately 202347---




-----4. Advise the management of KMS on what to do to increase the revenue from the bottom
---------------10 customers

select top 10 customer_name, sum(sales) as Revenue
from KMS_Inventory 
group by customer_name 
order by Revenue asc

----firstly identify the  bottom 10 customers and which category they fall under, 
--------(individual consumers, small businesses, and large corporate clients, wholesale)
---------as well as their prefrences, Identify their specific needs or budget limitations. 
-----Educate customers about product variety. also offer free product samples with small orders
-----offer limited-time deals only to these customers 
-----Provide cashback or gift incentives after a threshold spend
-----Recognize returning customers with early access to sales.
-----Encourage feedback by appreciating customers’ experiences and inviting suggestions for improvement 




-----5. KMS incurred the most shipping cost using which shipping method?-----
select Ship_Mode, sum(Shipping_Cost) as Incurred_cost
from KMS_Inventory
group by Ship_Mode
order by Incurred_cost desc

------KMS incurred the most shipping cost from Delivery Truck----




-----6. Who are the most valuable customers, and what products or services do they typically
-----purchase?

select top  10 * from (
select Customer_Name,Product_Category
from KMS_Inventory) as Valuable_customer
order by Product_category desc

--- TEN (10) most valuable customers are:
-----Liz Pelletier, Liz Pelletier, Tamara Dahlen, Sample Company A, Julie Creighton,
-----Helen Wasserman, Keith Dawkins, Roy Collins, Emily Phan, Anne Pryor.
---------They typically purchase Technology---




-----7. Which small business customer had the highest sales?----

select top 1
Customer_Name, sum( sales) as Highest_sales
from KMS_Inventory
where customer_segment = 'Small Business'
group by Customer_Name
order by Highest_sales desc

-----Dennis Kane had the highest sales with approximately 
-----------759678 sales------




----- 8. Which Corporate Customer placed the most number of orders in 2009 – 2012?---

select top 1 Customer_Name, sum( Order_Quantity) as Highest_order
from KMS_Inventory
where Customer_Segment ='Corporate' and order_date between'2009-01-01'and'2012-12-31'
group by Customer_Name
order by Highest_order desc

-----The coperate customer with most number of orders in 2009_2012 ---
----is Roy Skaria with 773 order quantity----




-----9. Which consumer customer was the most profitable one?-----

select top 1 Customer_Name, sum(profit) as Most_profitable
from KMS_Inventory
where Customer_segment ='Consumer'
group by customer_Name
order by Most_profitable desc

---- the MOST profitable customer is Emily Phan with 34005 approximately generated-----




------10. Which customer returned items, and what segment do they belong to?----
---Joining two tables together---

select distinct customer_name, customer_segment 
from KMS_inventory
JOIN 
order_status on KMS_inventory .order_id = order_status .order_id
where 
order_status .[status] = 'returned'

-----419 customers returned items from all segment----




------11. If the delivery truck is the most economical but the slowest shipping method and---
------Express Air is the fastest but the most expensive one, do you think the company---
------appropriately spent shipping costs based on the Order Priority? Explain your answer---

select ship_mode,order_priority,  sum(shipping_cost) as cost
from  KMS_inventory
group by ship_mode,order_priority
order by cost desc


-------Based on the data, I don’t think the company always spent shipping costs appropriately 
----in line with the order priority. For example, some Critical orders, which should have used 
----Express Air for faster delivery, were instead shipped using Delivery Truck and Regular Air,
---which are slower. This could cause delays in getting important orders to customers.
---Also, I noticed that some Low-priority orders were shipped using Regular Air and even Express Air,
---which are more expensive options. Since low-priority orders are not urgent, it would have been
---better and more economical to use Delivery Truck for those.
---Although some orders were shipped correctly based on their priority, these inconsistencies 
---show that the company could manage shipping costs better by matching shipping methods more closely
---with the urgency of each order.

