# DSA-PROJECT-Kultra-Mega-Stores-Inventory-Analysis-
This project analyzes customer orders, sales trends, shipping costs, and returns for Kultra Mega Stores (KMS) using SQL. 
## Objectives

- Identify top product categories and best-performing regions
- Track sales of appliances in Ontario
- Analyze customer profitability
- Detect inefficiencies in shipping methods
- Understand return patterns by customer segment

  ## Tools Used

- SQL Server 
- Ms-Excel (CSV data)

  ## Files Included

## Key Analysis Topics

1. Highest-selling product category
2. Top 3 and bottom 3 regions by total sales
3. Total sales of appliances in Ontario
4. Bottom 10 customers and improvement strategy
5. Shipping cost by method
6. Most valuable customers and their preferences
7. Top small business customer by sales
8. Top corporate customer by number of orders
9. Most profitable consumer customer
10. Customers with returns and their segments
11. Evaluation of shipping cost vs. order priority

 ## SQL Queries & Results (Examples)
  ### 1. Product Category with the Highest Sale
  SELECT top 1 Product_Category, SUM(Sales) AS TotalSales 
  FROM KMS_Sql_Case_Study2 
  GROUP BY Product_Category ORDER BY TotalSales DESC
     

 ![Question one sql](https://github.com/user-attachments/assets/b55f33af-0ddc-41f1-a35d-b39715e524b7)

 ### 2. Top 3 and Bottom 3 regions in terms of sales
 Select  Top 3 Region, sum(sales) as TotalSales from dbo.KMS_Sql_Case_Study2
 group by Region order by TotalSales desc
 Select  Top 3 Region, sum(sales) as TotalSales from dbo.KMS_Sql_Case_Study2
 group by Region order by TotalSales asc

 ![Question 2](https://github.com/user-attachments/assets/bf945040-6d9b-4471-84c0-a96fc8aeab2b)

 ### 3. Total sales of Appliances in Ontario
 Select Product_Sub_Category, sum(sales) as TotalSales 
 from dbo.KMS_Sql_Case_Study2 
 where Product_Sub_Category= 'Appliances'and Region='Ontario' 
 group by Product_Sub_Category

 ![Question 3](https://github.com/user-attachments/assets/2e478201-439f-40c8-8335-ec3d9c6b9d5b)

 ### 4. Most Valuable Customers
 SELECT TOP 1 Customer_Name, SUM(SALES) AS TOTALSALES 
 FROM KMS_Sql_Case_Study2 
 WHERE Customer_Segment = 'SMALL BUSINESS' 
 GROUP BY Customer_Name 
 ORDER BY TOTALSALES DESC

 ![Question 7](https://github.com/user-attachments/assets/bf723ab6-ecab-45b2-afa1-b089bf178dbe)

 ## Insights
- The most profitable customer in the Consumer segment is EMILY PHAN, with a total profit of ₦34005.44 over the 2009–2012 period.
  This customer contributed significantly to the Consumer revenue.
- The data shows that Critical and High Priority orders are not typically shipped via Express Air. Instead, they are mostly sent through Regular Air, indicating that the fastest shipping option isn’t consistently used for    the high Priority orders.
- For Low and Medium Priority orders, Delivery Truck is used slightly more than Express Air, but Regular Air remains the most common method overall (despite being more expensive than the truck option)
- 

 ## Recommendations
- KMS should consider offering loyalty benefits or personalized deals to EMILY PHAN on of their most valuable customers to retain them.
- KMS should strengthen its logistics policy to ensure that: High-cost methods like Express Air are limited to Critical and High Priority orders. More economical options like Delivery Truck are used for Low and Medium         Priority orders.


