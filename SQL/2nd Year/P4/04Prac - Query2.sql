USE GotchaSystems
GO

SELECT b.Stock_Write_Off_Date, b.Stock_Write_Off_Description, b.Stock_Write_Off_Reason, b.Stock_Write_Off_Quantity, a.Stock_Item_Name, a.Stock_Item_Quantity
FROM dbo.Stock a LEFT OUTER JOIN dbo.StockWriteOff b ON b.Stock_Item_ID = a.Stock_Item_ID
GO