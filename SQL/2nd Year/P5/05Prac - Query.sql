USE Daspoort_Clinic
GO

SELECT a.Name, a.Surname, a.Gender, COUNT(b.Allergy_ID) AS 'Total_Allergies'
FROM dbo.Patient a INNER JOIN dbo.PatientAllergy b
ON a.Patient_No = b.Patient_No
WHERE a.Gender = 'Male'
GROUP BY a.Name, a.Surname, a.Gender
ORDER BY Total_Allergies ASC
GO