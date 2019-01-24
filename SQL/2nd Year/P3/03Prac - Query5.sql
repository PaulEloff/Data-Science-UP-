use Daspoort_Clinic
	go
	
select Patient_No, Name, Surname, CitizenShip, Gender, Date_Of_Birth
	from Patient
	where (CitizenShip = 'South African') and (CitizenShip != 'Dutch')
	go