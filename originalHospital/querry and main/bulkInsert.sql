
use [ARAHOSPITAL]
GO

bulk insert ARAHOSPITAL.[dbo].[DEPARTMENT]
	from 'C:\study\DATA\originalHospital\hospotalCSV\department.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  DEPARTMENT

bulk insert ARAHOSPITAL.[dbo].[DOCTOR]
	from 'C:\study\DATA\originalHospital\hospotalCSV\doctor.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [DOCTOR]

bulk insert ARAHOSPITAL.[dbo].[SURGEON]
	from 'C:\study\DATA\originalHospital\hospotalCSV\surgeon.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [SURGEON]

bulk insert ARAHOSPITAL.[dbo].[PATIENT]
	from 'C:\study\DATA\originalHospital\hospotalCSV\patient2.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)
	select * from  [PATIENT]

	bulk insert ARAHOSPITAL.[dbo].[REFERRAL]
	from 'C:\study\DATA\originalHospital\hospotalCSV\referral.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

select * from  [REFERRAL]
drop

