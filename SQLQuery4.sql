SELECT 
CAST('123' AS INT)AS [String to Int],
CreationTime,
CAST( CreationTime AS DATE) AS [DateTIme to Date]
FROM Sales.Orders


----------------------------------------------------------------------------------------------------------
                         --------------DATE ---CCALCULATIONS  --------
----------------------------------------------------------------------------------------------------------
SELECT 
OrderID,
OrderDate,
DATEADD(day , -10 , OrderDate) AS TenDaysBefore,
DATEADD(month , 3 , OrderDate) AS ThreeMonthsLater,
DATEADD(year , 3 , OrderDate) AS ThreeYearsLater
FROM Sales.Orders


--CALCUALTE AGE OF EMPLOYEES
SELECT 
EmployeeID,
BirthDate,
DATEDIFF(YEAR  ,BirthDate, GETDATE()) AS [Current Age]
FROM Sales.Employees

--FIND THE AVERAGE SHIPPING DURATION IN DAYS FOR EACH MONTH
SELECT 
DATENAME (MONTH,OrderDate) AS OrderDate ,
AVG( DATEDIFF(DAY , OrderDate , ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY DATENAME (MONTH,OrderDate)

--TIME GAP ANALYSIS
--FIND THE NUMBER OF DAYS BETWEEN EACH ORDER AND PREVIOUS ORDER

SELECT 
OrderID , 
OrderDate  AS CurrentOrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF( DAY,LAG(OrderDate) OVER (ORDER BY OrderDate) , OrderDate) NoOfDays
FROM Sales.Orders



----------------------------------------------------------------------------------------------------------
                         --------------DATE ---VALIDATION  --------
----------------------------------------------------------------------------------------------------------

SELECT 
ISDATE('123') DateCheck,
ISDATE('2025-08-20')DateCheck2,
ISDATE('20-08-2025')DateCheck3,
ISDATE('2025')DateCheck4,
ISDATE('08')DateCheck5



