USE ARAHOSPITAL;
GO
--1 querry how many parients cardio....something
SELECT COUNT(*) as refferedToCardio
FROM REFERRAL
WHERE departmentID = 2


----second querry


SELECT DATEDIFF(DAY,addedDate,FSADate) AS timeTaken, departmentName AS departmentName
INTO waitingTimeBeforeSeen
FROM WAITLIST 
JOIN DEPARTMENT ON Waitlist.departmentID=Department.departmentID
WHERE NOT FSADate = '2015-11-11'
;
SELECT * FROM waitingTimeBeforeSeen

SELECT departmentName, AVG(timeTaken) AS [AvgTimeTaken]
FROM waitingTimeBeforeSeen
GROUP BY departmentName
ORDER BY departmentName

DROP TABLE waitingTimeBeforeSeen



/*ALTER TABLE [dbo].[REFERRAL] ADD [PatientAge] INT
GO

UPDATE [dbo].[REFERRAL]
SET PatientAge = (DATEDIFF(DAY, patientDOB, ReferralDate) /365.25 )


SELECT * FROM REFERRAL

