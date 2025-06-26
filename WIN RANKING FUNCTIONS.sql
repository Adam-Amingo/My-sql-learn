----WINDOW RANK FUNCTIONS------------------
-------------------------------------------
--RANK THE ORDERS BASED ON THER SALES FROM HIGHESET TO LOWEST
USE SalesDB
SELECT 
ProductID ,
OrderID,
Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRankRow,
RANK()       OVER(ORDER BY Sales DESC) RankSales,
DENSE_RANK() OVER (ORDER BY Sales DESC)
FROM 
Sales.Orders


--FIND THE TOP HIGHEST SALES FOR EACH PRODUCT
--USE CASE ---
---TOP-N-ANALYSIS---

SELECT *
FROM (
SELECT 
ProductID ,
OrderID,
Sales ,
ROW_NUMBER() OVER(PARTITION BY ProductId ORDER BY Sales DESC ) RankByProducts
FROM Sales.Orders)t WHERE RankByProducts = 1

---USE CASE ----
----BOTTOM-N-ANALYSIS----
--FIND THE LOWEST 2 CUSTOMERS BASED ON THEIR TOTAL SALES
USE SalesDB
SELECT
* 
FROM (
SELECT 
	CustomerID,
	SUM(Sales),
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS RankCustomers
FROM Sales.Orders
GROUP BY 
CustomerID )t WHERE RankCustomers < 2 

SELECT 
ROW_NUMBER() OVER(ORDER BY OrderId , OrderDate ) UniqueID ,
* 
FROM Sales.OrdersArchive

---find the product that fall within the highest 40% of prices


SELECT 
* 
FROM(
SELECT
Product,
Price,
CUME_DIST() OVER(ORDER BY Price DESC) DistRank
FROM Sales.Products
) t
WHERE DistRank <= 0.4
  


