Use Northwind
Go

--QUESTION 1

 SELECT * FROM Orders

 PIVOT (COUNT(employeeID) FOR employeeID IN ([1],[2],[3],[4],[5],[6],[7],[8],[9])) p
 

--QUESTION 2

  SELECT * FROM (SELECT customerID,employeeID FROM Orders) o
 PIVOT (COUNT(employeeID) FOR employeeID IN ([1],[2],[3],[4],[5],[6],[7],[8],[9])) p


--QUESTION 3

 SELECT

customerID,
 [1] as [Nancy],
 [2] as [Andrew],
 [3] as [Janet],
 [4] as [Margaret],
 [5] as [Steven],
 [6] as [Michael],
 [7] as [Robert],
 [8] as [Laura],
 [9] as [Anne]
 FROM (SELECT customerID,employeeID FROM Orders) o
  PIVOT (COUNT(employeeID) FOR employeeID IN ([1],[2],[3],[4],[5],[6],[7],[8],[9])) p
  
