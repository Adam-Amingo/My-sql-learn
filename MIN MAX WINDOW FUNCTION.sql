----WINDOW FUNCTION----------
-----MIN() MAX() ---------

--CALCULATE THE MOVING AVERAGE OF SALES FOR EACH PRODUCT OVER TIME
--INCLUDING ONLY THE NEXT ORDER
USE SalesDB
SELECT 
OrderID ,
ProductID,
OrderDate,
Sales ,
AVG(Sales) OVER (PARTITION BY ProductID ) AvgByProduct ,
AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate)  MovingAvg ,
AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING)  RollinggAvg 
FROM Sales.Orders