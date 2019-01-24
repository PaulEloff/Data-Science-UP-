USE GotchaSystems
GO

SELECT b.Supplier_Name, a.Issue_ID, a.Issue_DateTime
FROM dbo.ExtraConsumablesIssued a RIGHT OUTER JOIN dbo.Supplier b ON b.Supplier_ID = a.Stock_Item_ID
GO
