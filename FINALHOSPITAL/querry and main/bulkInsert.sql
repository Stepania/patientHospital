

---Very Important notice. Because I am using bulk insert make sure you are using a correct path to a excel(csv) table!!!

use HospitalARA
GO

bulk insert HospitalARA.[dbo].[DEPARTMENT]
	from 'C:\study\DATA\readyToSubmit\tables\department.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  DEPARTMENT

bulk insert HospitalARA.[dbo].[DOCTOR]
	from 'C:\study\DATA\readyToSubmit\tables\doctor.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [DOCTOR]

bulk insert HospitalARA.[dbo].[SURGEON]
	from 'C:\study\DATA\readyToSubmit\tables\surgeon.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [SURGEON]

bulk insert HospitalARA.[dbo].[PATIENT]
	from 'C:\study\DATA\readyToSubmit\tables\patient2.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

	select * from  [PATIENT]

	bulk insert HospitalARA.[dbo].[REFERRAL]
	from 'C:\study\DATA\readyToSubmit\tables\referral.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [REFERRAL]
