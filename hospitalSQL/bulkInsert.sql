bulk insert HOSPITAL.[dbo].[DEPARTMENT]
	from 'C:\study\DATA\hospital\hospotalCSV\department.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

bulk insert HOSPITAL.[dbo].[DOCTOR]
	from 'C:\study\DATA\hospital\hospotalCSV\doctor.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

bulk insert HOSPITAL.[dbo].[SURGEON]
	from 'C:\study\DATA\hospital\hospotalCSV\surgeon.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

bulk insert HOSPITAL.[dbo].[PATIENT]
	from 'C:\study\DATA\hospital\hospotalCSV\patient2.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

	bulk insert HOSPITAL.[dbo].[REFERRAL]
	from 'C:\study\DATA\hospital\hospotalCSV\referral.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)
bulk insert HOSPITAL.[dbo].[WAITLIST]
	from 'C:\study\DATA\hospital\hospotalCSV\waitlist1.csv'
	with
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)