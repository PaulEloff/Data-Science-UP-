USE Daspoort_Clinic
GO


-- Question 1 Suggested Solution --
SELECT Name,Surname,CitizenShip,gender
FROM Patient 
WHERE Gender = 'male'
Go


-- Question 2 Suggested Solution -- 
SELECT Consult_No,Con_Hist_BMI, Con_Hist_UrineTest, Con_Consult_Date,Patient_No
FROM Consultation 
WHERE Con_Consult_Date BETWEEN '01-01-2013' AND '31-12-2013'
GO


-- Question 3 Suggested Solution --
SELECT *
FROM Consultation 
WHERE Con_Weight <65
GO

-- Question 4 Suggested Solution --
SELECT *
FROM Medical_Supply 
WHERE Med_Sup_Name LIKE '%u%' AND Med_Sup_Name LIKE '%p%'
GO

-- Question 5 Suggested Solution --
SELECT Patient_No, Name, Surname, CitizenShip, Gender, Date_Of_Birth
FROM Patient 
WHERE CitizenShip = 'South African' AND not CitizenShip = 'Dutch'
Go

-- Question 6 Suggested Solution --
SELECT *
FROM Medical_History 
WHERE Med_Hist_Weight  <= 65 and Med_Hist_BMI > 90
GO

-- Question 7 Suggested Solution --
SELECT *
FROM Medical_Supply 
WHERE Med_Sup_QtyAvailable = Med_Sup_Quantity AND Med_Sup_Unit <> 'N/A'
GO
