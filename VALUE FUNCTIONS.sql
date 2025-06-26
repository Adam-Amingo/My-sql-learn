 ---LEAD() LAG () FUNCTIONS
 --MoM MONTH-OVER-MONTH ANALYSIS

 --ANALYZE THE MOM PERFORMANCE BY FINDIGN THE PERCENTAGE IN SALES BETWEEN THE CURRENT AND PREVIOUS MONTH
 SELECT 
 * , 
 CurrentMonthSales - PreviousMonthSales AS MoM ,
 ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/ PreviousMonthSales * 100, 2)
 FROM (
 SELECT 
 MONTH(OrderDate) OrderMonth,
 SUM(Sales) CurrentMonthSales,
 LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousMonthSales
 FROM Sales.Orders
 GROUP BY 
  MONTH(OrderDate)
  ) t 


  --CUSTOMER RETENTION ANALYSIS
  ----ANALYSE CUSTOMER LOYALTY BY RANKING CUSTOMERS BASED ON THE AVERAGE NUMBER OF DAYS BETWEEN ORDERS
  SELECT 
  CustomerID,
  AVG(DaysUntilNextOrder),
  RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder), 99999)) RankAvg
  FROM(
  SELECT 
 CustomerID,
 OrderID,
 OrderDate CurrentOrder,
 LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
 DATEDIFF(day , OrderDate , LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
 FROM Sales.Orders
 ) t 
 GROUP BY 
	CustomerID



	---FIRST_VALUE()
	---LAST VALUE()

	---FIND THE LOWEST AND HIGHEST SALSE FOR EACH PRODUCT

	 