/*
Create one query that counts the number of allergies that each male patient has. 
Display the patient name, surname gender and total number of allergies that the patient has. 
Order by the patient with the least to the most number of allergies.
*/

USE Daspoort_Clinic
GO

SELECT a.Name,a.Surname,a.Gender, COUNT (c.Allergy_Name) Total 
FROM Patient a 
INNER JOIN PatientAllergy b ON a.Patient_No = b.Patient_No 
INNER JOIN Allergy c 
ON b.Allergy_ID = c.Allergy_ID 
WHERE a.Gender = 'male'
GROUP BY a.Name,a.Surname,a.Gender 
ORDER BY total  ASC
GO