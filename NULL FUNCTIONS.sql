--------------------------------------------------------------------------------------------------------
          --------------NULL ---- FUNCTIONS --------------
		  ---ISNULL | ---COALESCE
--------------------------------------------------------------------------------------------------------

--FIND THE AVERAGE SCORES OF THE CUSTOMERS

SELECT
CustomerID,
Score,
AVG(Score)OVER () AvgScore,
AVG(COALESCE(Score , 0)) OVER() AvgScore2
FROM Sales.Customers