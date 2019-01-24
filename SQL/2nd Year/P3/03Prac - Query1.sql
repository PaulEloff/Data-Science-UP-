use Daspoort_Clinic
go

select Name, Surname, CitizenShip, Gender
	from Patient
	where (Gender = 'Male')
	go