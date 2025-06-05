--------------------------------------------------------------------------------------------------------
          --------------NULL ---- FUNCTIONS --------------
		  ---ISNULL | ---COALESCE
--------------------------------------------------------------------------------------------------------

--USE CASE 
 ----1. DATA AGGREGATION
--FIND THE AVERAGE SCORES OF THE CUSTOMERS

SELECT
CustomerID,
Score,
COALESCE(Score , 0) AS Score2,
AVG(Score)OVER () AvgScore,
AVG(COALESCE(Score , 0)) OVER() AvgScore2
FROM Sales.Customers

----USE CASE -------
-----2. MATHEMATICAL OPERATION
--------------------------------------------

---DISPLAY FULL NAME OF CUSTOMERS IN A SINGLE FIELD BY MERGING THEIR FIRST AND LAST NAMES ,
----AND ADD 10 BONUS POINTS TO EACH CUSTOMER'S SCORES

SELECT 
CustomerID,
FirstName,
LastName,
FirstName + ' ' + COALESCE(LastName , ' ') AS Full_Name,
Score ,
COALESCE(Score , 0 ) + 10 AS ScoreWithBonus
FROM Sales.Customers



----USE CASE -----------------------------------------------------
-----3.JOINS---------------------
----4 . HANDLE NULL BEFORE SORTING 
-------------------------------------------------------------


--SORT THE CUSTOMERS FORM THE LOWEST TO HIGHEST SCORES WITH NULLS APPEARING LAST

SELECT 
CustomerID,
Score 
FROM  Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END , Score

---------------NULLIF-------------------------
--FIND THE SALES PRICE FOR EACH ORDER BY DIVIDING SALES BY QUANTITY

SELECT 
OrderID,
Sales,
Quantity,
Sales /NULLIF(Quantity, 0) AS Sales_Price
FROM Sales.Orders

-----IS NULL ------------------------------
------IS NOT NULL --------------------------

---IDENTIFY THE CUSTOMERS WHO HAVE NO SCORES 


SELECT 
*
FROM Sales.Customers
WHERE Score IS NOT NULL

-----USE CASE ----- IS NULL------------
-------1 . ANTI JOIN--------------------

