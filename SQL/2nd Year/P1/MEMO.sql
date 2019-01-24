Use Master
GO

If exists 
(Select * from sys.databases where name = 'ProductSales')

Drop Database ProductSales
GO

Create Database ProductSales
GO

Use ProductSales
GO


CREATE TABLE PROD_VENDOR(
	Vend_Code int primary key,
	Vend_Name varchar(50)NOT NULL,
	Vend_Contract varchar(50)NOT NULL,
	Vend_AreaCode varchar(50)NOT NULL,
	Vend_Phone varchar(50)NOT NULL,
	Vend_State varchar(50)NOT NULL,
	Vend_Order varchar(50)NOT NULL,
	
)

CREATE TABLE PROD_CUSTOMER(
	Cust_Code int primary key,
	Cust_Title varchar(50)NOT NULL,
	Cust_LName varchar(50)NOT NULL,
	Cust_FName varchar(50)NOT NULL,
	Cust_Initial varchar(50)NOT NULL,
	Cust_Address varchar(50)NOT NULL,
	Cust_City varchar(50)NOT NULL,
	Cust_State varchar(50)NOT NULL,
	Cust_Zipcode varchar(50)NOT NULL,
	Cust_Area varchar(50)NOT NULL,
	Cust_Phone varchar(50)NOT NULL,
	Cust_Balance money NOT NULL,
	
)

CREATE TABLE PROD_INVOICE(
	Inv_Number int primary key,
	Inv_Date datetime NOT NULL,
	Inv_Amount money NOT NULL,
	Inv_Tax money NOT NULL,
	Inv_Total money NOT NULL,
	Inv_Amt_Paid money NOT NULL,
	Inv_Balance money NOT NULL,
		Cust_Code int references PROD_CUSTOMER(Cust_Code)
		
)

CREATE TABLE PRODUCT(
	Prod_Code int primary key,
	Prod_Description text NULL,
	Prod_Indate datetime NULL,
	Prod_OnHand varchar(50) NULL,
	Prod_Min varchar(50) NULL,
	Prod_Price money NOT NULL,
	Prod_Discount float NULL,
	Prod_LastUpdate datetime NULL,
		Vend_Code int references PROD_VENDOR(Vend_Code)

)

CREATE TABLE LINE(
	Line_Number int primary key,
	Line_Units nchar(10) NOT NULL,
	Line_Price money NOT NULL,
	Line_Amount money NOT NULL,
		Prod_Code int references PRODUCT(Prod_Code),
		Inv_Number int references PROD_INVOICE(Inv_Number)
		
)