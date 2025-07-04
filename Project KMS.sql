/*SELECT  [Row_ID],[Order_ID] ,[Order_Date] ,[Order_Priority] ,[Order_Quantity]
      ,[Sales]
      ,[Discount]
      ,[Ship_Mode]
      ,[Profit]
      ,[Unit_Price]
      ,[Shipping_Cost]
      ,[Customer_Name]
      ,[Province]
      ,[Region]--
      ,[Customer_Segment]
      ,[Product_Category]
      ,[Product_Sub_Category]
      ,[Product_Name]
      ,[Product_Container]
      ,[Product_Base_Margin]
      ,[Ship_Date]
  FROM [DSA_db].[dbo].[KMS_Sql_Case_Study2] order by Order_ID asc*/


  --Question 1-- (PRODUCT CATEGORY WITH HIGHEST SALES)--

  SELECT top 1 Product_Category, SUM(Sales) AS TotalSales 
  FROM KMS_Sql_Case_Study2 
  GROUP BY Product_Category ORDER BY TotalSales DESC

  --QUESTION 2--
 Select  Top 3 Region, sum(sales) as TotalSales from dbo.KMS_Sql_Case_Study2
 group by Region order by TotalSales desc
 Select  Top 3 Region, sum(sales) as TotalSales from dbo.KMS_Sql_Case_Study2
 group by Region order by TotalSales asc


  --Question 3--(TOTAL SALES OF APPLIANCES IN ONTARIO)
 Select Product_Sub_Category, sum(sales) as TotalSales 
 from dbo.KMS_Sql_Case_Study2 
 where Product_Sub_Category= 'Appliances'and Region='Ontario' 
 group by Product_Sub_Category

 -- QUESTION 4-- (BOTTOM 10 CUSTOMERS)
 SELECT tOP 10 Customer_Name, SUM(Sales) AS TotalSales 
 FROM KMS_Sql_Case_Study2 GROUP BY Customer_Name 
 ORDER BY TotalSales ASC


 --QUESTION 5-- (SHIPPING METHOD WITH THE MOST SHIPPING COST)
 SELECT TOP 1 Ship_Mode, SUM(Shipping_Cost) AS TotalShippingCost 
 FROM KMS_Sql_Case_Study2  GROUP BY Ship_Mode 
 ORDER BY TotalShippingCost DESC


 -- QUESTION 6-- 
 SELECT  Customer_Name,  SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit FROM KMS_Sql_Case_Study2 
 GROUP BY Customer_Name ORDER BY TotalProfit DESC
  
  --PRODUCTS THEY USUALLY PURCHASE---
 SELECT Customer_Name, Product_Category, COUNT(*) AS OrdersPlaced FROM KMS_Sql_Case_Study2 
 WHERE Customer_Name IN (SELECT TOP 10 Customer_Name FROM KMS_Sql_Case_Study2
 GROUP BY Customer_Name ORDER BY SUM(Profit) DESC) GROUP BY Customer_Name, Product_Category ORDER BY Customer_Name


 --QUESTION 7--
 SELECT TOP 1 Customer_Name, SUM(SALES) AS TOTALSALES 
 FROM KMS_Sql_Case_Study2 
 WHERE Customer_Segment = 'SMALL BUSINESS' 
 GROUP BY Customer_Name 
 ORDER BY TOTALSALES DESC


 --QUESTION 8--
 SELECT TOP 1 [Customer_Name], COUNT(*) AS OrderCount 
 FROM KMS_Sql_Case_Study2
 WHERE Customer_Segment = 'Corporate'  AND [Order_Date] BETWEEN '2009-01-01' AND '2012-12-31' 
 GROUP BY [Customer_Name] ORDER BY OrderCount DESC


--QUESTION 9--
SELECT TOP 1 Customer_Name, SUM(PROFIT) AS TOTAL_PROFIT
FROM KMS_Sql_Case_Study2 
WHERE Customer_Segment='CONSUMER'
GROUP BY Customer_Name ORDER BY TOTAL_PROFIT DESC

--QUESTION 10---

 SELECT Order_ID, Customer_Name, Customer_Segment 
 FROM KMS_Sql_Case_Study2 
 WHERE Order_ID IN (SELECT Order_ID FROM Order_Status WHERE [Status] = 'RETURNED' )

 
 SELECT DISTINCT TOP 10 R.Order_ID, Q.Customer_Name, Q.Customer_Segment FROM Order_Status R 
 INNER JOIN KMS_Sql_Case_Study2  Q ON R.Order_ID = Q.Order_ID ORDER BY Order_ID

 --QUESTION 11--

 SELECT Order_Priority, Ship_Mode, COUNT (*) AS TOTAL_ORDERS, AVG(SHIPPING_COST) AS AVG_SHIPPING_COST 
 FROM KMS_Sql_Case_Study2
 GROUP BY Order_Priority, Ship_Mode ORDER BY Order_Priority, Ship_Mode



 